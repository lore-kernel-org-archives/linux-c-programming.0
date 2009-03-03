From: "Srinivas G." <srinivasg@esntechnologies.co.in>
Subject: RE: Assembler errors in optimization level 3 (-O3)  -  gcc (4.1.2)
Date: Tue, 3 Mar 2009 20:03:19 +0530
Message-ID: <F5BA82141F7AA94885B9643C77EEA5F21348D8@mail.esntechnologies.co.in>
References: <F5BA82141F7AA94885B9643C77EEA5F210463C@mail.esntechnologies.co.in>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <linux-gcc-owner@vger.kernel.org>
Content-class: urn:content-classes:message
Sender: linux-gcc-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Srinivas G." <srinivasg@esntechnologies.co.in>, linux-gcc@vger.kernel.org, linux-c-programming@vger.kernel.org, linux-apps@vger.kernel.org
Cc: pradeep.rautela@gmail.com, Glynn Clements <glynn@gclements.plus.com>, Richard Dengler <rdengler@arcor.de>, uday.karan@gmail.com, brouits@free.fr

> asm
> (
> 	"next:\n\t"
> #ifdef __x86_64__
> 	"pop %rax\n\t"
> 	"pop %rcx"
> #else
> 	"popl %eax\n\t"
> 	"popl %ecx"
> #endif
> );
> 
> asm
> (
> 	"xorl %eax, %eax\n\t"
> 	"cpuid\n\t"
> 	"cmpl $4, %eax\n\t" 	// check if cpuid supports leaf 4
> 	"jl .single_core\n\t"	// Single core
> 	"movl $4, %eax\n\t"
> 	"movl $0, %ecx\n\t"	// start with index = 0; Leaf 4 reports
> );					// at least one valid cache
level
> asm
> (
> 	"cpuid"
> 	: "=a" (Regeax)
> 	:
> 	: "%ebx", "%ecx", "%edx"
> );
> asm
> (
> 	"jmp .multi_core\n"
> 	".single_core:\n\t"
> 	"xor %eax, %eax\n"
> 	".multi_core:"
> );
> 

Dear All,

The label redefinition in inline ASM was fixed. The actual error is due
to the function was called more  than 3 times and in every place the
code was replaced. So, it was showed the redefinition error. However, by
looking at the following paragraph and links, I have fixed the error.

GCC allows (and requires) you to specify register constraints in your
inline assembly code, so the optimizer always know about it; thus,
inline assembly code is really made of patterns, not forcibly exact
code.

Thus, you can put your assembly into CPP macros, and inline C functions,
so anyone can use it in as any C function/macro. Inline functions
resemble macros very much, but are sometimes cleaner to use. Beware that
in all those cases, code will be duplicated, so only local labels (of 1:
style) should be defined in that asm code. However, a macro would allow
the name for a non local defined label to be passed as a parameter (or
else, you should use additional meta-programming methods). Also, note
that propagating inline asm code will spread potential bugs in them; so
watch out doubly for register constraints in such inline asm code.

http://lists.apple.com/archives/xcode-users/2005/apr/msg00107.html

Thanks and Regards,
Srinivas G

