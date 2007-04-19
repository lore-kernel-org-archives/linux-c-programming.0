From: leslie.polzer@gmx.net
Subject: Re: unable to link to a static library present alongside a shared library
Date: Thu, 19 Apr 2007 18:30:29 +0200
Message-ID: <20070419163029.GA22700@wintermute.farpoint>
References: <46260A74.90309@gmail.com> <17958.13648.425008.752038@cerise.gclements.plus.com> <46266604.8090103@gmail.com> <17958.31994.242710.443269@cerise.gclements.plus.com> <46273FFC.2070902@gmail.com> <20070419123436.GA19433@wintermute.farpoint> <4627731F.3040108@gmail.com>
Reply-To: leslie.polzer@gmx.net
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="9jxsPFA5p3P2qPhR"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4627731F.3040108@gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
To: Shriramana Sharma <samjnaa@gmail.com>
Cc: linux-c-programming@vger.kernel.org


--9jxsPFA5p3P2qPhR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 19, 2007 at 07:18:15PM +0530, Shriramana Sharma wrote:
> leslie.polzer@gmx.net wrote:
>
> >You may trace a certain group of functions, chosen by you.
>
> I was able to get an idea of how the other two uses follow from this
> property of the Linux loader, but can you please elaborate a bit on
> this one?

You can just wrap open(), for example, and provide its full
functionality, but also print out a message how it is called.

  Leslie

--=20
NEW homepage: https://viridian.dnsalias.net/~sky/homepage/
gpg --keyserver pgp.mit.edu --recv-keys DD4EBF83

--9jxsPFA5p3P2qPhR
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.7 (GNU/Linux)

iD8DBQFGJ5klyYzv6N1Ov4MRAsZdAJ9cEvKDdnJ8VkI2NhPDHM2jbWlATwCfSO6P
0F2ayYKjt8OKpraH6ShR56E=
=Y2Pf
-----END PGP SIGNATURE-----

--9jxsPFA5p3P2qPhR--
