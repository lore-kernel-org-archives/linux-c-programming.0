From: Francesco Gadaleta <francesco@gadaleta.org>
Subject: Re: assignment makes pointer from integer without a cast?
Date: Mon, 13 Dec 2004 17:13:54 +0100
Message-ID: <20041213161354.GD1487@sweetdream>
References: <1102899159.7251.14.camel@guru.puzzled.xs4all.nl> <20041213014757.89052.qmail@web12706.mail.yahoo.com>
Reply-To: francesco@gadaleta.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="CGDBiGfvSTbxKZlW"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20041213014757.89052.qmail@web12706.mail.yahoo.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
To: linux-c-programming@vger.kernel.org


--CGDBiGfvSTbxKZlW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> void usage(char *prog_ptr) /* not int* */
> {
> 	fprintf(stdout,"progname is: %s\n",prog_ptr); /* not
> *prog_ptr */
> }
> =09
> int main(int argc, char *argv[])
> {
> 	char *prog_ptr; /* not int * */
> 	prog_ptr =3D basename (argv[0]);
> 	usage(prog_ptr); /* not &prog_ptr */
> 	return(0);
> }
>=20
>=20


change this line:
prog_ptr =3D basename (argv[0]);

with this:
prog_ptr =3D (char*) basename (argv[0]);
--=20

_________________________________________________
Imagine no possessions
I wonder if you can
No need for greed or hunger
A brotherhood of man
Imagine all the people
Sharing all the world...
		John Lennon
_________________________________________________
_________________________________________________
Francesco Gadaleta - Italian GNU/Linux User
      web site: www.gadaleta.org

email      : francesco@gadaleta.org
ICQ        : 286063291
Fingerprint: 3CB8 C721 FE99 BC98 38DC F463 BFDC E4EC CE3B 7327  (1024/DSA) =
[with image]
Linux Registered User #327326
________________________________________________
Non speditemi documenti in formato Word=20
o Powerpoint.
RMS vi spiega il motivo qui:
http://www.gadaleta.org/allegati.html

--CGDBiGfvSTbxKZlW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFBvb/Cv9zk7M47cycRAkooAJ42pOVGre3NcUfQjCFL+Tx2U8/fBQCffZur
1ymlfEdYaXZggMwMiLeHE0s=
=7UH0
-----END PGP SIGNATURE-----

--CGDBiGfvSTbxKZlW--
