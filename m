From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Subject: Re: usage of WIN_SMART
Date: Wed, 24 Nov 2004 13:10:36 +0100
Message-ID: <20041124121036.GQ2067@lug-owl.de>
References: <1101293397.3787.34.camel@myLinux>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jigfid2yHjNFZUTO"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1101293397.3787.34.camel@myLinux>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
To: Linux C Programming <linux-c-programming@vger.kernel.org>


--jigfid2yHjNFZUTO
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, 2004-11-24 16:19:57 +0530, Jagadeesh Bhaskar P <jbhaskar@hclinsys.c=
om>
wrote in message <1101293397.3787.34.camel@myLinux>:
> Can someone help me with an explanation for the usage of WIN_SMART
> directive declared in hdreg.h in ioctl() function?

Just look at some users of WIN_SMART. Found these with Google:

Function ataReadSmartValues() in
http://cvs.sourceforge.net/viewcvs.py/smartmontools/sm5/atacmds.c?rev=3D1.2

Function smart_read_values() in
http://www.linux-ide.org/smart/ide-smart.c

There are other examples, too.  Of course, you can only use code out of
these if your software is going to be available under GNU GPL ...

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

--jigfid2yHjNFZUTO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQFBpHo8Hb1edYOZ4bsRAj39AJ9SLfC6XA4zA/9h5NHbSOjKuO4f+wCeK3Df
kUfwaJnDWjyuN8KcFDcWD2E=
=2/J5
-----END PGP SIGNATURE-----

--jigfid2yHjNFZUTO--
