From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Subject: Re: Unix Domain Sockets
Date: Mon, 24 Jan 2005 20:32:00 +0100
Message-ID: <20050124193200.GD28037@lug-owl.de>
References: <20050124_191803_058538.r_zaca@ig.com.br>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="9o6tjhKcA+PBUYK5"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20050124_191803_058538.r_zaca@ig.com.br>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
To: linux-c-programming@vger.kernel.org


--9o6tjhKcA+PBUYK5
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, 2005-01-24 17:18:03 -0200, r_zaca <r_zaca@ig.com.br>
wrote in message <20050124_191803_058538.r_zaca@ig.com.br>:
Content-Description: Mail message body
>   Hello everybody,=20
>=20
>   Does anyone know what a "unix domain socket" is, and how it differ from=
 an=20
> "Internet domain socket"?=20

Internet domain sockets work with IP addresses and port numbers. A unix
socket merely is a special file on a local file system, a so calles
"fifo". It's created with the "mkfifo" library call or userspace
command.

After you've created a fifo, which is displayed with a 'p' as the
file-type at "ls -l" output, you can open/close/read/write it.

>   If you know a nice site or documentation about this subject, please tel=
l=20
> me.=20

There's not much to tell about it. It's created once locally, then you
can access it. Keep in mind that it's a purely local thing. You cannot
export it by any means (I've seen people putting it on a shared NFS
filesystem....). The data passed through the fifo is kept within the
operating system's kernel; it's never ever written somewhere onto stable
storage.

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

--9o6tjhKcA+PBUYK5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQFB9U0wHb1edYOZ4bsRAtzRAKCO5MdnzZUeV/snqPtf9Xifg2dNlwCfZG3q
xHiSEKYrxKCf/uNlkzYrnog=
=SESC
-----END PGP SIGNATURE-----

--9o6tjhKcA+PBUYK5--
