From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Subject: Re: Newbie question on malloc()
Date: Fri, 4 Jun 2004 10:06:12 +0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20040604080612.GB20632@lug-owl.de>
References: <002d01c44897$78ae58d0$de01a8c0@qnessmphibiki> <1086196092.29970.2.camel@localhost> <16574.4399.288522.256729@cerise.nosuchdomain.co.uk> <20040602183734.GU20632@lug-owl.de> <20040603013427.GD2562@luna.mooo.com> <20040603194251.GY20632@lug-owl.de> <20040603234457.GK2562@luna.mooo.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="kPvq9m3HANyIMt9l"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20040603234457.GK2562@luna.mooo.com>
List-Id: <linux-c-programming.vger.kernel.org>
To: linux-c-programming <linux-c-programming@vger.kernel.org>


--kPvq9m3HANyIMt9l
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, 2004-06-04 02:44:57 +0300, Micha Feigin <michf@post.tau.ac.il>
wrote in message <20040603234457.GK2562@luna.mooo.com>:
> On Thu, Jun 03, 2004 at 09:42:51PM +0200, Jan-Benedict Glaw wrote:
> > Read again. There ARE (or at least: were) operating systems that
> > intentionally did *not* implicitely free memory. If an application
> > missed to free all allocated memory, it's lost. Forever.
>=20
> Single process operating systems could get away with doing that. Multi
> process operating systems (and most modern ones are) can't afford that
> luxury as it will allow one misbehaving process to kill the system
> (maybe win 3 could get away with that as it was a cooperative multi
> tasking system as opposed to a properly scheduled one and dynamic memory
> there was a very sick thing using handles)
>=20
> Maybe some special purpose embedded systems will do that to reduce
> overhead but they will be hard to find probably.

Right you are, as I am:) I don't claim that today's most common OSes
don't reclaim memory - they do. But there have been (and for sure
they're still used) special-purpose operating systems that don't do
that. It's like "all cars to have four wheels". At least in Italia,
you'll commonly see cars with three wheels:) Special purpose, but they
exist...

MfG, JBG

--=20
   Jan-Benedict Glaw       jbglaw@lug-owl.de    . +49-172-7608481
   "Eine Freie Meinung in  einem Freien Kopf    | Gegen Zensur | Gegen Krieg
    fuer einen Freien Staat voll Freier B=FCrger" | im Internet! |   im Ira=
k!
   ret =3D do_actions((curr | FREE_SPEECH) & ~(NEW_COPYRIGHT_LAW | DRM | TC=
PA));

--kPvq9m3HANyIMt9l
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAwC10Hb1edYOZ4bsRAnS6AKCKSXdWajFfJRf/Obf09E4yrq+7MwCgj6s4
MS8Xv81HhE935siFq2kJUZs=
=zRP9
-----END PGP SIGNATURE-----

--kPvq9m3HANyIMt9l--
