From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Subject: Re: named structure members
Date: Thu, 11 Sep 2003 18:52:13 +0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20030911165213.GJ14376@lug-owl.de>
References: <20030911110742.GD6863@3d-computers.co.uk> <000401c3786d$8cfc01c0$0b04a8c0@aca.org.ar> <20030911142642.GD14403@3d-computers.co.uk> <16224.39341.204427.234601@cerise.nosuchdomain.co.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="on8rd7EWTMz+66U7"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <16224.39341.204427.234601@cerise.nosuchdomain.co.uk>
List-Id: <linux-c-programming.vger.kernel.org>
To: linux-c-programming@vger.kernel.org


--on8rd7EWTMz+66U7
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, 2003-09-11 16:50:05 +0100, Glynn Clements <glynn.clements@virgin.ne=
t>
wrote in message <16224.39341.204427.234601@cerise.nosuchdomain.co.uk>:
> Matthew Harrison wrote:
> > here is the struct that i want my config to go into:
> There are a number of ways which you could improve upon this, but
> there isn't anything along the lines of:
>=20
> 	config.<something involving "keyword"> =3D value;
>=20
> Structure fields have to be specified explicitly; you can't "index" a
> structure in the manner of an associative array.
>=20
> One possible solution is:
>=20
> enum cfg_option {
> 	cfg_db_host,
> 	cfg_db_name,
> 	cfg_db_pass,
> 	cfg_db_user,
> 	CFG_COUNT
> };
[...]
Another approach is to use a union (containing any possible things, in
your case only char pointers) inside a struct (which also contains a
char name[] and an int type). Build up an array with these structs, one
for each config option.

Then have a function which gets on option name as well as an option
value which searches throuch all ->name's of your array and assigns the
(properly converted) value to the proper union type.

To access these options, use multiple access functions (ie.

int get_int(char *option)

) which also searches through the array and returns the int part of the
union.

MfG, JBG

--=20
   Jan-Benedict Glaw       jbglaw@lug-owl.de    . +49-172-7608481
   "Eine Freie Meinung in  einem Freien Kopf    | Gegen Zensur | Gegen Krieg
    fuer einen Freien Staat voll Freier B=FCrger" | im Internet! |   im Ira=
k!
      ret =3D do_actions((curr | FREE_SPEECH) & ~(IRAQ_WAR_2 | DRM | TCPA));

--on8rd7EWTMz+66U7
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQE/YKg9Hb1edYOZ4bsRAjdDAJ0RI1OMQMF1Rn/7IeSSg88Ql8TXNgCghi9b
OEQYft+tPBwvTiPnFldGEFo=
=JONn
-----END PGP SIGNATURE-----

--on8rd7EWTMz+66U7--
