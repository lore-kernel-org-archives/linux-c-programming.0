From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Subject: Re: Question about Malloc
Date: Sun, 10 Oct 2004 13:13:16 +0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20041010111316.GD5033@lug-owl.de>
References: <1097386256.6100.16.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="StsxD1CZcGPGLZBA"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1097386256.6100.16.camel@localhost.localdomain>
List-Id: <linux-c-programming.vger.kernel.org>
To: linux prg <linux-c-programming@vger.kernel.org>


--StsxD1CZcGPGLZBA
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, 2004-10-10 00:31:05 -0500, Edward Parrilla <eparrilla@comcast.net>
wrote in message <1097386256.6100.16.camel@localhost.localdomain>:
> Hi all,
> I got the following structure:
> typedef struct  {
>  	char *file;
> 	char *ip_addres;
> 	}TABLE;
>=20
> then define a pointer to it:
>=20
> typedef TABLE *Recpointer;
> Recpointer r;
>=20
> I'm trying to use malloc as:
>=20
> r=3Dmalloc(Recpointer);
> but it gives me error.

=2E..which is correct. malloc() allocates memory, byte-wise, not complex
types. So you tell it how many bytes you want and it tries to do exactly
that. It's not C++! Additionally, your newly created Recpointer type is
a pointer, so if you'd do exactly the above correct, you'd not need to
malloc sizeof(Recpointer), but sizeof(TABLE).

But do you see the general mistake here? You typedef'ed your structures
twice, which completely hides you all the details. _This_ is what leads
you to wrong programming in just this case.

If you'd done it like this

struct table_entry {
	char *file;
	char *ip_address;
};
=2E..
struct table_entry *entry;
entry =3D malloc (sizeof (struct table_entry));

you'd easily see the flow of types here. It doesn't hide the defails
=66rom your eyes, thus gives you the chance to see what's happening. After
a number of typedefs, you usually don't know any more what is what...

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

--StsxD1CZcGPGLZBA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQFBaRlMHb1edYOZ4bsRApzwAJ0WrGlunOsrzDTw48Nbv9gAJzfgLwCdEs3F
A7Wj6tGLEz4WNUuq/D60b5k=
=nMJx
-----END PGP SIGNATURE-----

--StsxD1CZcGPGLZBA--
