From: Patrick <patrickC@puzzled.xs4all.nl>
Subject: assignment makes pointer from integer without a cast?
Date: Mon, 13 Dec 2004 01:52:39 +0100
Message-ID: <1102899159.7251.14.camel@guru.puzzled.xs4all.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

Hello,

New to the list and to C. Read O'Reilly's Practical C Programming and
another C book and am now trying to evolve beyond helloworld.c. When I
compile the snippet below, gcc-3.4.2 on Fedora Core 3 spits out:
test2.c:11: warning: assignment makes pointer from integer without a
cast
test2.c:12: warning: passing arg 1 of `usage' from incompatible pointer
type

I just can't figure out why it does that and how to fix it since my
pointer/casting/C knowledge is definitely lacking. The snippet does work
ok. Anyone care to enlighten me?

#include <stdio.h>

void usage(int *prog_ptr)
{
	fprintf(stdout,"progname is: %s\n",*prog_ptr);
}
	
int main(int argc, char *argv[])
{
	int *prog_ptr;
	prog_ptr = basename (argv[0]);
	usage(&prog_ptr);
	return(0);
}

TIA,
Patrick
