From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Subject: Re: Newbie question on malloc()
Date: Thu, 3 Jun 2004 21:42:51 +0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20040603194251.GY20632@lug-owl.de>
References: <002d01c44897$78ae58d0$de01a8c0@qnessmphibiki> <1086196092.29970.2.camel@localhost> <16574.4399.288522.256729@cerise.nosuchdomain.co.uk> <20040602183734.GU20632@lug-owl.de> <20040603013427.GD2562@luna.mooo.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="F25dJIO4n7LGqrNz"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20040603013427.GD2562@luna.mooo.com>
List-Id: <linux-c-programming.vger.kernel.org>
To: linux-c-programming <linux-c-programming@vger.kernel.org>


--F25dJIO4n7LGqrNz
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, 2004-06-03 04:34:27 +0300, Micha Feigin <michf@post.tau.ac.il>
wrote in message <20040603013427.GD2562@luna.mooo.com>:
> On Wed, Jun 02, 2004 at 08:37:34PM +0200, Jan-Benedict Glaw wrote:
> > Well, that all depends on the definition of "OS". Any recent 32+ bit
> > operating system with virtual memory capabilities and multi-processing
> > will reclaim malloc()ed RAM upon process termination.
>=20
> It has nothing to do with virtual memory. In any multi-processing OS
> (any modern one probably) memory allocations are done by the kernel
> since the kernel is the one managing the system's memory.
>=20
> If the kernel doesn't have a bug, this memory is released on process
> exit (unless it is still used by another process such as with fork with
> virtual memory where it is marked copy on write).

Read again. There ARE (or at least: were) operating systems that
intentionally did *not* implicitely free memory. If an application
missed to free all allocated memory, it's lost. Forever.

But modern OSes (those with at least have the capabilities mentioned
above) will automatically reclaim all of a exit'ed process' memory.

MfG, JBG

--=20
   Jan-Benedict Glaw       jbglaw@lug-owl.de    . +49-172-7608481
   "Eine Freie Meinung in  einem Freien Kopf    | Gegen Zensur | Gegen Krieg
    fuer einen Freien Staat voll Freier B=FCrger" | im Internet! |   im Ira=
k!
   ret =3D do_actions((curr | FREE_SPEECH) & ~(NEW_COPYRIGHT_LAW | DRM | TC=
PA));

--F25dJIO4n7LGqrNz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAv386Hb1edYOZ4bsRArLuAJ496E82VK/7P2sDOIayqPd0OPjrAQCeOuAu
d2152yjXJu1sCnTabWlmxBU=
=GWEd
-----END PGP SIGNATURE-----

--F25dJIO4n7LGqrNz--
