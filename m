From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Subject: Re: tcpdump equivalent for the serial port
Date: Fri, 12 Sep 2003 16:39:27 +0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20030912143927.GS14376@lug-owl.de>
References: <3F61CC14.20607@abcpages.com> <20030912140542.GP14376@lug-owl.de> <3F61D6E4.2050604@abcpages.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="EC31x7qjULtwJxzf"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <3F61D6E4.2050604@abcpages.com>
List-Id: <linux-c-programming.vger.kernel.org>
To: linux-c-programming@vger.kernel.org


--EC31x7qjULtwJxzf
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, 2003-09-12 16:23:32 +0200, Nicolae Mihalache <mache@abcpages.com>
wrote in message <3F61D6E4.2050604@abcpages.com>:
> Jan-Benedict Glaw wrote:
> >That way, you don't monitor the serial port itself, but the=20
> >application
> >using it. For me, that has always been enough:-)
> >
> This seems a good ideea. Probably I will not use exactly strace but=20
> develop something using the same library it uses.

There isn't really a library involved. strace is basically a hugh
wrapper around the ptrace() system call.

> I will still keep the cable break-out solution as an option but=20
> definitely I wanted to be able to monitor the data without interfering=20
> with the electic signaling on the cable.

Then you most probably want to go the preload lib way. That is, you
build a small lib containing open(), close(), read() and write() which
you call the original program with:

$ LD_PRELOAD=3D/path/to/your/lib.so ./serial_app

The lib needs to call the libc routines, of course. You can do this by
dlopen()ing libc (RTLD_NEXT) and get the original function (pointer)
=66rom it (by calling dlsym()).

This way, you get access to all parameters (you're able to get the
open()ed file name, compare it to /dev/ttyS.*) and save the resultin fd
=66rom the libc open() call.

On upcoming read()s and write()s, you simply always compare the supplied
fd with the initial fd() from the open() call to a serial device. It's
really that easy:)

MfG, JBG

--=20
   Jan-Benedict Glaw       jbglaw@lug-owl.de    . +49-172-7608481
   "Eine Freie Meinung in  einem Freien Kopf    | Gegen Zensur | Gegen Krieg
    fuer einen Freien Staat voll Freier B=FCrger" | im Internet! |   im Ira=
k!
      ret =3D do_actions((curr | FREE_SPEECH) & ~(IRAQ_WAR_2 | DRM | TCPA));

--EC31x7qjULtwJxzf
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQE/YdqfHb1edYOZ4bsRAtUKAKCNoqCWedO5HktsmsUmjpmd66NxPwCeP9Dl
iUJFjFuB+TSqWDDGNIubgsw=
=kE6k
-----END PGP SIGNATURE-----

--EC31x7qjULtwJxzf--
