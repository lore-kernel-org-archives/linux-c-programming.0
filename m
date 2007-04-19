From: leslie.polzer@gmx.net
Subject: Re: unable to link to a static library present alongside a shared library
Date: Thu, 19 Apr 2007 14:34:36 +0200
Message-ID: <20070419123436.GA19433@wintermute.farpoint>
References: <46260A74.90309@gmail.com> <17958.13648.425008.752038@cerise.gclements.plus.com> <46266604.8090103@gmail.com> <17958.31994.242710.443269@cerise.gclements.plus.com> <46273FFC.2070902@gmail.com>
Reply-To: leslie.polzer@gmx.net
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="LZvS9be/3tNcYl/X"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <46273FFC.2070902@gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
To: Shriramana Sharma <samjnaa@gmail.com>
Cc: linux-c-programming@vger.kernel.org


--LZvS9be/3tNcYl/X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 19, 2007 at 03:40:04PM +0530, Shriramana Sharma wrote:

> >meant to be loaded. OTOH, the Linux loader doesn't care where a
> >symbol comes from, so long as something defines it.
>
> And what would be the implications of that? I mean, what happens
> practically because of that?

You can deceive the program by using LD_PRELOAD tricks:
You may trace a certain group of functions,
chosen by you.
You may customize applications without having access to their
source or modify them in other ways as you see fit (as long as
it's dependent on a dynamically bound library function).

And so on.

  Leslie

--=20
NEW homepage: https://viridian.dnsalias.net/~sky/homepage/
gpg --keyserver pgp.mit.edu --recv-keys DD4EBF83

--LZvS9be/3tNcYl/X
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.7 (GNU/Linux)

iD8DBQFGJ2HcyYzv6N1Ov4MRAtFDAJ9zjqR05ywyvOLrRDPvqVrnbzmLWACdF+Wz
qQNqQDEvRlAlZg8YGYG6hBc=
=7gkQ
-----END PGP SIGNATURE-----

--LZvS9be/3tNcYl/X--
