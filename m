From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Subject: Re: invalid lvalue
Date: Sat, 15 Feb 2003 16:40:58 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20030215154058.GC351@lug-owl.de>
References: <Pine.LNX.4.33.0302152054580.24802-100000@soochak.ncst.ernet.in>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="NKoe5XOeduwbEQHU"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.33.0302152054580.24802-100000@soochak.ncst.ernet.in>
List-Id: <linux-c-programming.vger.kernel.org>
To: linux c programming mailing list <linux-c-programming@vger.kernel.org>


--NKoe5XOeduwbEQHU
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, 2003-02-15 20:57:35 +0530, Mohammed Khalid Ansari <khalid@ncst.erne=
t.in>
wrote in message <Pine.LNX.4.33.0302152054580.24802-100000@soochak.ncst.ern=
et.in>:
>=20
> I tried to compile the following program...
>=20
> int main()
> {
> 	int a;
> 	a =3D 2;
> #	printf ("%d\n", a++++);
> 	return 0;
> }

> "invalid lvalue in increment" for the line indicated by #. Why it so, a=
=20
> has been defined as an int variable!

Well, the compiler seemed to read this as (a++)++ .  The braces are
evaluated (this results in a _number), and then you try to increment
this number. But this doesn't work, because "++" is ment for variables,
not for numbers.

Use 'printf ("%d\n", a +=3D 2);' instead (if it was your intend to add two
to a).

MfG, JBG

--=20
   Jan-Benedict Glaw       jbglaw@lug-owl.de    . +49-172-7608481
   "Eine Freie Meinung in  einem Freien Kopf    | Gegen Zensur
    fuer einen Freien Staat voll Freier B=FCrger" | im Internet!
   Shell Script APT-Proxy: http://lug-owl.de/~jbglaw/software/ap2/

--NKoe5XOeduwbEQHU
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQE+Tl+JHb1edYOZ4bsRAs6DAKCLx6P+j04tafjpEjhZ0/iysyZVewCfaaxy
2QL6DSODtCAtEl6qPV8E3oI=
=7WaN
-----END PGP SIGNATURE-----

--NKoe5XOeduwbEQHU--
