From: Mat Harris <mat.harris@genestate.com>
Subject: Re: writing logfile
Date: Tue, 25 Feb 2003 12:49:37 +0000
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20030225124937.B31033@genestate.com>
References: <20030225105740.A31033@genestate.com> <20030225133810.C28473@neutrino.particles.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-md5;
	protocol="application/pgp-signature"; boundary="E13BgyNx05feLLmH"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20030225133810.C28473@neutrino.particles.org>; from elathan@phys.uoa.gr on Tue, Feb 25, 2003 at 01:38:10 +0200
List-Id: <linux-c-programming.vger.kernel.org>
To: Elias Athanasopoulos <elathan@phys.uoa.gr>
Cc: linux-c-programming@vger.kernel.org


--E13BgyNx05feLLmH
Content-Type: multipart/mixed; boundary="MW5yreqqjyrRcusr"
Content-Disposition: inline


--MW5yreqqjyrRcusr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

sorry, did my special trick of not attaching the file. here it is

On Tue, Feb 25, 2003 at 01:38:10 +0200, Elias Athanasopoulos wrote:
> On Tue, Feb 25, 2003 at 10:57:40AM +0000, Mat Harris wrote:
> > in log.h and are used for opening, writing to, and closing a logfile. I=
 have
> > attached log.h.
>=20
> You don't.
>=20
> > My questions are: How do I tell fopen to create if not there or append =
if
> > it is? I seem to get an error either way.=20
>=20
> This is explained in details in fopen(3).
>=20
> > And: Why does the fputs cause a segfault? Is there a better way of doin=
g it?
> > I know I do not understand types and casting very well so I may have it
> > totally wrong.
>=20
> fputs() is not designed to segfault; you most probably use it wrong. You
> have to show parts of your code to get at least a hint.
>=20
> Elias
>=20
> --=20
> University of Athens			I bet the human brain=20
> Physics Department				is a kludge --Marvin Minsky=20
>=20
> =09

--=20
Mat Harris			OpenGPG Public Key ID: C37D57D9
mat.harris@genestate.com	www.genestate.com=09

--MW5yreqqjyrRcusr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="log.h"

int open_log()
{
  char logfile[4096];
  int loghandle;

  strcpy(logfile, WEBROOT);
  strcat(logfile, "/logs/access.log");

  loghandle = open(logfile, O_CREAT);

  if (loghandle < 0)
    {
      fprintf(stderr, "Couldn't open logfile: %s\n", logfile);
      exit(1);
    }
  else
    {
      return loghandle;
    }
}

void close_log(int loghandle)
{
  close(loghandle);
}

void write_log(int loghandle, char string[1024])
{
  fputs(string, loghandle);
}

--MW5yreqqjyrRcusr--

--E13BgyNx05feLLmH
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE+W2ZhEsYvZsN9V9kRAs4kAKCqnvrTqhJUzUCspsAqXP3w4kLF5gCfRggB
KmLSclWUvxfCwa4e/ne6uOg=
=Tfv2
-----END PGP SIGNATURE-----

--E13BgyNx05feLLmH--
