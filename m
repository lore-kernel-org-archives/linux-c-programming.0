From: Shanks <mshanks79@yahoo.co.in>
Subject: strange gcc warning
Date: Mon, 13 Jan 2003 09:57:55 -0800 (PST)
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20030113175755.71066.qmail@web8001.mail.in.yahoo.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

Hi,

Sample program: b.c
#include <stdio.h>
#include <errno.h>

void
my_print(int errno)
{
    printf("ERRNO: %d\n", errno);
}

int
main()
{
    int a = 10;
    errno = 0;
    my_print(a);
}

On compiling this code i get the warning:
b.c: In function `main':
b.c:15: warning: passing arg 1 of `my_print' makes pointer from integer without
a cast

On running the code i get a seg. fault. So i did some gdb'ing and got
(gdb) run 
Starting program: ./b
Breakpoint 1, my_print (__errno_location=0x19) <<<<<<<<
    at b.c, line...
(gdb)

From above i see that instead of getting a plain int its go the address.
But i would like it if someone explained it to me better.

Thanks in advance.
-S

__________________________________________________
Do you Yahoo!?
Yahoo! Mail Plus - Powerful. Affordable. Sign up now.
http://mailplus.yahoo.com
