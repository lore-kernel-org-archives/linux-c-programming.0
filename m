From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Subject: Re: anything to do with pointer to functions maybe?
Date: Thu, 23 Dec 2004 12:47:18 +0100
Message-ID: <20041223114718.GX2460@lug-owl.de>
References: <cqe6ed$ldf$1@sea.gmane.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="8D1TCnBmjJJF2KCx"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <cqe6ed$ldf$1@sea.gmane.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
To: linux-c-programming@vger.kernel.org


--8D1TCnBmjJJF2KCx
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, 2004-12-23 11:24:39 +0100, soraberri <421246@posta.unizar.es>
wrote in message <cqe6ed$ldf$1@sea.gmane.org>:
> Hi all!
> I'm having troubles understanding code:
>=20
> what type is __sighandler_t if it is defined this way:?
> typedef void (*__sighandler_t) (int);

We define that any signal handling function doesn't return anything
useful (void, that is), and all these functions get a single argument
(of type int) supplied.

> and then, what does this definition  mean:
>  #define SIG_IGN  ((__sighandler_t) 1)=09

Also, we don't want *all* signals to actually be handled. Some are to be
ignored. Since we can only use function pointers (now of type
__sighandler_t), we need to have a special magic value (1 in this case)
that we can use.

However, "1" alone doesn't make a good function pointer, nor is it a
function at all or does accept arguments. To "look" like a function
pointer of correct type, "1" is casted to be of __sighandler_t.

There would have been another approach: we could have written a small
function that does nothing and could be used instead. However, it's
address could change, so it doesn't work well as an API. This is why
instead a distenct value (1) is used instead.

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

--8D1TCnBmjJJF2KCx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQFByrBFHb1edYOZ4bsRAv8CAJ0dljp8ZwBi6BUD6tHLtEwm8VOT8ACcDfx0
4Yv5zqI9lqaUT4qeMlwahvc=
=joel
-----END PGP SIGNATURE-----

--8D1TCnBmjJJF2KCx--
