From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Subject: Re: newby.-interpreting C
Date: Mon, 20 Dec 2004 22:17:09 +0100
Message-ID: <20041220211709.GD2460@lug-owl.de>
References: <cq77vi$1ej$1@sea.gmane.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4zI0WCX1RcnW9Hbu"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <cq77vi$1ej$1@sea.gmane.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
To: linux-c-programming@vger.kernel.org


--4zI0WCX1RcnW9Hbu
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, 2004-12-20 20:07:54 +0100, soraberri <421246@posta.unizar.es>
wrote in message <cq77vi$1ej$1@sea.gmane.org>:
> Hi all,
>=20
> Anyone could give me the meaning of this definition? Is the=20
> __attribute__ stuff what scares me. If you feel like I'm too=20
> desoriented, please tell me what should I know first.
>=20
> typedef struct {
> 	uint8_t b[6];
> } __attribute__((packed)) bdaddr_t;

Compilers do use __attribute__ to allow programmers to modify the
compiler's behavior in certain areas. "packed" tells the compiler to not
start each variable at a natural alignment (ie. 4 bytes on a 32bit
machine, 8 bytes on a 64bit machine). (That is, the address of a given
variable must be a multiple of 4 (or 8) bytes.)

A "packed" structure is usually used for two things:

	- In device drivers to fit a hardware device's memory-mapped
	  register structure
	- In poorly written programs to store variables into on-disk
	  files to be read back later on by other programs.

General rule: if you don't *need* this for a good reason, or if you even
don't know what it does, you don't need it, since it also introduces a
performance penalty: CPUs tend to be fast at naturally aligned memory
accesses, but quite slow on non-aligned accesses.

MfG, JBG

--=20
Jan-Benedict Glaw       jbglaw@lug-owl.de    . +49-172-7608481             =
_ O _
"Eine Freie Meinung in  einem Freien Kopf    | Gegen Zensur | Gegen Krieg  =
_ _ O
 fuer einen Freien Staat voll Freier B=C3=BCrger" | im Internet! |   im Ira=
k!   O O O
ret =3D do_actions((curr | FREE_SPEECH) & ~(NEW_COPYRIGHT_LAW | DRM | TCPA)=
);

--4zI0WCX1RcnW9Hbu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQFBx0FVHb1edYOZ4bsRAolfAJ0TtRRUiyABd9YMJ2sVssJKK5n/bwCeMmXB
LXEy9LzS6yg8wTG4ellSoBY=
=NwNZ
-----END PGP SIGNATURE-----

--4zI0WCX1RcnW9Hbu--
