From: Robert Schiele <rschiele@uni-mannheim.de>
Subject: Re: Segmentation fault from free()
Date: Tue, 24 Aug 2004 23:49:59 +0200
Sender: linux-gcc-owner@vger.kernel.org
Message-ID: <20040824214959.GC25368@schiele.dyndns.org>
References: <412BA650.6050305@nec-labs.com> <20040824211236.GB25368@schiele.dyndns.org> <412BB233.3020400@nec-labs.com>
Reply-To: Robert Schiele <rschiele@uni-mannheim.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="UPT3ojh+0CqEDtpF"
Return-path: <linux-gcc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <412BB233.3020400@nec-labs.com>
List-Id: <linux-c-programming.vger.kernel.org>
To: Lei Yang <leiyang@nec-labs.com>
Cc: linux-c-programming@vger.kernel.org, linux-gcc@vger.kernel.org


--UPT3ojh+0CqEDtpF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 24, 2004 at 05:25:07PM -0400, Lei Yang wrote:
> Do you mean that something 'free' needs has been destroyed?

Free memory has is managed by the heap data structure. If you free an addre=
ss
twice or free an adress that was never allocated, the data structure will g=
et
corrupted. Often this does occur silently, but in a later state a malloc or
free call with this corrupted data structure might crash your application.

> Why this wouldn't happen with small files?

I don't know your application and thus I am not even sure that this is the
source of your problem. This was just a wild guess as it is a typical error=
 in
such situations.

Robert

--=20
Robert Schiele			Tel.: +49-621-181-2517
Dipl.-Wirtsch.informatiker	mailto:rschiele@uni-mannheim.de

--UPT3ojh+0CqEDtpF
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFBK7gHxcDFxyGNGNcRAjVzAKDjvmqq24vftLG8AjM/ASH1PJY/zgCfQdIk
u5sOrAnhPuAr1CTCj3upxWI=
=Uan+
-----END PGP SIGNATURE-----

--UPT3ojh+0CqEDtpF--

