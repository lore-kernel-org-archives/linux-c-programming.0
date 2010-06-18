From: Namhyung Kim <namhyung@gmail.com>
Subject: Re: Use of double pointer in linux kernel Hash list implementation
Date: Fri, 18 Jun 2010 11:10:03 +0900
Message-ID: <1276827003.1746.24.camel@leonhard>
References: <AANLkTilGln3yZRl1muugML4Qg_1rcTXTf3UeAIzLTOJT@mail.gmail.com>
	 <1276745545.1712.8.camel@leonhard>
	 <AANLkTinj8yacrvasccTNM9CtF9pny0U3QX47wtRT-Abq@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature"; boundary="=-nSNek5yoQRTvqm34JNk2"
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:subject:from:to:cc
         :in-reply-to:references:content-type:date:message-id:mime-version
         :x-mailer;
        bh=sX+6jmuxB8k2TDD9+7Mon1dBUxoepCKA9KJUJi4Ii+g=;
        b=AHc17ut3pmLzcYOJXqMwpA9b8pvuEkFJnPaVF27CGxPFvNC9TAjsR1/5aVroGlBa/h
         Tvk2fd7nMJNz9kStl+NTSzWN79IjPdjcAbRgnbNeWYSn29U7W7Rec5TotHe3Aj7KQUVK
         GWZJkhszeFWhO9Kt69UOWKpirt7MLITjRkeeo=
In-Reply-To: <AANLkTinj8yacrvasccTNM9CtF9pny0U3QX47wtRT-Abq@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
To: Balachandar <bala1486@gmail.com>
Cc: kernelnewbies@nl.linux.org, linux-c-programming@vger.kernel.org


--=-nSNek5yoQRTvqm34JNk2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

2010-06-17 (=EB=AA=A9), 10:34 -0400, Balachandar:

>=20
> My doubt is why not use *prev as it is used in list_head
> implementation rather than **pprev. =20

hlist is simple linked list so there is no need of *prev. **pprev is a
kind of hack and should not be accessed in the outside of hlist. If you
need *prev, just use list_head.

--=20
Regards,
Namhyung Kim


--=-nSNek5yoQRTvqm34JNk2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkwa1XYACgkQcwWBAay833FfEwCgyT1Ehlyvu7bvFtS3xqIANOh2
RMkAnjfASuD2wEAf1zsEZ9fs5bp3KbSx
=dhuH
-----END PGP SIGNATURE-----

--=-nSNek5yoQRTvqm34JNk2--

