From: "J." <mailing-lists@xs4all.nl>
Subject: getlogin(), prints ((NULL)) when printing multiple times in a row.
Date: Wed, 12 Mar 2003 23:49:26 +0100 (CET)
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.21.0303122335180.15008-100000@hestia>
References: <Pine.LNX.4.33.0303051227480.30291-100000@soochak.ncst.ernet.in>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.33.0303051227480.30291-100000@soochak.ncst.ernet.in>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

Hello,

I have ran into undefined behaviour. Not from my girl-friend this time,
but from my C program. (It's not that time of month, yet... :()

But, Everytime when I execute the following C code (bottom) from within a
shell loop as in:

while : ; do ./program ; done

it prints: ((NULL))

But when I excute it in the normal way:
./program
It prints perfectly ok: myusername

C Code.
#include <stdio.h>
#include <unistd.h>
#include <sys/types.h>

int main(void) {
 char *username = NULL;

 username = getlogin();
 /* for(;;) */
  printf("%s\n", username);

 return 0;
}

When I call the printf from a for loop in the native C code it also
starts to print ((NULL)) after a couple of loops.

I am writing a network program that gives a lot of status output when
working verbose. It doesn't look very good ((NULL)) everytime when the
output is above average.

Anyone ?

Thnkx 

J.

