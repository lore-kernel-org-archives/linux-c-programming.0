From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Subject: Re: Basic C encryption
Date: Tue, 8 Jul 2003 18:01:28 +0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20030708160128.GM20605@lug-owl.de>
References: <16138.56968.622900.806213@cerise.nosuchdomain.co.uk> <Pine.LNX.4.44.0307080924450.28267-100000@ns.isi.ulatina.ac.cr>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="UeXZ3FjlYZvuln/G"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44.0307080924450.28267-100000@ns.isi.ulatina.ac.cr>
List-Id: <linux-c-programming.vger.kernel.org>
To: linux-c-programming@vger.kernel.org


--UeXZ3FjlYZvuln/G
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, 2003-07-08 09:26:44 -0600, Fabio Miranda Hamburger <fabmirha@ns.isi=
=2Eulatina.ac.cr>
wrote in message <Pine.LNX.4.44.0307080924450.28267-100000@ns.isi.ulatina.a=
c.cr>:

> C'mon guys. I just need a basic encrypt from project of a subject of my
> bachelor.
> It's not big deal. I am out of time also.
> How can I add 1 to the ascii value of a char and write it to disc. Then,
> When am I going to read it, I have to reduce to 1 the ascii value.

So you want no compile your program, modify the binary and after
startup, you want the binary to "cure" itself?

Some systems won't even allow that (sometimes, you can either execute
_or_ modify code, but not both). Further more, you'd have to localize
your target function. Even that's a hard part (maybe you can play with
explicitely named sections), but you'll need in-depth knowledge of the
binary format your binary uses (most probably ELF or ELF64) or you need
to use the libbfd.

So - there's on "simple" way to achieve this.

Or this one - compile your function into a separate .o file and
dynamically link it with dlopen()/dlsym()/dlclose(). But then, the
reader is presented with a single object of interest:)

Again - easy to de"crypt".

MfG, JBG

--=20
   Jan-Benedict Glaw       jbglaw@lug-owl.de    . +49-172-7608481
   "Eine Freie Meinung in  einem Freien Kopf    | Gegen Zensur | Gegen Krieg
    fuer einen Freien Staat voll Freier B=FCrger" | im Internet! |   im Ira=
k!
      ret =3D do_actions((curr | FREE_SPEECH) & ~(IRAQ_WAR_2 | DRM | TCPA));

--UeXZ3FjlYZvuln/G
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQE/CurYHb1edYOZ4bsRAm6kAJ0VJKxBokwHaz3/D6vphuVlMK2B1wCfZROc
u60o4ZwA3CdLz+6npvm2mew=
=N/ct
-----END PGP SIGNATURE-----

--UeXZ3FjlYZvuln/G--
