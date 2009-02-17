From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: strtok, bus error
Date: Tue, 17 Feb 2009 20:15:21 +0000
Message-ID: <18843.6873.192794.250251@cerise.gclements.plus.com>
References: <125035.76273.qm@web63404.mail.re1.yahoo.com>
	<499A3746.1070502@free.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <499A3746.1070502@free.fr>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ben <brouits@free.fr>
Cc: linux-c-programming@vger.kernel.org


ben wrote:

> > i'm trying to do pretty simple replacement using strtok.
> > but it looks like i have missed some subtle difference between the two following 
> >   
> >   char src[]  = "hello world #";
> >   char *other = "hello world #";
> 
> i don't know if it is a compiler feature (storage behavior into the DATA
> segment), or a linux kernel feature, or if it is specified in ANSI, but
> the second way leads to pointing to a _constant_ string. If someone can
> enlighten...

ANSI C says that string literals "may" be read-only. On platforms with
memory protection they usually are read-only.

On Linux, string literals are stored in the "rodata" segment, which is
read-only, and thus can be shared between all processes which are
using a given executable or shared library.

You can list the segments which make up an executable or shared
library using "objdump -h", e.g.:

	$ objdump -h /bin/ls
	
	/bin/ls:     file format elf32-i386
	
	Sections:
	Idx Name          Size      VMA       LMA       File off  Algn
	  0 .interp       00000013  08048174  08048174  00000174  2**0
	                  CONTENTS, ALLOC, LOAD, READONLY, DATA
	  1 .note.ABI-tag 00000020  08048188  08048188  00000188  2**2
	                  CONTENTS, ALLOC, LOAD, READONLY, DATA
	  2 .hash         00000298  080481a8  080481a8  000001a8  2**2
	                  CONTENTS, ALLOC, LOAD, READONLY, DATA
	...
	 12 .text         0000fbb4  08049880  08049880  00001880  2**4
	                  CONTENTS, ALLOC, LOAD, READONLY, CODE
	...
	 14 .rodata       00003d3c  08059460  08059460  00011460  2**5
	                  CONTENTS, ALLOC, LOAD, READONLY, DATA
	...
	 23 .data         0000024c  0805f160  0805f160  00016160  2**5
	                  CONTENTS, ALLOC, LOAD, DATA
	 24 .bss          0000046c  0805f3c0  0805f3c0  000163ac  2**5
	                  ALLOC
	 25 .comment      00000bd0  00000000  00000000  000163ac  2**0
	                  CONTENTS, READONLY

[snipped]

The main ones are text, rodata, data, and bss.

The text segment holds code, and is read-only and executable (CODE
flag).

The others hold static data: global variables, "static" local
variables, string literals, and intialisers for automatic
(non-"static" local) arrays.

Read-only data (literals, initialisers, "const" variables) goes into
the rodata segment, which is read-only.

Mutable variables with explicit initialisers go into the data segment.

Mutable variables without initialisers (i.e. implicitly initialised to
zero) go into the bss segment. As the entire bss segment is initially
zero, it doesn't need to be stored in the file (this is indicated by
the lack of the CONTENTS, LOAD, and CODE/DATA flags).

The other segments tend to be architecture-specific.

-- 
Glynn Clements <glynn@gclements.plus.com>
