From: Stephen Kratzer <kratzers@pa.net>
Subject: Re: Request help with function pointers
Date: Tue, 27 Feb 2007 10:15:13 -0500
Message-ID: <200702271015.13729.kratzers@pa.net>
References: <45DD1BC9.9030902@gmail.com>
Reply-To: kratzers@pa.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <45DD1BC9.9030902@gmail.com>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Shriramana Sharma <samjnaa@gmail.com>
Cc: linux-c-programming@vger.kernel.org

On Wednesday 21 February 2007 23:27, Shriramana Sharma wrote:
> Hello. I am trying the examples from Bruce Eckel's Thinking in C++ 2nd
> edn and am getting a problem. I have attached the examples I am using
> and the error messages (basically the same kind) which I got. I am
> unable to understand what is wrong when I have followed the book example
> perfectly (AFAIK) except for the variablenames which is immaterial.
>
> Please explain what I did wrong. I am using:
>
> $ g++ -v
> Using built-in specs.
> Target: i486-linux-gnu
> Configured with: ../src/configure -v
> --enable-languages=c,c++,fortran,objc,obj-c++,treelang --prefix=/usr
> --enable-shared --with-system-zlib --libexecdir=/usr/lib
> --without-included-gettext --enable-threads=posix --enable-nls
> --program-suffix=-4.1 --enable-__cxa_atexit --enable-clocale=gnu
> --enable-libstdcxx-debug --enable-mpfr --enable-checking=release
> i486-linux-gnu
> Thread model: posix
> gcc version 4.1.2 20060928 (prerelease) (Ubuntu 4.1.1-13ubuntu5)
>
> Thank you.
>
> Shriramana Sharma.

Remove the space in ". *" and "-> *".
