From: "Srinivas G." <srinivasg@esntechnologies.co.in>
Subject: Assembler errors in optimization level 3 (-O3)  -  gcc (4.1.2)
Date: Wed, 25 Feb 2009 18:49:03 +0530
Message-ID: <F5BA82141F7AA94885B9643C77EEA5F210463D@mail.esntechnologies.co.in>
References: <F5BA82141F7AA94885B9643C77EEA5F210463C@mail.esntechnologies.co.in>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <linux-gcc-owner@vger.kernel.org>
Content-class: urn:content-classes:message
In-Reply-To: <F5BA82141F7AA94885B9643C77EEA5F210463C@mail.esntechnologies.co.in>
Sender: linux-gcc-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-gcc@vger.kernel.org, linux-c-programming@vger.kernel.org, linux-apps@vger.kernel.org
Cc: pradeep.rautela@gmail.com, Glynn Clements <glynn@gclements.plus.com>, Richard Dengler <rdengler@arcor.de>, uday.karan@gmail.com, brouits@free.fr

Dear All,

I have written an application where I used a few ASM statements in it.
The statements are very simple and they look like as shown below.

asm
(
	"next:\n\t"
#ifdef __x86_64__
	"pop %rax\n\t"
	"pop %rcx"		
#else
	"popl %eax\n\t"
	"popl %ecx"		
#endif
);

asm
(
	"xorl %eax, %eax\n\t"
	"cpuid\n\t"
	"cmpl $4, %eax\n\t" 	// check if cpuid supports leaf 4
	"jl .single_core\n\t"	// Single core
	"movl $4, %eax\n\t"	
	"movl $0, %ecx\n\t"	// start with index = 0; Leaf 4 reports
);					// at least one valid cache
level
asm
(
	"cpuid"
	: "=a" (Regeax)
	:
	: "%ebx", "%ecx", "%edx"
);		
asm
(
	"jmp .multi_core\n"
	".single_core:\n\t"
	"xor %eax, %eax\n"
	".multi_core:"
);

I am able to compile the application in optimization level 2 (-O2) where
as when I specify the optimization level (-O3) I end up with the
following errors.

{standard input}: Assembler messages:
{standard input}:275: Error: symbol `next' is already defined 
{standard input}:532: Error: symbol `.single_core' is already defined 
{standard input}:534: Error: symbol `.multi_core' is already defined 
{standard input}:579: Error: symbol `next' is already defined 
{standard input}:590: Error: symbol `next' is already defined 
{standard input}:614: Error: symbol `next' is already defined 
{standard input}:637: Error: symbol `next' is already defined 
{standard input}:690: Error: symbol `.single_core' is already defined 
{standard input}:692: Error: symbol `.multi_core' is already defined 
{standard input}:1007: Error: symbol `.single_core' is already defined 
{standard input}:1009: Error: symbol `.multi_core' is already defined 
{standard input}:1045: Error: symbol `.single_core' is already defined 
{standard input}:1047: Error: symbol `.multi_core' is already defined 
{standard input}:1083: Error: symbol `.single_core' is already defined 
{standard input}:1085: Error: symbol `.multi_core' is already defined 
{standard input}:1196: Error: symbol `.single_core' is already defined 
{standard input}:1198: Error: symbol `.multi_core' is already defined

I have searched the google and did not find any solution. However, I
have gone through the following link and there is no much luck to me.

http://lists.atrpms.net/pipermail/atrpms-users/2005-July/003451.html

One thing, I can mention here is, I did update the packages through YUM
command only. The system configuration is as follows.

1) DELL 64 Bit - Pentium(R) D CPU 3.00 GHz
2) 1 GB RAM
3) Linux - CENTOS - 5.2 with default kernel version - 2.6.18-92.el5
4) gcc version 4.1.2 20071124

Please suggest me a solution to getridof from the above errors.

Thanks in advance.

Thanks and Regards,
Srinivas G
