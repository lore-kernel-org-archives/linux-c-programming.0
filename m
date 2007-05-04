From: leslie.polzer@gmx.net
Subject: Re: enum types and casting
Date: Fri, 4 May 2007 13:26:53 +0200
Message-ID: <20070504112653.GB11947@wintermute.farpoint>
References: <46342FCA.1090400@gmail.com>
Reply-To: leslie.polzer@gmx.net
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Fba/0zbH8Xs+Fj9o"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <46342FCA.1090400@gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
To: Shriramana Sharma <samjnaa@gmail.com>
Cc: Linux C Programming List <linux-c-programming@vger.kernel.org>


--Fba/0zbH8Xs+Fj9o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 29, 2007 at 11:10:26AM +0530, Shriramana Sharma wrote:

> 1. Are enums allowed as types only in C++ and not in C?

They are part of ANSI C.


> gcc rejects using an enum as a type whereas g++ accepts it.

Not really.  You need to say "enum BODY body".


> When the target enum of the cast contains no name that has the same
> integer value as the value being casted, how does g++ accept the cast?
> Is this expected behaviour or a bug?

You are doing C style casts here, which you shouldn't.
The compiler will warn you at best, but in the end he will handle
everything as raw bytes.

  Leslie

--=20
Personal homepage: https://viridian.dnsalias.net/~sky/homepage/
gpg --keyserver pgp.mit.edu --recv-keys DD4EBF83

--Fba/0zbH8Xs+Fj9o
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.7 (GNU/Linux)

iD8DBQFGOxh9yYzv6N1Ov4MRAuROAJ9vtlqaRu+7pkRE+E8AWDFW6CQ9iwCeMHum
KozZMcVWl3DhPWnq/me8l/s=
=n2XG
-----END PGP SIGNATURE-----

--Fba/0zbH8Xs+Fj9o--
