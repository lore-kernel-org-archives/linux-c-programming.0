From: Nanakos Chrysostomos <nanakos@wired-net.gr>
Subject: printf and long double
Date: Mon, 4 Oct 2010 01:56:52 +0300
Message-ID: <20101003225652.GA3618@dinofilaria.home>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

Hi all,
I have the above C code snippet. I am trying to get a resonable result in a fixed form with printf for
a long double value but with no luck. What am I doing wrong?

Thanks in advance.

long.c
-------------------------------------------------------------
#include <stdio.h>
#include <math.h>

int main(void)
{
	long double c = powl(10.0L,30.0L);

	printf("%llf %lle\n",c,c);


	return 0;
}

------------------------------------------------------------

# gcc -DDOUBLE -msse2 -mfpmath=sse -m64 -m128bit-long-double  long.c -lm
#./a.out

1000000000000000000024696061952.000000 1.000000e+30

The second result is right but how can I get a fixed right result for the first one?
The fixed precision should be a lot bigger than this according to the IEEE-754 standard.
I am using a 64-bit machine with Debian Squeeze x86-64 version.
-----------------------------------------------------------------------------------------
Using built-in specs.
Target: x86_64-linux-gnu
Configured with: ../src/configure -v --with-pkgversion='Debian 4.4.4-8' --with-bugurl=file:///usr/share/doc/gcc-4.4/README.Bugs --enable-languages=c,c++,fortran,objc,obj-c++ --prefix=/usr --enable-shared --enable-multiarch --enable-linker-build-id --with-system-zlib --libexecdir=/usr/lib --without-included-gettext --enable-threads=posix --with-gxx-include-dir=/usr/include/c++/4.4 --program-suffix=-4.4 --enable-nls --enable-clocale=gnu --enable-libstdcxx-debug --enable-objc-gc --with-arch-32=i586 --with-tune=generic --enable-checking=release --build=x86_64-linux-gnu --host=x86_64-linux-gnu --target=x86_64-linux-gnu
Thread model: posix
gcc version 4.4.5 20100728 (prerelease) (Debian 4.4.4-8) 
-----------------------------------------------------------------------------------------
# gcc -dM -E -xc /dev/null | grep __LDBL_MAX__
#define __LDBL_MAX__ 1.18973149535723176502e+4932L

