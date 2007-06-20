From: wwp <subscript@free.fr>
Subject: Re: include guards
Date: Wed, 20 Jun 2007 14:43:06 +0200
Message-ID: <20070620144306.727cc2ba@localhost.localdomain>
References: <46720AFF.6070402@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_rANdVgESm=Xh3QqypgnjCzK";
 protocol="application/pgp-signature"; micalg=PGP-SHA1
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <46720AFF.6070402@gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
To: linux-c-programming@vger.kernel.org

--Sig_rANdVgESm=Xh3QqypgnjCzK
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hello Shriramana,


On Fri, 15 Jun 2007 09:13:59 +0530 Shriramana Sharma <samjnaa@gmail.com> wr=
ote:

> Hello.
>=20
> To prevent header files from being included more than once in the same=20
> translation unit, we use include guards like
>=20
> # ifndef FOO_H
> # define FOO_H
> ...
> # endif
>=20
> Recently I came to know that I can use simply:
>=20
> # pragma once
>=20
> instead of the above group of sentences and the desired effect is still=20
> accomplished.
>=20
> This leads me to think of two things:
>=20
> 1. why use the ifndef-define-endif method when the pragma once method is=
=20
> simpler and cleaner?
>=20
> 2. why should we need to use either method at all? If it is a=20
> universally undesirable behaviour that the same header file is included=20
> in a translation unit more than once, then an intelligent compiler (or=20
> preprocessor) itself can by default take of this, right?
>=20
> I understand that to write portable code that compiles on=20
> not-so-intelligent compilers, we may need to do something manually, so=20
> question 2 is answered, but question 1 still stands...

#pragma is simply not supported by all pre-processors, is that
directive present in any standard at least?


Regards,

--=20
wwp

--Sig_rANdVgESm=Xh3QqypgnjCzK
Content-Type: application/pgp-signature; name=signature.asc
Content-Disposition: attachment; filename=signature.asc

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.7 (GNU/Linux)

iD8DBQFGeSDaadgnuQFKG88RAhVqAJsG/O36Ues7NhZ74yzLL+JdbCD8nwCgjJyn
7oEhRHAOcXe6BPKe3+zesSU=
=Ti0q
-----END PGP SIGNATURE-----

--Sig_rANdVgESm=Xh3QqypgnjCzK--
