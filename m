From: "Steven Smith" <sos22@cam.ac.uk>
Subject: Re: constant variable
Date: Thu, 11 Mar 2004 13:42:15 +0000
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20040311134215.GA4714@archibold.chu.cam.ac.uk>
References: <200403111819.00752.nasir@orbisindonesia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Q68bSM7Ycu6FN28Q"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <200403111819.00752.nasir@orbisindonesia.com>
List-Id: <linux-c-programming.vger.kernel.org>
To: Nasir Simbolon <nasir@orbisindonesia.com>
Cc: linux-c-programming@vger.kernel.org


--Q68bSM7Ycu6FN28Q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

>  	const int i=3D9;
>      	int* j=3DNULL;
> 	 j =3D (int*) &i;
>  	*j =3D 3;

> when I compile using gcc version 3.3.2 (Debian) and run, I have the resul=
t :
>=20
> value of i =3D 9
> value of *j =3D 3
>=20
> Now, I notice  that j point to address of i BUT they do not  have the sam=
e=20
> value.

Probably because of compiler optimisations.  If you've specified that
something is const, then the compiler is perfectly at liberty to
assume that it is.  This means that it can assume the initial value of
i still applies, and so, rather than going to memory for i, it can
just substitute the constant 9 in.  This is likely to be much quicker
at run time.

I can only reproduce this behaviour if I have compiler optimisations
turned on, which adds some more weight to the explanation.

Steven.

--Q68bSM7Ycu6FN28Q
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (FreeBSD)

iD8DBQFAUGy3O4S8/gLNrjcRAlM9AJ49tNMj77UGWyY1sZxTxUjAPcaJ9QCfWUcB
0UH8NsVi4Qwb+x9Kb8oIvGU=
=wub/
-----END PGP SIGNATURE-----

--Q68bSM7Ycu6FN28Q--
