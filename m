From: "Richard B. Johnson" <root@chaos.analogic.com>
Subject: Re: getprotobyname failure
Date: Wed, 26 Feb 2003 08:56:18 -0500 (EST)
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <Pine.LNX.3.95.1030226084926.2982A-100000@chaos>
References: <001d01c2dd96$eac076f0$3002a8c0@yigitcan>
Reply-To: root@chaos.analogic.com
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <001d01c2dd96$eac076f0$3002a8c0@yigitcan>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Yigit Can <yigit.can@karel.com.tr>
Cc: kernelnewbies <kernelnewbies@nl.linux.org>, linux c programming <linux-c-programming@vger.kernel.org>

On Wed, 26 Feb 2003, Yigit Can wrote:

> Hello,
> 
> I have a problem with getprotobyname() function.
> 
> I wrote a simple program that only uses getprotobyname function

[SNIPPED...]
getprotobyname() has nothing to do with linux-kernel so you should
not have sent your inquiry to the linux-kernel list. This is one
of the functions that is provided by your 'C' runtime library.

Here is an example of it working....

Script started on Wed Feb 26 08:46:40 2003

# cat xxx.c

#include <stdio.h>
#include <netdb.h>
#include <netinet/in.h>

 int main(void){

    struct protoent *protocol=NULL;
    protocol=getprotobyname("tcp");
    printf("\n RESULT : %02x \n",protocol->p_proto);

    return 0;
}

# gcc -Wall -o xxx -O2 xxx.c
# xxx

 RESULT : 06 

# # Works. Now you can `strace` it to see why yours doesn't.
# strace xxx
execve("./xxx", ["xxx"], [/* 32 vars */]) = 0
brk(0)                                  = 0x8049680
open("/etc/ld.so.preload", O_RDONLY)    = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=0, ...}) = 0
old_mmap(NULL, 0, PROT_READ|PROT_WRITE, MAP_PRIVATE, 3, 0) = 0
close(3)                                = 0
open("/lib/libc.so.6", O_RDONLY)        = 3
old_mmap(NULL, 4096, PROT_READ, MAP_PRIVATE, 3, 0) = 0x4000c000
munmap(0x4000c000, 4096)                = 0
old_mmap(NULL, 644232, PROT_READ|PROT_EXEC, MAP_PRIVATE, 3, 0) = 0x4000c000
mprotect(0x40097000, 74888, PROT_NONE)  = 0
old_mmap(0x40097000, 24576, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED, 3, 0x8b000) = 0x40097000
old_mmap(0x4009d000, 50312, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x4009d000
close(3)                                = 0
mprotect(0x4000c000, 569344, PROT_READ|PROT_WRITE) = 0
mprotect(0x4000c000, 569344, PROT_READ|PROT_EXEC) = 0
personality(PER_LINUX)                  = 0
getpid()                                = 2974
brk(0)                                  = 0x8049680
brk(0x8049a98)                          = 0x8049a98
brk(0x804a000)                          = 0x804a000
open("/etc/nsswitch.conf", O_RDONLY)    = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=1261, ...}) = 0
old_mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x400aa000
read(3, "#\n# /etc/nsswitch.conf\n#\n# An ex"..., 4096) = 1261
brk(0x804b000)                          = 0x804b000
read(3, "", 4096)                       = 0
close(3)                                = 0
munmap(0x400aa000, 4096)                = 0
open("/lib/libnss_nisplus.so.1", O_RDONLY) = -1 ENOENT (No such file or directory)
open("/usr/lib//libnss_nisplus.so.1", O_RDONLY) = -1 ENOENT (No such file or directory)
open("/opt/intel/compiler50/ia32/lib/libnss_nisplus.so.1", O_RDONLY) = -1 ENOENT (No such file or directory)
open("/usr/X11R6/lib/libnss_nisplus.so.1", O_RDONLY) = -1 ENOENT (No such file or directory)
open("/opt/Office50/lib/libnss_nisplus.so.1", O_RDONLY) = -1 ENOENT (No such file or directory)
open("/usr/java/lib/i686/libnss_nisplus.so.1", O_RDONLY) = -1 ENOENT (No such file or directory)
open("/etc/ld.so.cache", O_RDONLY)      = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=16707, ...}) = 0
old_mmap(NULL, 16707, PROT_READ, MAP_PRIVATE, 3, 0) = 0x400aa000
close(3)                                = 0
open("/usr/local/lib/libnss_nisplus.so.1", O_RDONLY) = -1 ENOENT (No such file or directory)
open("/lib/libnss_files.so.1", O_RDONLY) = 3
old_mmap(NULL, 4096, PROT_READ, MAP_PRIVATE, 3, 0) = 0x400af000
munmap(0x400af000, 4096)                = 0
old_mmap(NULL, 35156, PROT_READ|PROT_EXEC, MAP_PRIVATE, 3, 0) = 0x400af000
mprotect(0x400b7000, 2388, PROT_NONE)   = 0
old_mmap(0x400b7000, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED, 3, 0x7000) = 0x400b7000
close(3)                                = 0
mprotect(0x400af000, 32768, PROT_READ|PROT_WRITE) = 0
mprotect(0x400af000, 32768, PROT_READ|PROT_EXEC) = 0
open("/etc/protocols", O_RDONLY)        = 3
fcntl(3, F_GETFD)                       = 0
fcntl(3, F_SETFD, FD_CLOEXEC)           = 0
fstat(3, {st_mode=S_IFREG|0644, st_size=715, ...}) = 0
old_mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x400b8000
read(3, "#\n# protocols\tThis file describe"..., 4096) = 715
close(3)                                = 0
munmap(0x400b8000, 4096)                = 0
fstat(1, {st_mode=S_IFCHR|0600, st_rdev=makedev(3, 0), ...}) = 0
old_mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x400b8000
ioctl(1, TCGETS, {B38400 opost isig icanon echo ...}) = 0
write(1, "\n", 1
)                       = 1
write(1, " RESULT : 06 \n", 14 RESULT : 06 
)         = 14
munmap(0x400b8000, 4096)                = 0
_exit(0)                                = ?
# exit
exit
Script done on Wed Feb 26 08:47:08 2003


If you are not running from an ix86 PC, you may need to
link in another library when you compile the code. For instance,
on my Sun workstation, I have to do...


gcc -Wall -O2 -o xxx xxx.c -lsocket -lnsl

... to load all the libraries I need for networking. It's just
the same as when you do floating-point math, you need to load
the math libraries with '-lm'



Cheers,
Dick Johnson
Penguin : Linux version 2.4.18 on an i686 machine (797.90 BogoMips).
Why is the government concerned about the lunatic fringe? Think about it.


