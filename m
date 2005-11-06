From: fabio <fabio@crearium.com>
Subject: lseek question
Date: Sat, 05 Nov 2005 19:14:59 -0600
Message-ID: <436D5913.504@crearium.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-c-programming@vger.kernel.org

Hello people,

What's wrong with this code:

-bash-3.00$ cat lseek.c ; wc -l datafile ; gcc lseek.c ; ./a.out 1000
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
main(int argc, char *argv[])
{
        FILE *fp;
        int offset=atoi(argv[1]);
        fp=fopen("datafile","r");
        lseek(fp,offset,SEEK_SET);
        char foo[256];
        fscanf(fp,"%s\n",foo);
        printf("%s\n",foo);
}

 1000000 datafile
lseek.c: In function `main':
lseek.c:9: warning: passing arg 1 of `lseek' makes integer from pointer 
without a cast
record:0


The record number 1000 is called "record:10000" :). According to truss:

-bash-3.00$ truss ./a.out 1000 2>&1 |more
execve("a.out", 0xFFBFF1D4, 0xFFBFF1E0)  argc = 2
 argv: ./a.out 100
[snip]
open("datafile", O_RDONLY)                      = 3
lseek(-13187092, 1000, SEEK_SET)                Err#9 EBADF
fstat64(3, 0xFFBFEC30)                          = 0
brk(0x00020A68)                                 = 0
brk(0x00024A68)                                 = 0
fstat64(3, 0xFFBFEAD8)                          = 0
ioctl(3, TCGETA, 0xFFBFEBBC)                    Err#25 ENOTTY
read(3, " r e c o r d : 0\n r e c".., 8192)     = 8192
ioctl(1, TCGETA, 0xFFBFE1FC)                    Err#22 EINVAL
fstat64(1, 0xFFBFE270)                          = 0
fstat64(1, 0xFFBFE118)                          = 0
record:0
write(1, " r e c o r d : 0\n", 9)               = 9
llseek(3, 0xFFFFFFFFFFFFE009, SEEK_CUR)         = 9
_exit(141956)


Thanks for help.

