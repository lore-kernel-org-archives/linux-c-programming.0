From: Mat Harris <mat.harris@genestate.com>
Subject: Re: writing logfile
Date: Wed, 26 Feb 2003 09:25:02 +0000
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20030226092502.A12697@genestate.com>
References: <20030225105740.A31033@genestate.com> <20030225133810.C28473@neutrino.particles.org> <20030225124937.B31033@genestate.com> <15964.5048.368429.404765@cerise.nosuchdomain.co.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-md5;
	protocol="application/pgp-signature"; boundary="dkEUBIird37B8yKS"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <15964.5048.368429.404765@cerise.nosuchdomain.co.uk>; from glynn.clements@virgin.net on Wed, Feb 26, 2003 at 01:09:12 +0000
List-Id: <linux-c-programming.vger.kernel.org>
To: Glynn Clements <glynn.clements@virgin.net>
Cc: Elias Athanasopoulos <elathan@phys.uoa.gr>, linux-c-programming@vger.kernel.org


--dkEUBIird37B8yKS
Content-Type: multipart/mixed; boundary="FkmkrVfFsRoUs1wW"
Content-Disposition: inline


--FkmkrVfFsRoUs1wW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

ok i have modified it to use open, write, and close> Now tho I am getting
garbage written to the logfile. Evidently i have made an error with types
or there is confusion between writing a text string and writing raw bits.

i have attached the modified code.

Thanks for all your help so far people :)

On Wed, Feb 26, 2003 at 01:09:12 +0000, Glynn Clements wrote:
>=20
> Mat Harris wrote:
>=20
> >   loghandle =3D open(logfile, O_CREAT);
>=20
> This should probably be:
>=20
>    loghandle =3D open(logfile, O_WRONLY | O_CREAT | O_APPEND, 0600);
>=20
> You may also wish to use the O_SYNC flag, to force data to be written
> to disk immediately (so that it isn't lost if the system crashes or
> the power fails).
>=20
> As William pointed out, if you open the file with open(), you need to
> use write() to write data to the file. Alternatively, you could use
> fopen() and fputs(), but fopen() doesn't give you as much control
> (e.g. you can't set the permissions or the O_SYNC flag on creation).
>=20
> Also, you can create an ANSI stream (a "FILE *") from a descriptor
> using fdopen(), and you can get the descriptor for an ANSI stream
> using fileno(). But you need to be careful about accessing a file
> using both methods (which basically means that you need to understand
> how the two relate to each other).
>=20
> --=20
> Glynn Clements <glynn.clements@virgin.net>

--=20
Mat Harris			OpenGPG Public Key ID: C37D57D9
mat.harris@genestate.com	www.genestate.com=09

--FkmkrVfFsRoUs1wW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="log.h"

int open_log()
{
  char logfile[4096];
  int loghandle;

  strcpy(logfile, WEBROOT);
  strcat(logfile, "/logs/access.log");

  loghandle = open(logfile, O_WRONLY | O_CREAT | O_APPEND | O_SYNC, 0600);

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
  printf("requested file: %s\n", string);
  write(loghandle, string, sizeof(string));
}

--FkmkrVfFsRoUs1wW--

--dkEUBIird37B8yKS
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE+XIfuEsYvZsN9V9kRAjJJAJ9RlUtwvNjOH6lih+1xbfY6aYJwIQCeJctN
eRWPRnGlftNcT9qlC6oRKv0=
=DCXk
-----END PGP SIGNATURE-----

--dkEUBIird37B8yKS--
