From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Subject: Re: script in c
Date: Mon, 8 Nov 2004 07:48:53 +0100
Message-ID: <20041108064852.GE10443@lug-owl.de>
References: <50C05B7AA7D6924FB5E384EF14BC647B495D93@inba1mx2.corp.emc.com> <418F12F9.6070701@hq.ntsp.nec.co.jp>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7CZp05NP8/gJM8Cl"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <418F12F9.6070701@hq.ntsp.nec.co.jp>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
To: linux-c-programming@vger.kernel.org


--7CZp05NP8/gJM8Cl
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, 2004-11-08 14:32:25 +0800, Ron Michael Khu <ronkhu@ntsp.nec.co.jp>
wrote in message <418F12F9.6070701@hq.ntsp.nec.co.jp>:

[Calling a script from within a C program]

> or the exec functions =3D)

Which is generally preferred over system().  system() is a horrible
mess: you face a hard time to properly supply command line arguments
(think about arguments with tabs, spaces, CR or LF in them...).

Just always use the exec functions.

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

--7CZp05NP8/gJM8Cl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQFBjxbTHb1edYOZ4bsRAuPVAJ0VChjyOzv7/PwcNrd/y0uebCglvwCeKWQ3
QlD2Q7+nLjnGf+rBDIRAR5U=
=urF3
-----END PGP SIGNATURE-----

--7CZp05NP8/gJM8Cl--
