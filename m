From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Subject: Re: The stickybit!!
Date: Fri, 17 Dec 2004 10:34:02 +0100
Message-ID: <20041217093402.GW16958@lug-owl.de>
References: <1103265276.6880.8.camel@myLinux>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="u1ypDpa0Zap8goqZ"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1103265276.6880.8.camel@myLinux>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
To: Linux C Programming <linux-c-programming@vger.kernel.org>


--u1ypDpa0Zap8goqZ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, 2004-12-17 12:04:36 +0530, Jagadeesh Bhaskar P <jbhaskar@hclinsys.c=
om>
wrote in message <1103265276.6880.8.camel@myLinux>:
> Hi,
> 	Though it is known that stickybit is obsolete, im just curious to see
> the effect of setting a sticky bit on an executable file.

It isn't obsolete. It's a rarely used feature that's actually quite
important. Most of the time, you can try to work around it, but the
sticky bit will most probably just stay as it is.

> 	Is there a way to findout the data if residing in swap area after the
> process is terminated, using a C program??

Not (easily), at last. You can try to open the swap area(s) with
O_DIRECT and prepare a copy of it. However, you don't know which pages
were owned by the terminated process formerly so you only can step
through all the bytes and hope to find something useful...

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

--u1ypDpa0Zap8goqZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQFBwqgKHb1edYOZ4bsRAkwKAKCTl5POEa53POqgUqiga55Z7nWMBACdHz3C
fOc92CCYX8yALx6kteuQw5Y=
=dMLn
-----END PGP SIGNATURE-----

--u1ypDpa0Zap8goqZ--
