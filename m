From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Subject: Re: filesystem in the kernel
Date: Thu, 25 Nov 2004 11:44:23 +0100
Message-ID: <20041125104423.GD2067@lug-owl.de>
References: <5959EA4638D8734599AB75EAAFBB6FEFA471E6@mtv01ex04.mindtree.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="NxDiCysn+RCvdoZt"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5959EA4638D8734599AB75EAAFBB6FEFA471E6@mtv01ex04.mindtree.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
To: linux-c-programming@vger.kernel.org


--NxDiCysn+RCvdoZt
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, 2004-11-25 12:04:31 +0530, Bakki Srinivas <bakki_srinivas@mindtree.=
com>
wrote in message <5959EA4638D8734599AB75EAAFBB6FEFA471E6@mtv01ex04.mindtree=
=2Ecom>:
> hi,
>     when a filesystem is registered with the kernel eg.
> register_filesystem(&ext2_fs_type);
>   where is the structure ext2_fs_type declared ?

ext2_fs_type is defined in ./linux/fs/ext2/super.c, about 15 lines
above the code that registeres it :-)

ext2_fs_type itself is a "struct file_system_type", which is declared
in ./linux/include/linux/fs.h

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

--NxDiCysn+RCvdoZt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQFBpbeHHb1edYOZ4bsRAsC9AJ9FYIZssZ82cTXBtFl24Qn5BogY1wCdEyqB
SBYqey66h4lUmszBoTfcri8=
=qVx5
-----END PGP SIGNATURE-----

--NxDiCysn+RCvdoZt--
