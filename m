From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Subject: Re: kmalloc
Date: Wed, 2 Jun 2004 08:12:33 +0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20040602061233.GI20632@lug-owl.de>
References: <8158840804060115534de05277@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="TMJUm4hsTn/F+xXF"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <8158840804060115534de05277@mail.gmail.com>
List-Id: <linux-c-programming.vger.kernel.org>
To: linux-c-programming@vger.kernel.org


--TMJUm4hsTn/F+xXF
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, 2004-06-02 04:23:32 +0530, venkata ramana <uvramana@gmail.com>
wrote in message <8158840804060115534de05277@mail.gmail.com>:
> Will the kmalloc system call fail to allocate more than 131072 bytes
> of memory? If so, Is there anyway to change this limit?

Just handle it's return code properly.

MfG, JBG

--=20
   Jan-Benedict Glaw       jbglaw@lug-owl.de    . +49-172-7608481
   "Eine Freie Meinung in  einem Freien Kopf    | Gegen Zensur | Gegen Krieg
    fuer einen Freien Staat voll Freier B=FCrger" | im Internet! |   im Ira=
k!
   ret =3D do_actions((curr | FREE_SPEECH) & ~(NEW_COPYRIGHT_LAW | DRM | TC=
PA));

--TMJUm4hsTn/F+xXF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAvW/RHb1edYOZ4bsRAjAOAJ9i6OgHzGj2xC8nDJdgTpex8GQtrACfQgJB
3TPiaWRzG+xOtfGdyiQlLIo=
=b55s
-----END PGP SIGNATURE-----

--TMJUm4hsTn/F+xXF--
