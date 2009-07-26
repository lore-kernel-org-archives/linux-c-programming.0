From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: memory address represented as a string
Date: Sun, 26 Jul 2009 17:23:48 +0100
Message-ID: <19052.33556.357554.573002@cerise.gclements.plus.com>
References: <2a46ebd60907260039g290268b7i3183ee785994b86@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <2a46ebd60907260039g290268b7i3183ee785994b86@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Saurabh Sehgal <saurabh.r.s@gmail.com>
Cc: linux-c-programming@vger.kernel.org


Saurabh Sehgal wrote:

> I had a quick question:
> 
> Let's say I design a function with the signature:
> 
> void * foo( char * addr ) ; ,
> 
> where addr is a string that represents a valid memory address  ...
> so the way someone can call this function is ...
> 
> char * addr = "0xae456778" // assume this is a valid memory address on
> the machine
> foo( addr ) ;
> 
> Is it possible to take this address in string form, and assign it to
> an actual pointer of void * type ?
> I want the function "foo" to return a pointer pointing to the memory
> location as indicated
> by the string passed in.

Yes:

	const char *addr = "0xae456778";
	void *ptr;

	sscanf(addr, "%p", &ptr);

The string needs to be in the format used by printf("%p"), which is
platform-specific.

Alternatively:

	ptr = (void *) strtoull(addr, NULL, 16);

However, strtoull() isn't in C89, although it's in C99 and POSIX.

Using strtoul() will work if sizeof(long) >= sizeof(void *). AFAIK,
this is true on all versions of Linux, but may not be true on some
other 64-bit platforms. On particular, it isn't true on Win64, where
"long" is only 32 bits.

-- 
Glynn Clements <glynn@gclements.plus.com>
