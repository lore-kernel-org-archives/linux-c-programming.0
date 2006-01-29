From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: Does GCC link only used functions?
Date: Sun, 29 Jan 2006 18:17:30 +0000
Message-ID: <17373.1722.484465.747500@cerise.gclements.plus.com>
References: <200601291438.17093.samjnaa@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <200601291438.17093.samjnaa@gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Shriramana Sharma <samjnaa@gmail.com>
Cc: Linux C Programming List <linux-c-programming@vger.kernel.org>


Shriramana Sharma wrote:

> I have a C program which #includes a header file which in turn #includes many 
> other header files. These header files are part of an open source library set 
> I got from the net.
> 
> Now I do not use all the functions in the various libraries, but the makefile 
> which came with the library of course has compile instructions for all the 
> libraries. I have modified the makefile to compile my program using those 
> libraries, but I did not remove the references to the libraries I knew I did 
> not use, for I feared that some error may be caused.
> 
> But later I experimented removing some of the superfluous ones from the 
> makefile and again "make"-d, and I got the same size executable as before.
> 
> So does this mean that GCC links only those functions from a library which I 
> call directly or indirectly through another called function in the course of 
> my program?

Are you referring to shared libraries or static libraries?

For a shared library, the linker simply stores references to the
library functions; it won't copy any object code into your executable. 
The loader will map the shared library into the process' address space
when the program is executed.

For a static library (which is just an archive of object files), the
linker will only use those object files which are necessary to satisfy
any outstanding references.

-- 
Glynn Clements <glynn@gclements.plus.com>
