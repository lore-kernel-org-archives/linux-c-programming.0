From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Subject: Re: file deletion
Date: Thu, 23 Dec 2004 14:49:52 +0100
Message-ID: <20041223134951.GY2460@lug-owl.de>
References: <84bd26ef04122305146c8f8a89@mail.gmail.com> <003f01c4e9ba$7679d020$316c4ed5@j0s6l8>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="I/wet25DnWlSyk1C"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <003f01c4e9ba$7679d020$316c4ed5@j0s6l8>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
To: linux-c-programming@vger.kernel.org


--I/wet25DnWlSyk1C
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, 2004-12-24 13:14:11 -0000, Andy <andy_webb@onetel.com>
wrote in message <003f01c4e9ba$7679d020$316c4ed5@j0s6l8>:
> Does anybody know of any useful code or c commands that
> you can use to search for duplicate files within a linux/unix directory a=
nd
> its subdirectories and remove them?

As long as you believe in cryptographical hashes, something like this
should do the trick:

SOME_DIR=3D/some/directory

find "${SOME_DIR}" -type f -exec sha1sum {} \; | \
	sort | \
	uniq -c | \
	sed -e 's/^[[:space:]]*//g' | \
	egrep -v '\<1\>' | \
	cut -f 4- -d ' ' | \
	while read DOUBLE_FILE_NAME; do
		rm -f "${SOME_DIR}/${DOUBLE_FILE_NAME}"
	done

That's untested, but should work (it's essentially a one-liner).
However, it removes *all* instances of files which are believed to be
identical...

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

--I/wet25DnWlSyk1C
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQFBysz/Hb1edYOZ4bsRApPBAJ9Z4AQpbViIZE1XWK79pLypAE68CwCeOE6T
dCNjruwV8LagC6cs96kFpQM=
=aEpz
-----END PGP SIGNATURE-----

--I/wet25DnWlSyk1C--
