From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Subject: Re: dynamicly/staticly linked binaries
Date: Mon, 6 Sep 2004 18:28:07 +0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20040906162806.GC6985@lug-owl.de>
References: <40450.212.113.164.104.1094489703.squirrel@www.fbnet.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Fc4/uDQsB6b9dq2q"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <40450.212.113.164.104.1094489703.squirrel@www.fbnet.org>
List-Id: <linux-c-programming.vger.kernel.org>
To: heap <heap@fbnet.org>
Cc: linux-c-programming@vger.kernel.org


--Fc4/uDQsB6b9dq2q
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, 2004-09-06 16:55:03 -0000, heap <heap@fbnet.org>
wrote in message <40450.212.113.164.104.1094489703.squirrel@www.fbnet.org>:
> Hello, could anyone tell me what's the difference between the dynamicly
> and staticly linked binaries? As far as I can tell, there are security
> risks implied, but I can't see in what way.

Programs use functions like "printf()". These functions are placed into
libraries (so that they can be accessed by all programs, since they all
expect "printf()" to do the very same thing.

Dynamically linked programs use a library which is liked into the
program at program's start-up time. Eg. you type in "ls", hit the Enter
key and this is what happens:

	- shell interpreter fork()s; the child then exec()s the "ls"
	  program.
	- Kernel loads the first few bytes of it to determine it's file
	  type (lets assume it's an ELF program).
	- The ELF format handler loads the program's "interpreter",
	  /bin/ld-linux.so.2 .  This program looks into the binary to
	  start and determines which dynamically libraries need to be
	  loaded (cf. "ldd `which ls`").
	- After the "interpreter" finally linked the binary with it's
	  needed libraries, the program is ready for execution, the
	  interpreter calls libc's startup functions (which first call
	  all constructor functions, does initialization jobs and the
	  like) and finally calls main().

If you (or your distribution's people) ever find a bug in one of these
dynamically linked libraries, it can be exchanged so that all programs
using it are fixed at once. While the program binaries are comparably
small (since they don't ship all those bloated libs with them), you pay
a prize: dynamically linked programs need some time after being started
to get finally linked together.

Statically linked programs can be executed and are instantly ready to
run, since they shil all the libs they need. However, these programs are
a lot larger, but have a quicker start-up time. Also, if you find a bug
in one of the used libs, you need to exchange all binaries which are
statically linked with that lib.

			Dynamic			Static
-------------------------------------------------------------------------
Program size on		small			large
harddisk

Program size in		smaller, since the	larger (because there's
RAM			OS may decide to	no connection between
			only load a dynamic	two identical libs in
			lib's text segment	two different programs).
			(the "code") once.

Bug in lib		Exchange the lib and	Re-link all programs using
			you're done with it.	the lib and exchange them.

Start-up time		Need some time to do	Instantly ready to run.
			final link, but that
			can be cut down with
			some tricks.

Traceability		With some tricks, you	Doesn't help you in reverse
			can trace what a	engineering or debugging,
			program does with it's	but you can still do that
			libraries--may help	with standard GNUish tools.
			in reverse engineering
			and debugging.

So that's an overview, but there's a lot to add.

MfG, JBG

--=20
Jan-Benedict Glaw       jbglaw@lug-owl.de    . +49-172-7608481             =
_ O _
"Eine Freie Meinung in  einem Freien Kopf    | Gegen Zensur | Gegen Krieg  =
_ _ O
 fuer einen Freien Staat voll Freier B=FCrger" | im Internet! |   im Irak! =
  O O O
ret =3D do_actions((curr | FREE_SPEECH) & ~(NEW_COPYRIGHT_LAW | DRM | TCPA)=
);

--Fc4/uDQsB6b9dq2q
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQFBPJAWHb1edYOZ4bsRAq+CAJ0bKCWD/qvykAKTW09/kbA9XKvFdwCfX2Hq
5KRRuIwXo5/FRXP+/zfMTKE=
=FwhI
-----END PGP SIGNATURE-----

--Fc4/uDQsB6b9dq2q--
