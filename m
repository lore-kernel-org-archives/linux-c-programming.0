From: Robert Schiele <rschiele@uni-mannheim.de>
Subject: Re: Segmentation fault from free()
Date: Tue, 24 Aug 2004 23:12:36 +0200
Sender: linux-gcc-owner@vger.kernel.org
Message-ID: <20040824211236.GB25368@schiele.dyndns.org>
References: <412BA650.6050305@nec-labs.com>
Reply-To: Robert Schiele <rschiele@uni-mannheim.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="8P1HSweYDcXXzwPJ"
Return-path: <linux-gcc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <412BA650.6050305@nec-labs.com>
List-Id: <linux-c-programming.vger.kernel.org>
To: Lei Yang <leiyang@nec-labs.com>
Cc: linux-c-programming@vger.kernel.org, linux-gcc@vger.kernel.org


--8P1HSweYDcXXzwPJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 24, 2004 at 04:34:24PM -0400, Lei Yang wrote:
> Could anyone please point me out what could possibly be the reason?

Cannot say something definitely with incomplete source code.

The bug is not necessarily in the malloc/free pair of this construct.  Like=
ly
you destroyed the heap structure in earlier memory allocation/deallocation
operations (e.g. during list processing).  You may want to check your progr=
am
with a memory debugger, e.g. valgrind for i386 platform.

Robert

--=20
Robert Schiele			Tel.: +49-621-181-2517
Dipl.-Wirtsch.informatiker	mailto:rschiele@uni-mannheim.de

--8P1HSweYDcXXzwPJ
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFBK69ExcDFxyGNGNcRAl4WAJ4w6pPl1nRlnuj0qAk6zNBn3h+rfgCfT/Jg
LpSh8ZMxy+TjAWgwOqjP1ls=
=g6JR
-----END PGP SIGNATURE-----

--8P1HSweYDcXXzwPJ--

