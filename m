From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Subject: Re: I'm really starting to dislike stdio
Date: Thu, 19 Jun 2003 13:26:17 +0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20030619112617.GV6353@lug-owl.de>
References: <011801c33580$48425aa0$e764a8c0@fesnel.noip.org> <003c01c335c7$a7f437b0$3d6405d5@carlos> <004001c33635$21f3d3a0$e764a8c0@fesnel.noip.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Fw8vdPO5iEPGjqL+"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <004001c33635$21f3d3a0$e764a8c0@fesnel.noip.org>
List-Id: <linux-c-programming.vger.kernel.org>
To: linux-c-programming <linux-c-programming@vger.kernel.org>


--Fw8vdPO5iEPGjqL+
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, 2003-06-19 03:33:16 -0400, John T. Williams <jtwilliams@vt.edu>
wrote in message <004001c33635$21f3d3a0$e764a8c0@fesnel.noip.org>:
> I really appricated the help with the progress bar.
>=20
> I have another problem
>=20
> I am trying to read in a password from the stdin, but I don't want it to
> display to the screen as the person types it in.
> I either like to mock su, and take input w/o any output, or output a *  f=
or
> each typed character, and I cannot figure out how to get this to work

> and I tried getc from the curses library.
> The problem with all of these is that they only actually do the read part
> after I've hit the <enter> key.  I want it to process each character as it
> is typed.  Anyone who has any ideas or can tell me a better way to read
> characters w/o displaying it to the screen and I'd be greatful.

Terminals are serial equipment with special characteristics:) First, a
call to read() will only return after the user pressed his Enter key
_until_ you fiddle with serial settings:

struct termios termio;
tcgetattr(STDIN_FILENO, &termio);
termio.c_cc[V_MIN] =3D 1; /* Return after one byte */
tcsetattr(STDIN_FILENO, &termio);
tcflush(STDIN_FILENO, TCIOFLUSH);

(Of course, you need a second struct termios to memcpy() all the old
values to be able to restore the previous state which you're expected to
do.)

The second part is to not let those characters appear at all. This is
done with:

struct termios termio;
tcgetattr(STDIN_FILENO, &termio);
termio_new.c_lflag &=3D ~ECHO; /* Clear ECHO flag */
tcsetattr(STDIN_FILENO, &termio);
tcflush(STDIN_FILENO, TCIOFLUSH);

(Again, you need to backup old termios settings.)

Serial programming (which this is, after all) isn't 100% simple:(

MfG, JBG

--=20
   Jan-Benedict Glaw       jbglaw@lug-owl.de    . +49-172-7608481
   "Eine Freie Meinung in  einem Freien Kopf    | Gegen Zensur | Gegen Krieg
    fuer einen Freien Staat voll Freier B=FCrger" | im Internet! |   im Ira=
k!
      ret =3D do_actions((curr | FREE_SPEECH) & ~(IRAQ_WAR_2 | DRM | TCPA));

--Fw8vdPO5iEPGjqL+
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQE+8Z3ZHb1edYOZ4bsRAn3jAJ9sF4J5i2VFHapXNa7Wy99zRKfBXQCfflnV
cGD/Buw0ScfzMFsZYTLC2YA=
=B5u4
-----END PGP SIGNATURE-----

--Fw8vdPO5iEPGjqL+--
