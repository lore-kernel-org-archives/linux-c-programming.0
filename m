From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Subject: Re: How to know PCI configuration
Date: Wed, 18 Aug 2004 14:17:34 +0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20040818121734.GH16935@lug-owl.de>
References: <55ee29e00408180259a005ed0@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ffsjeLa00pPTU3fi"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <55ee29e00408180259a005ed0@mail.gmail.com>
List-Id: <linux-c-programming.vger.kernel.org>
To: linux-c-programming@vger.kernel.org


--ffsjeLa00pPTU3fi
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, 2004-08-18 15:29:43 +0530, Sudheer Vutukuru <sudheer.vutukuru@gmail=
=2Ecom>
wrote in message <55ee29e00408180259a005ed0@mail.gmail.com>:
>   I want to know clock speed and width of PCI can any one tell me how
> can i find that
>=20
> 00:00.0 Host bridge: Intel Corp. 82845G/GL [Brookdale-G] Chipset Host Bri=
dge (rev 01)
> 	Subsystem: Intel Corp. 82845G/GL [Brookdale-G] Chipset Host Bridge
> 	Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Step=
ping- SERR+ FastB2B-
> 	Status: Cap+ 66Mhz- UDF- FastB2B+ ParErr- DEVSEL=3Dfast >TAbort- <TAbort=
- <MAbort+ >SERR- <PERR-

See, it's 66MHz flag is negated, so this is a 33MHz device. However, I
don't know right now how to check for 64bit bus access...

> 	Latency: 0
> 	Region 0: Memory at f8000000 (32-bit, prefetchable) [size=3D64M]
> 	Capabilities: <available only to root>

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

--ffsjeLa00pPTU3fi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFBI0jdHb1edYOZ4bsRAiZ5AJ9Sv60hjzkYcOHWOj6JuYehIPkl1wCfXR7O
cTNHyxEl7k0Wjvx8psfcmQg=
=tHlv
-----END PGP SIGNATURE-----

--ffsjeLa00pPTU3fi--
