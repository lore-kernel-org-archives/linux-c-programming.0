From: Matthew Harrison <matth@3d-computers.co.uk>
Subject: Re: named structure members
Date: Thu, 11 Sep 2003 18:13:12 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20030911171312.GB15184@3d-computers.co.uk>
References: <20030911110742.GD6863@3d-computers.co.uk> <000401c3786d$8cfc01c0$0b04a8c0@aca.org.ar> <20030911142642.GD14403@3d-computers.co.uk> <16224.39341.204427.234601@cerise.nosuchdomain.co.uk> <20030911165213.GJ14376@lug-owl.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="kbCYTQG2MZjuOjyn"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20030911165213.GJ14376@lug-owl.de>
List-Id: <linux-c-programming.vger.kernel.org>
To: linux-c-programming@vger.kernel.org


--kbCYTQG2MZjuOjyn
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

i am going thru all these suggestions at a slow rate, but it's time
to finish work now so I won't be able to reply from home.

please don't think i'm ignoring you, i am very grateful.

On Thu, Sep 11, 2003 at 06:52:13PM +0200, Jan-Benedict Glaw wrote:
> On Thu, 2003-09-11 16:50:05 +0100, Glynn Clements <glynn.clements@virgin.=
net>
> wrote in message <16224.39341.204427.234601@cerise.nosuchdomain.co.uk>:
> > Matthew Harrison wrote:
> > > here is the struct that i want my config to go into:
> > There are a number of ways which you could improve upon this, but
> > there isn't anything along the lines of:
> >=20
> > 	config.<something involving "keyword"> =3D value;
> >=20
> > Structure fields have to be specified explicitly; you can't "index" a
> > structure in the manner of an associative array.
> >=20
> > One possible solution is:
> >=20
> > enum cfg_option {
> > 	cfg_db_host,
> > 	cfg_db_name,
> > 	cfg_db_pass,
> > 	cfg_db_user,
> > 	CFG_COUNT
> > };
> [...]
> Another approach is to use a union (containing any possible things, in
> your case only char pointers) inside a struct (which also contains a
> char name[] and an int type). Build up an array with these structs, one
> for each config option.
>=20
> Then have a function which gets on option name as well as an option
> value which searches throuch all ->name's of your array and assigns the
> (properly converted) value to the proper union type.
>=20
> To access these options, use multiple access functions (ie.
>=20
> int get_int(char *option)
>=20
> ) which also searches through the array and returns the int part of the
> union.
>=20
> MfG, JBG
>=20
> --=20
>    Jan-Benedict Glaw       jbglaw@lug-owl.de    . +49-172-7608481
>    "Eine Freie Meinung in  einem Freien Kopf    | Gegen Zensur | Gegen Kr=
ieg
>     fuer einen Freien Staat voll Freier B=FCrger" | im Internet! |   im I=
rak!
>       ret =3D do_actions((curr | FREE_SPEECH) & ~(IRAQ_WAR_2 | DRM | TCPA=
));



--=20
Mat Harrison
Technical Developer
3d Computer Systems Ltd.
matth@3d-computers.co.uk

--kbCYTQG2MZjuOjyn
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (OpenBSD)

iD8DBQE/YK0kmbMTrp/jhicRAhzGAJ0SE0OudjMsuf9HFSFC/2EZN5CN6wCeIb0A
BuELLM5lpHc2+THDoWwQ/fc=
=SyYV
-----END PGP SIGNATURE-----

--kbCYTQG2MZjuOjyn--
