From: =?UTF-8?B?VcSfdXIgQVRB?= <ataugur@gmail.com>
Subject: Re: Ever Increasing memory but not freed
Date: Thu, 28 Jan 2010 14:42:21 +0200
Message-ID: <8eec89ee1001280442x2c60f0a4gf8c9ec87d5e82610@mail.gmail.com>
References: <8eec89ee1001280220n88091bds74f974f45ad27087@mail.gmail.com> 
	<19297.33143.803345.127596@cerise.gclements.plus.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :from:date:message-id:subject:to:cc:content-type
         :content-transfer-encoding;
        bh=dFlnr7q8BPHNFnz4aPYuSEqB1XeivKD/pOiVPDQdeMI=;
        b=ntq07JBH8o80L0Zr3N61QBgzGgqDVgVEwomSvNsYHFVLRjOcvHetcJERIO4mw3QlBI
         XnoEo4cIm7nV6au0SZDdJVRs9gon38TFAF/fthrw+v7A9GIUI2yeLnBi2SA4ApR4qgQ6
         7Q2MgbwCjZ6dUSydPrYgOcv9WSG9pWdXf7S2E=
In-Reply-To: <19297.33143.803345.127596@cerise.gclements.plus.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Glynn Clements <glynn@gclements.plus.com>
Cc: linux-c-programming@vger.kernel.org

Thanks Glynn for your comments,

1) I have tried getrusage() command and it didn't work for slackware
12.2 (Linux 2.6.27.7 kernel). It was returning zero no matter what and
I read somewhere on the internet that it doesn't work for linux to get
memory usage. That's why I wrote my own function.
2) Yes, it is up to the kernel to release unused memory blocks on
demand but what I am wondering is why the program crashes every time
RSS reaches exactly the same amount which is almost 65MBs.
3) My system has 1GB of free RAM and free memory exists every time a
lot more than needed.
4) For some method calls RSS usage doesn't increase for subsequent
calls but for some it increases every time. Otherwise it wouldn't be a
problem if the memory usage stabilized on some level but it doesn't.
5) What is interesting is that in every method call RSS increases by
4K segments if it does. That made me think it is something related to
the newly created stack in each method call.

2010/1/28 Glynn Clements <glynn@gclements.plus.com>:
>
> U=C4=9Fur ATA wrote:
>
>> I have a problem with a deamon process that I have written. It is
>> listening some text commands on a local socket and does some
>> background job. I am using the same executable to send commands to t=
he
>> deamon process. What I observe is that it crashes after some time an=
d
>> it is only when RSS size reaches 65500K.
>>
>> I suspected of a heap problem at first and i have used valgrind to
>> track memory issues. It helped me to find some minor memory leaks bu=
t
>> it didn't affect much. Later I have written a logging method to log
>> current memory usage when called as below:
>>
>> void getMemoryUsage(char *position) {
>> =C2=A0 =C2=A0char result[BUFFER_SIZE + 1];
>> =C2=A0 =C2=A0char* command =3D
>> =C2=A0 =C2=A0"ps -eaf | grep BSM | grep -v grep | awk '{print $2}' |=
 xargs ps
>> -ly -p | tail -1";
>>
>> =C2=A0 =C2=A0FILE* ptr;
>>
>> =C2=A0 =C2=A0pthread_mutex_lock(&mutex_mem);
>> =C2=A0 =C2=A0if ((ptr =3D popen(command, "r")) !=3D NULL) {
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0fgets (result, BUFFER_SIZE, ptr);
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0int len =3D strlen(result);
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0result[len - 1] =3D '\0';
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0log_debug("|%s||%s|\n", position, result)=
;
>> =C2=A0 =C2=A0}
>> =C2=A0 =C2=A0pthread_mutex_unlock(&mutex_mem);
>>
>> =C2=A0 =C2=A0pclose(ptr);
>> }
>
> If you want to query memory usage for the current process, use
> getrusage().
>
>> Sample output for this is:
>>
>> [2010-01-28 12:31:19.162] |::loop1::||S =C2=A0 =C2=A0 0 13967 =C2=A0=
 =C2=A0 1 =C2=A00 =C2=A080 =C2=A0 0
>> 944 =C2=A05170 pipe_w pts/1 =C2=A0 =C2=A000:00:00 limit|
>>
>>
>> What i recoginezed is that the RSS value increases in each different
>> method call by 4K in the first call only.
>>
>> For example in the following command RSS increases by 4K but only in
>> the first time. When it is called again RSS does not change:
>> =C2=A0 =C2=A0char* end_of_command =3D strchr(message, KEY_SOCKET_SEP=
ERATOR);
>>
>> This is almost the same for every other method type. So I thought th=
at
>> it is because of the stack increase in each call or something.
>
> The RSS is the amount of physical memory allocated to a process.
> Executables and libraries are loaded on demand; the first time that
> you call a function, the page of the the executable or library
> containing that function will be mapped into memory. Similarly for
> accessing a static variable.
>
> Once loaded into memory, the page will remain in memory until the
> kernel needs the memory for something else. At which point, an
> unmodified page will be discarded while a modified page will be
> written to swap (assuming that swap is enabled; if it isn't, modified
> pages will remain in physical memory for the lifetime of the process)=
=2E
>
> Similarly, memory allocated via brk() or anonymous-mmap() will only b=
e
> backed by physical memory when accessed, and will be swapped out if
> it's needed for something else and hasn't been accessed recently.
>
>> The
>> problem is that RSS usage never drops when a method returns and keep=
s
>> increasing in each call
>
> That's quite typical if the system-wide demand for physical memory is
> low. The kernel will only try to recover physical memory from a
> process if it actually needs it for something else.
>
> Once a system has been running for a while, there will be very little
> "free" memory; most of it will have been allocated to something. E.g.
> here (on a very lightly-loaded system):
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 total =C2=A0 =C2=A0 =C2=A0 =
used =C2=A0 =C2=A0 =C2=A0 free =C2=A0 =C2=A0 shared =C2=A0 =C2=A0buffer=
s =C2=A0 =C2=A0 cached
> Mem: =C2=A0 =C2=A0 =C2=A0 2009460 =C2=A0 =C2=A01958756 =C2=A0 =C2=A0 =
=C2=A050704 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00 =C2=A0 =C2=A0 =C2=A0840=
84 =C2=A0 =C2=A01639176
> -/+ buffers/cache: =C2=A0 =C2=A0 235496 =C2=A0 =C2=A01773964
> Swap: =C2=A0 =C2=A0 =C2=A01048568 =C2=A0 =C2=A0 =C2=A021768 =C2=A0 =C2=
=A01026800
>
> 50MB "free" out of a total of 2GB. But 1.7GB is used for buffers and
> cache, which is memory which could easily be recovered if it was
> needed for something else.
>
>> thus reaching near 65M and program crashes.
>>
>> Does anybody have a clue on what might be causing that weird behavio=
ur?
>
> How much physical RAM do you have? 65M isn't a lot these days, but if
> that's all of your physical RAM, and you don't have swap enabled, the
> kernel will kill your process in order to recover its physical memory
> so that it can keep the system running.
>
> Physical memory usage seldom tells you anything about the behaviour o=
f
> the process unless system-wide demand for physical memory is high.
> Virtual memory usage is far more relevant. Look at the process'
> /proc/pid/maps file to see how it's using virtual memory.
>
> --
> Glynn Clements <glynn@gclements.plus.com>
>
--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
