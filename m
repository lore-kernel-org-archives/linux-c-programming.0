From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: Making "make" auto-strip and auto-clean
Date: Sun, 26 Feb 2006 15:54:03 +0000
Message-ID: <17409.53019.893568.840475@cerise.gclements.plus.com>
References: <200602260935.27292.samjnaa@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <200602260935.27292.samjnaa@gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Shriramana Sharma <samjnaa@gmail.com>
Cc: Linux C Programming List <linux-c-programming@vger.kernel.org>


Shriramana Sharma wrote:

> I would like make to always 
> 
> 1. strip the executable it created
> 2. remove the *.o files it created
> 
> after it has compiled the target executable. How do I do this? What do I add 
> to the makefile?

	CC = gcc
	CFLAGS = -g -O2
	LDFLAGS = -L.
	LOADLIBES = -lswe -lm

	default: pan strip clean
	
	pan: pan.o libswe.a
		$(CC) $(CFLAGS) -o $@ $< $(LDFLAGS) $(LOADLIBES)
	
	strip: pan
		strip $<
	
	clean:
		rm -f *.o

That way, "make" with no arguments will build the executable, strip it
and remove the object files, while you can perform individual steps by
specifying specific targets. E.g. to build the executable without
stripping or cleaning (once the project becomes non-trivial, you
/will/ want to do this), you can use "make pan".

A Makefile isn't supposed to just run a specific sequence of commands
every time; you can use a script for that. It's meant to allow you to:

+ Perform incremental recompilation (which requires leaving the
object files around).

+ Perform partial compilation (which requires breaking the
build process into individual targets).

+ Compile with non-default settings (which requires using variables
instead of hardcoding programs and options into the commands).

+ Handle large numbers of files without having to write a rule for
every file (by using pattern rules and automatic variables).

-- 
Glynn Clements <glynn@gclements.plus.com>
