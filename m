From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Subject: Re: Defunct Processes
Date: Wed, 29 Dec 2004 11:16:58 +0100
Message-ID: <20041229101658.GR2460@lug-owl.de>
References: <BDE318F8.1618%dsessions@ionosphere.net> <BDF77D14.1AE7%dsessions@ionosphere.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="82WbDBJhFeTAYH8j"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <BDF77D14.1AE7%dsessions@ionosphere.net>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
To: linux-c-programming@vger.kernel.org


--82WbDBJhFeTAYH8j
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, 2004-12-28 21:13:56 -0500, Darren Sessions <dsessions@ionosphere.ne=
t>
wrote in message <BDF77D14.1AE7%dsessions@ionosphere.net>:
> The application I'm working on right now gets called from another
> application. When my program is finished, I just use exit(0); to quit, but
> if I do a ps there are a ton of [applicationname] <defunct> messages.

This is a fault of the calling application. Your program became a
zombie. That's the remaining rest of a process that already finished.
(Basically, it consists of accounting information, the process' exit
value and probably of the signal number that led to the process' death).

This information needs to be handled (the parent process needs to wait()
or wait4() it, or using other methods). Normally, the parent process
should handle the SIGCHLD signal; it's generated upon a child's death.
This would allow the parent to call wait() as long as there are finished
childs (remember, you only know the signal got fired, but you don't know
how often :)  Calling wait() then will finally bury the finished child.

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

--82WbDBJhFeTAYH8j
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQFB0oQaHb1edYOZ4bsRAlqzAJ4nfqC7Z1sg/mU6GMpszGHlAdsx2wCfewRV
lQOtKFH8tWHoXAwq0jp0UjM=
=l7WG
-----END PGP SIGNATURE-----

--82WbDBJhFeTAYH8j--
