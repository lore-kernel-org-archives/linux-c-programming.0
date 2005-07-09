From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: x86 Endiannes and libc printf
Date: Sat, 9 Jul 2005 18:43:02 +0100
Message-ID: <17104.3238.592473.67933@gargle.gargle.HOWL>
References: <a3c4234105070613154993e652@mail.gmail.com>
	<42CD1B92.1070806@conectiva.com.br>
	<55800.62.38.141.148.1120762110.squirrel@webmail.wired-net.gr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <55800.62.38.141.148.1120762110.squirrel@webmail.wired-net.gr>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: nanakos@wired-net.gr
Cc: linux-c-programming@vger.kernel.org


Nanakos Chrysostomos wrote:

> i am searching for a few hours now the endianness in the x86
> environment,and i have the following
> snippets of code,which in some places i cant understand.Please help me!!!
> 
> endian.c
> ---------
> #include <stdio.h>
> #include <fcntl.h>
> #include <sys/types.h>
> 
> 
> int main()
> {
>         char *filename= "endian.txt";
>         unsigned long buf;
>         char *k=(char *)&buf;
>         int fd;
> 
>         fd = open("makis",O_RDONLY);
> 
>         read(fd,&buf,4);
> 
>         printf("%.4s\n",&buf);
>         printf("%p\n",buf);
>         printf("&buf: %p %#x %p\n",&buf,*k,k);
>         return 0;
> }
> 
> endian.txt
> ----------
> DBCA
> 
> 
> #./read
> DCBA
> 0x41424344
> &buf: 0xbffff8b0 0x44 0xbffff8b0
> #
> 
> 
> In the first printf everything is fine.In the second printf we see that
> the 0x44,0x43,0x42,0x41 byte-data is printed in the revserse order,while
> we can see
> that in memory it is in the right order after the read system call.Why
> this happens?Is it being internal in printf???

No. x86 is little-endian, which means that multi-byte integers are
stored in memory with the lowest byte first, e.g. the integer
0x41424344 (1094861636 decimal) is stored 0x44,0x43,0x42,0x41.

> The same as above.Should i assume that an internal operation in printf is
> doing this???

No. It's the way that the CPU reads/writes integers to/from memory.

> I also used the above assembly example,to see what
> happens.Memory-to-memory movements (with push & pop) dont inherit the
> little-endian way.Is this
> happens only from memory-to-register and the opposite????

Yes. Endianness doesn't matter if you are just moving bytes around. It
only matters if you are treating a block of 2/4/8 bytes as a
16/32/64-bit integer.

-- 
Glynn Clements <glynn@gclements.plus.com>
