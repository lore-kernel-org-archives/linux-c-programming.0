From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Subject: Re: writing logfile
Date: Wed, 26 Feb 2003 11:09:15 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20030226100914.GO7826@lug-owl.de>
References: <20030225105740.A31033@genestate.com> <20030225133810.C28473@neutrino.particles.org> <20030225124937.B31033@genestate.com> <15964.5048.368429.404765@cerise.nosuchdomain.co.uk> <20030226092502.A12697@genestate.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="r3kyNWDticIiPTcQ"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20030226092502.A12697@genestate.com>
List-Id: <linux-c-programming.vger.kernel.org>
To: linux-c-programming@vger.kernel.org


--r3kyNWDticIiPTcQ
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, 2003-02-26 09:25:02 +0000, Mat Harris <mat.harris@genestate.com>
wrote in message <20030226092502.A12697@genestate.com>:
> ok i have modified it to use open, write, and close> Now tho I am getting
> garbage written to the logfile. Evidently i have made an error with types
> or there is confusion between writing a text string and writing raw bits.

Despite some other shortages, try it this way:

> On Wed, Feb 26, 2003 at 01:09:12 +0000, Glynn Clements wrote:
> int open_log()
> {
>   char logfile[4096];
>   int loghandle;
>=20
>   strcpy(logfile, WEBROOT);
>   strcat(logfile, "/logs/access.log");

logfile *may* be too short. This is asking for trouble!

>   loghandle =3D open(logfile, O_WRONLY | O_CREAT | O_APPEND | O_SYNC, 060=
0);
>=20
>   if (loghandle < 0)
>     {
>       fprintf(stderr, "Couldn't open logfile: %s\n", logfile);
>       exit(1);
>     }
>   else
>     {
>       return loghandle;
>     }
> }
>=20
> void close_log(int loghandle)
> {
>   close(loghandle);
> }
>=20
> void write_log(int loghandle, char string[1024])

void
write_log(int loghandle, char *string)

> {

if(!string)
	return;

>   printf("requested file: %s\n", string);
>   write(loghandle, string, sizeof(string));
	write(loghandle, string, strlen(string));
	write(loghandle, "\n", strlen("\n"));
> }

MfG, JBG

--=20
   Jan-Benedict Glaw       jbglaw@lug-owl.de    . +49-172-7608481
   "Eine Freie Meinung in  einem Freien Kopf    | Gegen Zensur | Gegen Krieg
    fuer einen Freien Staat voll Freier B=FCrger" | im Internet! |   im Ira=
k!
       ret =3D do_actions((curr | FREE_SPEECH) && ~(IRAQ_WAR_2 | DRM | TCPA=
);

--r3kyNWDticIiPTcQ
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQE+XJJKHb1edYOZ4bsRAriVAJ9gb2hpD3LuzDqjTAzHeX9q9xwX8ACfdJs7
5acbCr3tbVkrBr++lLh+OIs=
=hrJN
-----END PGP SIGNATURE-----

--r3kyNWDticIiPTcQ--
