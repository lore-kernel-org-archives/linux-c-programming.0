From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: C or C++
Date: Tue, 22 May 2007 19:10:56 +0100
Message-ID: <18003.12848.409694.190317@cerise.gclements.plus.com>
References: <463B1244.6080802@gmail.com>
	<17979.14634.85216.727844@cerise.gclements.plus.com>
	<464B0AC1.2070501@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <464B0AC1.2070501@gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Shriramana Sharma <samjnaa@gmail.com>
Cc: Linux C Programming List <linux-c-programming@vger.kernel.org>


Shriramana Sharma wrote:

> > If it's likely to be useful to other libraries, there's a strong
> > incentive to use C, or at least to provide a C API (the standard
> > implementation of GLU is written in C++, although the public API only
> > uses C).
> 
> Would it be enough if I ensure that the API header file does not contain 
> any C++-only usages for such a library internally implemented in C++ to 
> be linkable from a C program or library?
> 
> Or would there be problems with the C linker not being able to resolve 
> references from the C object code to C++ symbols in the library? (I hope 
> I got that terminology correct.)

You can't link C code against C++ symbols.

If you want the library to be usable from C, the public interface must
consist of functions (not methods) which are declared with C linkage
(extern "C" ...). Those functions can call C++ code.

If you need to pass pointers to objects between C++ and C, you need to
cast them to/from something which is valid in C (e.g. "void *").

-- 
Glynn Clements <glynn@gclements.plus.com>
