From: Mat Harris <mat.harris@genestate.com>
Subject: Re: writing logfile
Date: Tue, 25 Feb 2003 13:11:43 +0000
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20030225131143.C31033@genestate.com>
References: <20030225105740.A31033@genestate.com> <20030225133810.C28473@neutrino.particles.org> <20030225124937.B31033@genestate.com> <3E5B6B11.3020001@veritel.com.br>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-md5;
	protocol="application/pgp-signature"; boundary="k4f25fnPtRuIRUb3"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <3E5B6B11.3020001@veritel.com.br>; from william@veritel.com.br on Tue, Feb 25, 2003 at 10:09:37 -0300
List-Id: <linux-c-programming.vger.kernel.org>
To: "William N. Zanatta" <william@veritel.com.br>
Cc: Elias Athanasopoulos <elathan@phys.uoa.gr>, linux-c-programming@vger.kernel.org


--k4f25fnPtRuIRUb3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

i thought it was something along those lines. so i need to do dot-to-dot
with the functions. i will read up on that in a mo

On Tue, Feb 25, 2003 at 10:09:37 -0300, William N. Zanatta wrote:
>=20
>    Wow it is a mess! Time to get the old book, sit down and read some=20
> more...
>=20
>    You are opening a file through open() which returns an integer=20
> representation of the file descriptor and trying to write on it through=
=20
> fputs() which writes to a file descriptor represented by a FILE pointer.
>=20
>    That's your answer. You are using the wrong functions.
>=20
>    You may either change your code to work with integers, open(), read()=
=20
>   write() and close() or make it use FILE *, fopen(), fread() (...),=20
> fputs() (...) and fclose(). It is up to you and will depends on the kind=
=20
> of application you're writing.
>=20
>    Each of the ways of file manipulation has advantages and/or=20
> disadvantages. You should seek for something about that over the net.
>=20
>    ">   loghandle =3D open(logfile, O_CREAT);"
>=20
>    Maybe I'm wrong, but I think this previous call just creates a file=20
> and doesn't make it available for reading/writing in any way. Is that=20
> right brothers???
>=20
>    william
>=20
> --=20
> Perl combines all of the worst aspects of BASIC, C and line noise.
>                  -- Keith Packard

--=20
Mat Harris			OpenGPG Public Key ID: C37D57D9
mat.harris@genestate.com	www.genestate.com=09

--k4f25fnPtRuIRUb3
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE+W2uPEsYvZsN9V9kRAoSSAKCAIenaOFaD+ypDYhZmDxT18VU1owCgxQYJ
Ot+dRiQEnlNNmFQ4Rlb7Mck=
=row1
-----END PGP SIGNATURE-----

--k4f25fnPtRuIRUb3--
