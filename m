From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Subject: Re: Help in Shell script
Date: Tue, 11 May 2004 21:40:18 +0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20040511194017.GC1912@lug-owl.de>
References: <000e01c43711$6c2a4de0$ae63d103@patni.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="PAKmkkBo0+rTwAqJ"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <000e01c43711$6c2a4de0$ae63d103@patni.com>
List-Id: <linux-c-programming.vger.kernel.org>
To: "Linux-C-Programming (E-mail)" <linux-c-programming@vger.kernel.org>


--PAKmkkBo0+rTwAqJ
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, 2004-05-11 10:05:43 +0530, Jogesh Kanojia <jogesh.kanojia@patni.com>
wrote in message <000e01c43711$6c2a4de0$ae63d103@patni.com>:
> Hi
>=20
> I want shell programs for the following:
> (a)  To find the smallest number among the 3 numbers given.

function get_smallest_3() {
	[ "$1" -lt "$2" -a "$1" -lt "$3" ] && echo "$1"
	[ "$2" -lt "$1" -a "$2" -lt "$3" ] && echo "$2"
	[ "$3" -lt "$1" -a "$3" -lt "$2" ] && echo "$2"
}

> (b)  To check whether the given string is a palindrome or not.

function is_palindrome() {
	if [ "$1" =3D "`echo "$1" | rev`" ]; then
		return 0
	else
		return 1
	fi
}

> (c)  To sort the given list of numbers in descending order.

function sort_numbers() {
	for nr in $*; do
		echo $nr
	done | sort --numeric-sort --reverse
}

> (d)  To check, how many times a given substring occurs in a given main
> string.

That seems to be a bit more complicated. Don't have an idea ad hoc...

> (e)  To find the factorial of a given number

function factorial() {
	echo -e "define fact(x) { if (x <=3D 1) return (1); return (fact(x-1) * x)=
; }\nfact(4)" | bc
}


Of course, there are superb books on shell programming and yes, I don't
like preparing other people's homework:)

MfG, JBG

--=20
   Jan-Benedict Glaw       jbglaw@lug-owl.de    . +49-172-7608481
   "Eine Freie Meinung in  einem Freien Kopf    | Gegen Zensur | Gegen Krieg
    fuer einen Freien Staat voll Freier B=FCrger" | im Internet! |   im Ira=
k!
   ret =3D do_actions((curr | FREE_SPEECH) & ~(NEW_COPYRIGHT_LAW | DRM | TC=
PA));

--PAKmkkBo0+rTwAqJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAoSwhHb1edYOZ4bsRAsetAJ0ccfqmUascYXW4vGDXZTSmGx2WGgCfYQt6
8pHHZJ4QoEN9ObH9eWCHxvA=
=mhZz
-----END PGP SIGNATURE-----

--PAKmkkBo0+rTwAqJ--
