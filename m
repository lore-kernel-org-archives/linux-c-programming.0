From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Subject: Re: const char * vs char[]
Date: Tue, 23 Mar 2004 18:04:46 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20040323170446.GB11933@lug-owl.de>
References: <20040323151902.000048da.cialdi@firenze.net> <000f01c410e6$6d7197e0$0c81640a@aca.org.ar>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="wq9mPyueHGvFACwf"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <000f01c410e6$6d7197e0$0c81640a@aca.org.ar>
List-Id: <linux-c-programming.vger.kernel.org>
To: 'linux-c-programming' <linux-c-programming@vger.kernel.org>


--wq9mPyueHGvFACwf
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, 2004-03-23 11:52:12 -0300, Mariano Moreyra <moremari@aca.org.ar>
wrote in message <000f01c410e6$6d7197e0$0c81640a@aca.org.ar>:
> No... "char*" and "char []" are synonyms.

There's a subtle difference:

char *hello_ptr =3D "A really loooong hello world";
char write_string[] =3D "this is some long garbage";

void main(void) {
	/* legal */
	sprintf (write_string, "%s", "stuff");

	/* illegal - may be in a read-only segment */
	sprintf (hello_ptr, "%s", "Don't do that");
}

So if you're preparing some space for say building up some packet (to be
sent out to hardware), use "char xx[]", but if you only want to have a
read-only string (to printf() it to the user), you can use "char *xx".

MfG, JBG

--=20
   Jan-Benedict Glaw       jbglaw@lug-owl.de    . +49-172-7608481
   "Eine Freie Meinung in  einem Freien Kopf    | Gegen Zensur | Gegen Krieg
    fuer einen Freien Staat voll Freier B=FCrger" | im Internet! |   im Ira=
k!
   ret =3D do_actions((curr | FREE_SPEECH) & ~(NEW_COPYRIGHT_LAW | DRM | TC=
PA));

--wq9mPyueHGvFACwf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAYG4tHb1edYOZ4bsRAlXsAJ96OhRCjyIdxLuZrK5vcOV2Wgi0RgCeMqKU
heLtmmwOs8Akey1Id9XDTYw=
=rMeX
-----END PGP SIGNATURE-----

--wq9mPyueHGvFACwf--
