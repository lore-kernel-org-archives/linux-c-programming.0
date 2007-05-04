From: leslie.polzer@gmx.net
Subject: Re: class Q_CORE_EXPORT QFlag
Date: Fri, 4 May 2007 13:27:57 +0200
Message-ID: <20070504112757.GC11947@wintermute.farpoint>
References: <46372A8E.5090201@gmail.com>
Reply-To: leslie.polzer@gmx.net
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="96YOpH+ONegL0A3E"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <46372A8E.5090201@gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
To: Shriramana Sharma <samjnaa@gmail.com>
Cc: Linux C Programming List <linux-c-programming@vger.kernel.org>


--96YOpH+ONegL0A3E
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 01, 2007 at 05:24:54PM +0530, Shriramana Sharma wrote:

> I see many usages in the Qt sources like:
>
> class Q_CORE_EXPORT QFlag { <blah blah blah> } ;
>
> Isn't the word immediately next to the keyword class supposed to be
> the class name? Q_CORE_EXPORT etc are certainly not class names. What
> are they and how are they allowed in between the word class and the
> class name?

It's either a C preprocessor symbol defined somewhere else, or, what's
more likely, a MOC preprocessor symbol.

  Leslie

--=20
Personal homepage: https://viridian.dnsalias.net/~sky/homepage/
gpg --keyserver pgp.mit.edu --recv-keys DD4EBF83

--96YOpH+ONegL0A3E
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.7 (GNU/Linux)

iD8DBQFGOxi8yYzv6N1Ov4MRApu1AJ0R/3AbL7DGXlHLydbNoKfPSoPjJwCfTZTZ
oMNQ0W5oUQdvraby67DYrGg=
=ZXy1
-----END PGP SIGNATURE-----

--96YOpH+ONegL0A3E--
