From: Mat Harris <mat.harris@genestate.com>
Subject: Re: writing logfile
Date: Thu, 27 Feb 2003 10:04:15 +0000
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20030227100415.A6471@genestate.com>
References: <20030225105740.A31033@genestate.com> <20030225133810.C28473@neutrino.particles.org> <20030225124937.B31033@genestate.com> <15964.5048.368429.404765@cerise.nosuchdomain.co.uk> <20030226092502.A12697@genestate.com> <20030226100914.GO7826@lug-owl.de> <20030226101811.A13475@genestate.com> <15965.6467.762493.359428@cerise.nosuchdomain.co.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-md5;
	protocol="application/pgp-signature"; boundary="PEIAKu/WMn1b1Hv9"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <15965.6467.762493.359428@cerise.nosuchdomain.co.uk>; from glynn.clements@virgin.net on Wed, Feb 26, 2003 at 07:45:07 +0000
List-Id: <linux-c-programming.vger.kernel.org>
To: linux-c-programming@vger.kernel.org


--PEIAKu/WMn1b1Hv9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

ok, thanks guys for the help with my webserver, the loggin works fine and n=
ow
I have remembered about extern void etc I have put the functions to compile
seperateley as suggested.

Just one more thing tho, the logmessage is getting printed to the client's
browser after any html content has been transferred and I can't see where it
is happening. I have put a tarball of the whole thing at

http://www.genestate.com/~matthewh/debug/

thanks again.

On Wed, Feb 26, 2003 at 07:45:07 +0000, Glynn Clements wrote:
>=20
> Mat Harris wrote:
>=20
> > ok and now i am getting something weird. when I try to log a successful
> > request, and then make the request again, it ands to the previous printf
> > message and prints it again so it repeats all the previous messages aga=
in
> > and again. Also, the garbage in the logfile is the beginning of my webr=
oot
> > "/home....". I do not know what is going on here.
>=20
> Line 52 of webserver.c:
>=20
> >	  strcat(logmsg, filename);
>=20
> should be
>=20
> 	  strcpy(logmsg, filename);
>=20
> Also:
>=20
> > #include "log.h" /* logging functions */
>=20
> Don't use #include for actual code. Put it in a separate .c file and
> compile it separately.
>=20
> > void write_log(int loghandle, char *string)
> > {
> >   write(loghandle, string, sizeof(string));
> > }
>=20
>    write(loghandle, string, strlen(string));
>=20
> Applying sizeof() to a "char *" will return the size of the pointer
> (typically 4 on a 32-bit system, 8 on a 64-bit system), not the length
> of the string to which it points.
>=20
> --=20
> Glynn Clements <glynn.clements@virgin.net>

--=20
Mat Harris			OpenGPG Public Key ID: C37D57D9
mat.harris@genestate.com	www.genestate.com=09

--PEIAKu/WMn1b1Hv9
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE+XeKeEsYvZsN9V9kRAgi3AJ9Fz2gG++xkH9vDU/kQR1Mdggl1HACgqydN
pR9O4nBDKBgPNbdaLiYDXAU=
=AjM/
-----END PGP SIGNATURE-----

--PEIAKu/WMn1b1Hv9--
