From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: Access to Program Counter in C
Date: Fri, 19 Nov 2004 16:03:24 +0000
Message-ID: <16798.6476.77458.178618@cerise.gclements.plus.com>
References: <20041116163821.61564.qmail@web51902.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20041116163821.61564.qmail@web51902.mail.yahoo.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: A M <alim1993@yahoo.com>
Cc: linux-c-programming@vger.kernel.org


A M wrote:

> Does anybody know how to access the address of the
> current executing instruction in C while the program
> is executing? 

You can write a function which will return the saved EIP, i.e. the
address of the instruction immediately following the "call"
instruction:

	#include <stdio.h>
	
	static void *get_eip(int dummy)
	{
		return *(void **)((char *)&dummy - 4);
	}
	
	int main(void)
	{
		void *eip = get_eip(0);
		printf("%p\n", eip);
		return 0;
	}

This relies upon the fact that the saved EIP is immediately below the
first argument on the stack.

Test run:

	Value returned is $1 = (void *) 0x80483a8
	> disassemble main
	Dump of assembler code for function main:
	0x0804838c <main+0>:	push   %ebp
	0x0804838d <main+1>:	mov    %esp,%ebp
	0x0804838f <main+3>:	sub    $0x18,%esp
	0x08048392 <main+6>:	and    $0xfffffff0,%esp
	0x08048395 <main+9>:	mov    $0x0,%eax
	0x0804839a <main+14>:	sub    %eax,%esp
	0x0804839c <main+16>:	movl   $0x0,(%esp,1)
	0x080483a3 <main+23>:	call   0x8048384 <get_eip>
==>	0x080483a8 <main+28>:	mov    %eax,0xfffffffc(%ebp)
	0x080483ab <main+31>:	mov    0xfffffffc(%ebp),%eax
	0x080483ae <main+34>:	mov    %eax,0x4(%esp,1)
	0x080483b2 <main+38>:	movl   $0x80484e4,(%esp,1)
	0x080483b9 <main+45>:	call   0x80482a8
	0x080483be <main+50>:	mov    $0x0,%eax
	0x080483c3 <main+55>:	leave  
	0x080483c4 <main+56>:	ret    
	End of assembler dump.


-- 
Glynn Clements <glynn@gclements.plus.com>
