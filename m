From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Subject: Re: tcpdump equivalent for the serial port
Date: Fri, 12 Sep 2003 16:05:42 +0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20030912140542.GP14376@lug-owl.de>
References: <3F61CC14.20607@abcpages.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="dAgelbNY+bLbwwMh"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <3F61CC14.20607@abcpages.com>
List-Id: <linux-c-programming.vger.kernel.org>
To: linux-c-programming@vger.kernel.org


--dAgelbNY+bLbwwMh
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, 2003-09-12 15:37:24 +0200, Nicolae Mihalache <mache@abcpages.com>
wrote in message <3F61CC14.20607@abcpages.com>:
> Hello!
>=20
> I'm interested if somebody has any ideea how to write a program that=20
> is able to sniff the data passing through a serial port the same way=20
> tcpdump is able to show the data passing through the ethernet cable,=20
> i.e. without disturbing the application that sends/receives the data.
> I've seen few programs that basically work as tunnels opening a=20
> pseudo-console where the application connects and writing on the other=20
> side to the serial device. This approach is not very useful because I=20
> want to be able to start/stop my sniffer without interupting the=20
> communication and also the application can control different settings=20
> of the serial port which probably will not be forwarded by the tunnel.

Your approach won't work, but I can hint you to another. If you don't
need the *wire states*, but only the data your application receives (or
transmits), then this is easy. Simply use strace or a preload lib to
intercept open, close, read and write.

That way, you don't monitor the serial port itself, but the application
using it. For me, that has always been enough:-)

MfG, JBG

--=20
   Jan-Benedict Glaw       jbglaw@lug-owl.de    . +49-172-7608481
   "Eine Freie Meinung in  einem Freien Kopf    | Gegen Zensur | Gegen Krieg
    fuer einen Freien Staat voll Freier B=FCrger" | im Internet! |   im Ira=
k!
      ret =3D do_actions((curr | FREE_SPEECH) & ~(IRAQ_WAR_2 | DRM | TCPA));

--dAgelbNY+bLbwwMh
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQE/YdK2Hb1edYOZ4bsRAtlYAKCHSEIj7yQbCqQ9A45jog1hST9zcACgjNHQ
vZGJJ2MN3sTR5JJlLR2eAlM=
=a3D1
-----END PGP SIGNATURE-----

--dAgelbNY+bLbwwMh--
