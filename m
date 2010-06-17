From: Namhyung Kim <namhyung@gmail.com>
Subject: Re: Use of double pointer in linux kernel Hash list implementation
Date: Thu, 17 Jun 2010 12:32:25 +0900
Message-ID: <1276745545.1712.8.camel@leonhard>
References: <AANLkTilGln3yZRl1muugML4Qg_1rcTXTf3UeAIzLTOJT@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature"; boundary="=-S4+uabk9rWkSTJCbXd7A"
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:subject:from:to:cc
         :in-reply-to:references:content-type:date:message-id:mime-version
         :x-mailer;
        bh=Guhpsa2AkNxh90tPLcY7fW+F/TwI5Fh6FEtwi+j6H30=;
        b=cquxI7dJs7vBxb1yFt66QpEWrDExEr6uLMyd40TPgQjFOUm9qgJd0vMR23NOlrPUkR
         qusaa3PffQ0HkKI2dLpU2LriW+W335JJ2HOh1imIaq9RUjjn0uUzpLt+CeZCd3twneLQ
         lqMTT1bj+qHjVZ8VTx0PwiFwzfSvo0qxXoVrk=
In-Reply-To: <AANLkTilGln3yZRl1muugML4Qg_1rcTXTf3UeAIzLTOJT@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
To: Balachandar <bala1486@gmail.com>
Cc: kernelnewbies@nl.linux.org, linux-c-programming@vger.kernel.org


--=-S4+uabk9rWkSTJCbXd7A
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

2010-06-16 (=EC=88=98), 22:50 -0400, Balachandar:
> Hi,
>   I am trying to understand Linux Kernel implementation of linked list
> and hash table. A link to the implementation is here. I understood the
> linked list implementation. But i am little confused of why double
> pointers is being used in hlist (**pprev). Link for hlist is here. I
> understand that hlist is used in implementation of hash table since
> head of the list requires only one pointer and it saves space. Why
> cant it be done using single pointer (just *prev like the linked
> list)? Please help me.
>=20
>=20
> Thanks,
> Bala


IMHO **pprev is only needed for fast deletion and/or insertion.


--=20
Regards,
Namhyung Kim


--=-S4+uabk9rWkSTJCbXd7A
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkwZl0gACgkQcwWBAay833EoIwCcCOYkqxZP16bCGm8276bIYLbl
Ea4Ania5mC45HNdmN/ZDeR4VOXeDWtjI
=B4/S
-----END PGP SIGNATURE-----

--=-S4+uabk9rWkSTJCbXd7A--

