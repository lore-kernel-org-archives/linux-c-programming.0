From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: reading elf section data
Date: Mon, 12 Nov 2007 15:56:55 +0000
Message-ID: <18232.30663.274365.914938@cerise.gclements.plus.com>
References: <473856E2.5050707@gmail.com>
	<18232.12586.211596.82841@cerise.gclements.plus.com>
	<47389A8B.8030108@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <47389A8B.8030108@gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: zaphod001@gmail.com
Cc: linux-c-programming@vger.kernel.org


Gery wrote:

> i put some structure with gcc attribute to special section named ".my_sec"
> The structure is like
> struct abc {
> char *a;
> char *b;
> };
> and global variable is
> struct abc klm = { "this is 1st string", "this is 2nd string" };

Like this:

struct abc klm __attribute__ ((section (".my_sec"))) = { "this is 1st string", "this is 2nd string" };

?

> Which utility can show me just the data of that section?

	$ objdump -j .my_sec -d foo.o

	foo.o:     file format elf32-i386
	
	Disassembly of section .my_sec:
	
	00000000 <klm>:
	   0:	00 00 00 00 13 00 00 00                             ........

Bear in mind that the structure only contains the pointers, not the
strings themselves. String literals used as values are stored in the
.rodata section. If you want them elsewhere, you'll have to store them
in named variables, e.g.:

	static char s1[] __attribute__ ((section (".my_sec"))) = "this is 1st string";
	static char s2[] __attribute__ ((section (".my_sec"))) = "this is 2nd string";
	struct abc klm __attribute__ ((section (".my_sec"))) = { s1, s2 };

	$ objdump -j .my_sec -d foo.o

	foo.o:     file format elf32-i386
	
	Disassembly of section .my_sec:
	
	00000000 <s1>:
	   0:	74 68 69 73 20 69 73 20 31 73 74 20 73 74 72 69     this is 1st stri
	  10:	6e 67 00                                            ng.
	
	00000013 <s2>:
	  13:	74 68 69 73 20 69 73 20 32 6e 64 20 73 74 72 69     this is 2nd stri
	  23:	6e 67 00 00 00                                      ng...
	
	00000028 <klm>:
	  28:	00 00 00 00 13 00 00 00                             ........

-- 
Glynn Clements <glynn@gclements.plus.com>
