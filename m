From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: dynamic linking
Date: Mon, 9 Sep 2002 15:24:57 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <15740.44857.172146.892963@cerise.nosuchdomain.co.uk>
References: <200209082200.26275.wrazlov@gmx.net>
	<200209082203.49132.wrazlov@gmx.net>
	<200209082306.27699.freyther@gmx.net>
	<200209091306.17099.wrazlov@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <200209091306.17099.wrazlov@gmx.net>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: wrazlov@gmx.net
Cc: linux-c-programming@vger.kernel.org


Wrazlov wrote:

> > I'm new to this list and actually didn't read the faq but man dlopen is
> > your friend.
> > After dlopening you need to dlsym the 'entry point' of your plugin
> 
> Thanks for that, but that's only one part, for I don't know how to compile 
> such a lib.so?

1. Ensure that the source files are compiled with the "-fPIC" switch,
e.g.
	gcc -c -fPIC -o foo.o foo.c
	gcc -c -fPIC -o bar.o bar.c

2. Link using "gcc -shared ...", e.g.

	gcc -shared -fPIC -o libfoo.so foo.o bar.o

Note: this is sufficient for "private" shared libraries, e.g. plugins. 
If you wish to build "public" shared libraries (to be installed in
e.g. /usr/local/lib), you should add a version, e.g.

	gcc -shared -fPIC -Wl,-soname,libfoo.so.1 -o libfoo.so.1.0 foo.o bar.o
	ln -s libfoo.so.1.0 libfoo.so.1
	ln -s libfoo.so.1.0 libfoo.so

> Is it possible to import let's say a class using dlopen?

No; classes don't exist. At least, they don't exist as data within a
binary (object file, library, executable). Classes only exist within
the C++ compiler. The object files only contain individual functions
and (global) variables.

While it is possible to dynamically load libraries which are written
in C++, it's a lot easier if you write C wrappers for the entry
points.

-- 
Glynn Clements <glynn.clements@virgin.net>
