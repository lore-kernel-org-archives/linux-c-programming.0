From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Subject: Re: retriving a dhcp assigned ip
Date: Sat, 22 Mar 2003 21:46:22 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20030322204622.GK22528@lug-owl.de>
References: <20030322214216.45bc5681.cialdi@firenze.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Rex5+51txc1ort/q"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20030322214216.45bc5681.cialdi@firenze.net>
List-Id: <linux-c-programming.vger.kernel.org>
To: linux-c-programming@vger.kernel.org


--Rex5+51txc1ort/q
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, 2003-03-22 21:42:16 +0100, Massimiliano Cialdi <cialdi@firenze.net>
wrote in message <20030322214216.45bc5681.cialdi@firenze.net>:
> How can I retrive the ip address assigned to my host by a dhcp server?
> I think I need to use ioctl with SIOCGIFADDR parameter, but I don't know
> where the address is saved.

Look for a sample program that does the job. For example, "ifconfig"
from the net-tools package fetches the IP address...

MfG, JBG

--=20
   Jan-Benedict Glaw       jbglaw@lug-owl.de    . +49-172-7608481
   "Eine Freie Meinung in  einem Freien Kopf    | Gegen Zensur | Gegen Krieg
    fuer einen Freien Staat voll Freier B=FCrger" | im Internet! |   im Ira=
k!
      ret =3D do_actions((curr | FREE_SPEECH) & ~(IRAQ_WAR_2 | DRM | TCPA));

--Rex5+51txc1ort/q
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQE+fMueHb1edYOZ4bsRAgwaAJ9LvrxjxgmjpHF8chTmv1TEgg8b7QCcDiX0
q1E4YiwSEahrrJg9bOwVGtg=
=6RpL
-----END PGP SIGNATURE-----

--Rex5+51txc1ort/q--
