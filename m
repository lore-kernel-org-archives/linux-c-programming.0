From: Ankit Jain <ankitjain1580@yahoo.com>
Subject: Static memory allocation
Date: Fri, 24 Sep 2004 11:57:08 +0100 (BST)
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20040924105708.5067.qmail@web52904.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: gcc <gcc-help@gcc.gnu.org>, linux prg <linux-c-programming@vger.kernel.org>

hi

well i had tried to enquire about this problem

i was not able to find the solution. i know it workds
when i declare the array globally. i know if i use
malloc it will work and i am using the same in my
program

but this question is again in my mind that what could
be the reason that it dosent work here on my system
because last time when i asked this question on some
sytem it was able to run which they said that they
have less emory then that of my system

my system config.: redhat linux 9.0 +512 RAM
this is what my terminal displays

[ankit@Ankit fft]$ cat try2.c
#include <stdio.h>
int main()
{
double a[1450][1450];
 a[1450][0]=999.999;
 printf("%lf\n",a[1450][0]);
 return 0;
}
[ankit@Ankit fft]$ gcc try2.c
[ankit@Ankit fft]$ ./a.out
Segmentation fault
[ankit@Ankit fft]$

i just want to know that if there is some problem
related to stack how t oget rid of it

thanks

ANkit




________________________________________________________________________
Yahoo! Messenger - Communicate instantly..."Ping" 
your friends today! Download Messenger Now 
http://uk.messenger.yahoo.com/download/index.html
