From: Jagadeesh Bhaskar P <jbhaskar@hclinsys.com>
Subject: help for using setjmp and longjmp functions
Date: Mon, 20 Dec 2004 12:38:11 +0530
Message-ID: <1103526490.4005.3.camel@myLinux>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linux C Programming <linux-c-programming@vger.kernel.org>

Hi,
	I tried writing a simple program to findout usage of setjmp and
longjmp() functions. The program ran in an infinite loop showing some
warnings. What is the problem? Can someone help me depicting the
behaviour of the setjmp and longjmp functions

/******** beginning of code *************/

#include <setjmp.h>
jmp_buf jmpbuffer;

void bar(void)
{
	printf("inside bar\n");
	longjmp(jmpbuffer, 1);
}

void foo(void)
{
	printf("before calling bar()\n");
	bar();
	printf("after calling bar()\n");
}
int
main(void)
{
	printf("before calling foo()\n");
	if(setjmp(jmpbuffer)!=0)
		perror("error setting");
	foo();
	printf("after foo()\n");

	return 0;
}
/**************** end of code ***********/

Hoping for help

TIA..

-- 
With regards,

Jagadeesh Bhaskar P

