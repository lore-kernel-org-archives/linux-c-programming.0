From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: Ever Increasing memory but not freed
Date: Thu, 28 Jan 2010 12:22:15 +0000
Message-ID: <19297.33143.803345.127596@cerise.gclements.plus.com>
References: <8eec89ee1001280220n88091bds74f974f45ad27087@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <8eec89ee1001280220n88091bds74f974f45ad27087@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: =?UTF-8?B?VcSfdXIgQVRB?= <ataugur@gmail.com>
Cc: linux-c-programming@vger.kernel.org


U=C4=9Fur ATA wrote:

> I have a problem with a deamon process that I have written. It is
> listening some text commands on a local socket and does some
> background job. I am using the same executable to send commands to th=
e
> deamon process. What I observe is that it crashes after some time and
> it is only when RSS size reaches 65500K.
>=20
> I suspected of a heap problem at first and i have used valgrind to
> track memory issues. It helped me to find some minor memory leaks but
> it didn't affect much. Later I have written a logging method to log
> current memory usage when called as below:
>=20
> void getMemoryUsage(char *position) {
>    char result[BUFFER_SIZE + 1];
>    char* command =3D
>    "ps -eaf | grep BSM | grep -v grep | awk '{print $2}' | xargs ps
> -ly -p | tail -1";
>=20
>    FILE* ptr;
>=20
>    pthread_mutex_lock(&mutex_mem);
>    if ((ptr =3D popen(command, "r")) !=3D NULL) {
>        fgets (result, BUFFER_SIZE, ptr);
>        int len =3D strlen(result);
>        result[len - 1] =3D '\0';
>        log_debug("|%s||%s|\n", position, result);
>    }
>    pthread_mutex_unlock(&mutex_mem);
>=20
>    pclose(ptr);
> }

If you want to query memory usage for the current process, use
getrusage().

> Sample output for this is:
>=20
> [2010-01-28 12:31:19.162] |::loop1::||S     0 13967     1  0  80   0
> 944  5170 pipe_w pts/1    00:00:00 limit|
>=20
>=20
> What i recoginezed is that the RSS value increases in each different
> method call by 4K in the first call only.
>=20
> For example in the following command RSS increases by 4K but only in
> the first time. When it is called again RSS does not change:
>    char* end_of_command =3D strchr(message, KEY_SOCKET_SEPERATOR);
>=20
> This is almost the same for every other method type. So I thought tha=
t
> it is because of the stack increase in each call or something.

The RSS is the amount of physical memory allocated to a process.=20
Executables and libraries are loaded on demand; the first time that
you call a function, the page of the the executable or library
containing that function will be mapped into memory. Similarly for
accessing a static variable.

Once loaded into memory, the page will remain in memory until the
kernel needs the memory for something else. At which point, an
unmodified page will be discarded while a modified page will be
written to swap (assuming that swap is enabled; if it isn't, modified
pages will remain in physical memory for the lifetime of the process).

Similarly, memory allocated via brk() or anonymous-mmap() will only be
backed by physical memory when accessed, and will be swapped out if
it's needed for something else and hasn't been accessed recently.

> The
> problem is that RSS usage never drops when a method returns and keeps
> increasing in each call

That's quite typical if the system-wide demand for physical memory is
low. The kernel will only try to recover physical memory from a
process if it actually needs it for something else.

Once a system has been running for a while, there will be very little
"free" memory; most of it will have been allocated to something. E.g.=20
here (on a very lightly-loaded system):

             total       used       free     shared    buffers     cach=
ed
Mem:       2009460    1958756      50704          0      84084    16391=
76
-/+ buffers/cache:     235496    1773964
Swap:      1048568      21768    1026800

50MB "free" out of a total of 2GB. But 1.7GB is used for buffers and
cache, which is memory which could easily be recovered if it was
needed for something else.

> thus reaching near 65M and program crashes.
>=20
> Does anybody have a clue on what might be causing that weird behaviou=
r?

How much physical RAM do you have? 65M isn't a lot these days, but if
that's all of your physical RAM, and you don't have swap enabled, the
kernel will kill your process in order to recover its physical memory
so that it can keep the system running.

Physical memory usage seldom tells you anything about the behaviour of
the process unless system-wide demand for physical memory is high.=20
Virtual memory usage is far more relevant. Look at the process'
/proc/pid/maps file to see how it's using virtual memory.

--=20
Glynn Clements <glynn@gclements.plus.com>
--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
