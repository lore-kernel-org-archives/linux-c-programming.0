From: Gedare Bloom <gedare@gwmail.gwu.edu>
Subject: Re: printf and long double
Date: Sun, 3 Oct 2010 20:43:46 -0400
Message-ID: <AANLkTi=rmOmUX2cKxdjPwB1Bo3233TYqhR8O=HN1AnV5@mail.gmail.com>
References: <20101003225652.GA3618@dinofilaria.home>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20101003225652.GA3618@dinofilaria.home>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Nanakos Chrysostomos <nanakos@wired-net.gr>
Cc: linux-c-programming@vger.kernel.org

On Sun, Oct 3, 2010 at 6:56 PM, Nanakos Chrysostomos
<nanakos@wired-net.gr> wrote:
> Hi all,
> I have the above C code snippet. I am trying to get a resonable resul=
t in a fixed form with printf for
> a long double value but with no luck. What am I doing wrong?
>
> Thanks in advance.
>
> long.c
> -------------------------------------------------------------
> #include <stdio.h>
> #include <math.h>
>
> int main(void)
> {
> =A0 =A0 =A0 =A0long double c =3D powl(10.0L,30.0L);
>
> =A0 =A0 =A0 =A0printf("%llf %lle\n",c,c);
>
I think you want %llg instead of %llf.  g is for double-precision, f
is for single.
>
> =A0 =A0 =A0 =A0return 0;
> }
>
> ------------------------------------------------------------
>
> # gcc -DDOUBLE -msse2 -mfpmath=3Dsse -m64 -m128bit-long-double =A0lon=
g.c -lm
> #./a.out
>
> 1000000000000000000024696061952.000000 1.000000e+30
>
> The second result is right but how can I get a fixed right result for=
 the first one?
> The fixed precision should be a lot bigger than this according to the=
 IEEE-754 standard.
> I am using a 64-bit machine with Debian Squeeze x86-64 version.
> ---------------------------------------------------------------------=
--------------------
> Using built-in specs.
> Target: x86_64-linux-gnu
> Configured with: ../src/configure -v --with-pkgversion=3D'Debian 4.4.=
4-8' --with-bugurl=3Dfile:///usr/share/doc/gcc-4.4/README.Bugs --enable=
-languages=3Dc,c++,fortran,objc,obj-c++ --prefix=3D/usr --enable-shared=
 --enable-multiarch --enable-linker-build-id --with-system-zlib --libex=
ecdir=3D/usr/lib --without-included-gettext --enable-threads=3Dposix --=
with-gxx-include-dir=3D/usr/include/c++/4.4 --program-suffix=3D-4.4 --e=
nable-nls --enable-clocale=3Dgnu --enable-libstdcxx-debug --enable-objc=
-gc --with-arch-32=3Di586 --with-tune=3Dgeneric --enable-checking=3Drel=
ease --build=3Dx86_64-linux-gnu --host=3Dx86_64-linux-gnu --target=3Dx8=
6_64-linux-gnu
> Thread model: posix
> gcc version 4.4.5 20100728 (prerelease) (Debian 4.4.4-8)
> ---------------------------------------------------------------------=
--------------------
> # gcc -dM -E -xc /dev/null | grep __LDBL_MAX__
> #define __LDBL_MAX__ 1.18973149535723176502e+4932L
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-c-pro=
gramming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
