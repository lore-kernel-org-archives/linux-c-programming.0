From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Subject: Re: Newbie question on malloc()
Date: Wed, 2 Jun 2004 20:37:34 +0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20040602183734.GU20632@lug-owl.de>
References: <002d01c44897$78ae58d0$de01a8c0@qnessmphibiki> <1086196092.29970.2.camel@localhost> <16574.4399.288522.256729@cerise.nosuchdomain.co.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="lMoHOBn3xgW8/zmj"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <16574.4399.288522.256729@cerise.nosuchdomain.co.uk>
List-Id: <linux-c-programming.vger.kernel.org>
To: linux-c-programming <linux-c-programming@vger.kernel.org>


--lMoHOBn3xgW8/zmj
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, 2004-06-02 18:41:03 +0100, Glynn Clements <glynn.clements@virgin.ne=
t>
wrote in message <16574.4399.288522.256729@cerise.nosuchdomain.co.uk>:
> John T. Williams wrote:
> > As I understand it, that is entirely up to the operation system.  Linux
> > and NT Kernel systems do reclaim unfreed memory, however I believe one
> > the major problems with Win98 was that it did not.
> >=20
> > Anyone with more information feel free to correct me
>=20
> I very much doubt that the above is accurate.
>=20
> It may be that Win98 had some specific memory leaks, but any OS which,
> in the general case, failed to recover a process' memory upon
> termination would run out of memory very quickly.

Well, that all depends on the definition of "OS". Any recent 32+ bit
operating system with virtual memory capabilities and multi-processing
will reclaim malloc()ed RAM upon process termination.

However, there are some minor operating systems (as I said, depends on
definition) out there under which processes *need* to free() their
memory. But if we talk about Linux, *BSD (right, and even Windows
systems starting from Win 3.1) will reclaim memory:)

However, if your program is designed so that you can easily track all
allocations, it doesn't harm if you free everything before exit...

MfG, JBG

--=20
   Jan-Benedict Glaw       jbglaw@lug-owl.de    . +49-172-7608481
   "Eine Freie Meinung in  einem Freien Kopf    | Gegen Zensur | Gegen Krieg
    fuer einen Freien Staat voll Freier B=FCrger" | im Internet! |   im Ira=
k!
   ret =3D do_actions((curr | FREE_SPEECH) & ~(NEW_COPYRIGHT_LAW | DRM | TC=
PA));

--lMoHOBn3xgW8/zmj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAvh5uHb1edYOZ4bsRApx8AJ4ob0OjNqE/2o5Yl/5VB7GWZ8lHKACgj7d2
TIaSMxicUtK8Ee7VR6peLDo=
=2aA2
-----END PGP SIGNATURE-----

--lMoHOBn3xgW8/zmj--
