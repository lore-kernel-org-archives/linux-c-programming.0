From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Subject: Re: compiling programs which use pthreads
Date: Sun, 25 Jan 2004 10:56:53 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20040125095653.GV8401@lug-owl.de>
References: <1075023389.27269.12.camel@qa.intotoind.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qa1NXTiqN6KSzHv0"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1075023389.27269.12.camel@qa.intotoind.com>
List-Id: <linux-c-programming.vger.kernel.org>
To: linux-c-programming@vger.kernel.org


--qa1NXTiqN6KSzHv0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, 2004-01-25 15:06:29 +0530, syedk <syedk@intotoinc.com>
wrote in message <1075023389.27269.12.camel@qa.intotoind.com>:
> Hi all,
>      I am getting strange results while compiling programs which use
> pthreads.
> I am working on a RedHat Linux on a 2.4 kernel.
> to start with i wrote a simple program as follows:
[program snipped]
>=20
> but  when i tried to compile using gcc it is giving linktime error:
> undefined reference to pthread_create.
> but why is it giving this error when the header file pthread.h is
> present.

Header files describe functions and data types. So if you include a
header file, your program gets knowledge about some details. But that's
all.

If you actually want to *use* these external functions and variables,
you also need to tell the compiler (well, actually the linker) to
actually merge these into your program (or to let your program reference
some other, external object file called "dynamic library). This is done
my the -lXXXXX parameter. In your case (you want to use parts of the
pthreads package, you need to supply "-lpthread".

It's the same with eg. mathematical functions. Including "math.h" only
gives you some names. To be able to really use them, you need to "-lm".

Unfortunately, you do not need to supply the name of the normal C
library, libc. This confuses newbies quite often:-(

> when i tried to do cat /proc/ksyms | grep pthread_create
> no matches were found. Does that mean that pthread library is not
> installed in my system?

Most probably, it is. You actually name it "pthread library", which it
is. It is *not* a part of the linux kernel, so you won't find parts of
in in /proc/ksyms.

You do find things like "open", "close" and the like there, but this
really is more an accident. There's an "open" function inside the kernel
(which you don't use, at least not directly) and another one in the C
library (libc). The latter is what you use (without the need to add
"-lc" to the compiler/linker call).

> Can anyone suggest how to hack this and compile my program apart from
> downloading some freely available user-level libraries(like gnu
> pthreads).

$ gcc -o pthread_example pthread_example.c -lpthread

However, I admit that it isn't really easy for newbies to figure out
what they need to link:

stdio.h, stdlib.h, unistd.h		-> -lc (implicitely done)
pthread.h				-> -lpthread
math.h					-> -lm
gtk/gtk.h, gdk/gdk.h			-> `pkg-config --cflags gtk-2.0`
					   or `gtk-config --cflags`
=2E..

MfG, JBG

--=20
   Jan-Benedict Glaw       jbglaw@lug-owl.de    . +49-172-7608481
   "Eine Freie Meinung in  einem Freien Kopf    | Gegen Zensur | Gegen Krieg
    fuer einen Freien Staat voll Freier B=FCrger" | im Internet! |   im Ira=
k!
   ret =3D do_actions((curr | FREE_SPEECH) & ~(NEW_COPYRIGHT_LAW | DRM | TC=
PA));

--qa1NXTiqN6KSzHv0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iD8DBQFAE5LlHb1edYOZ4bsRAlFRAKCMQgtbAHiNMv/py2zZteeqRFU0uACeLSJH
ccS6uxmtsMKOucQdxXJeZs8=
=ANPs
-----END PGP SIGNATURE-----

--qa1NXTiqN6KSzHv0--
