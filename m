From: Adam Dyga <adeon@tlen.pl>
Subject: automake & C++ library problem
Date: Thu, 14 Oct 2004 18:05:31 +0000
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <200410141805.31790.adeon@tlen.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org


Hello,

It's not exactly C programming related question, but I suspect that many of you, linux developers, know autotools well.

I want to create a C++ library from scratch. So I created project directory, with configure.in and Makefile.am
 in it, and  'src' subdirectory with Makefile.am.

Mentioned files contain:

configure.in:

 AC_INIT(deflatec++, 1.00)
 AM_INIT_AUTOMAKE
 AC_LANG(C++)
 AC_PROG_CXX
 AC_PROG_INSTALL
 AC_PROG_RANLIB
 AC_OUTPUT(Makefile src/Makefile)

Makefile.am:

 SUBDIRS = src

src/Makefile.am:

 bin_PROGRAMS = deflatetest
 deflatetest_SOURCES = deflatetest.cc
 include_HEADERS = DeflateCompress.h DeflateDecompress.h 
 lib_LIBRARIES = libdeflatec++.a
 libdeflatec++_a_SOURCES = DeflateCompress.cc DeflateDecompress.cc DeflateCompress.h DeflateDecompress.h 

(all files .h and .cc ofcourse exist)

Running autoreconf gives me the following error (originated from automake in fact):

/usr/share/automake-1.9/am/depend2.am: am__fastdepCC does not appear in AM_CONDITIONAL
src/Makefile.am: C source seen but `CC' is undefined
src/Makefile.am:
src/Makefile.am: The usual way to define `CC' is to add `AC_PROG_CC'
src/Makefile.am: to `configure.in' and run `autoconf' again.
autoreconf: automake failed with exit status: 1

And here I don't know what is going on, I don't know where automake see any C source... :(
But OK, I'm adding AC_PROG_CC to configure.in and running autoreconf, configure and make.
I'm getting this:

Making all in src
make[1]: Entering directory `/home/adeon/deflatec++/src'
make[1]: *** No rule to make target `libdeflatec++.c', needed by `libdeflatec++.o'.  Stop.
make[1]: Leaving directory `/home/adeon/deflatec++/src'
make: *** [all-recursive] Error 1

What am I doing wrong?

Greets
Adam
