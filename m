From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Subject: Re: Returned mail: delivery problems encountered
Date: Thu, 28 Oct 2004 18:26:26 +0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20041028162625.GG11105@lug-owl.de>
References: <1098934436.6437.7.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jRdC2OsRnuV8iIl8"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1098934436.6437.7.camel@localhost.localdomain>
List-Id: <linux-c-programming.vger.kernel.org>
To: linux prg <linux-c-programming@vger.kernel.org>


--jRdC2OsRnuV8iIl8
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, 2004-10-27 22:34:05 -0500, Edward Parrilla <eparrilla@comcast.net>
wrote in message <1098934436.6437.7.camel@localhost.localdomain>:
> > I have the following:
> > #define STDIN 0

Use STDIN_FILENO (unistd.h) instead of this hack.

> > /* .......*/
> > =20
> > int nfds;
> > struct timeval tv;
> > fd_set rfds;
> > fd_set afds;
> > FD_ZERO(&afds);
> > tv.tv_sec=3D0;
> > tv.tv_usec=3D0
> > FD_SET(STDIN, &afds);
> > FD_SET(msock, &afds);
> > nfds=3Dgetdtablesize();
> > msock=3DpassiveTCP(service, 5); <--listening socket
> > while(1)
> > {
> >    memcpy(&rfds,&afds, sizeof(rfds));
> >    if (select(nfds, &rfds, (fd_set *)0, (fd_set *)0, &tv)<0)
> >          errexit (" error ");
> >   if (FD_ISSET(STDIN,&rfds)
> >      handle(stdin);
> > =20
> > =20
> > /*  it is not making to this line */  <-- here is the prolem, it does
> > not make to the next line, it does work to the line before(i.e. takes
> > input from STDIN), but it doesn't take something coming to the socket.

Glynn already pointed out that you FD_SET(msock) before you assign it.
Additionally, you're calling select() inside a loop. You actually need
to initialize tv.tv_sec, tv.tv_usec and afds _each time_ before calling
select(). So move that into the loop:-)

> > if (FD_ISSET(msock, &rfds))
> >    {
> >       handle _incoming _request()
> >   }
> > =20
> > }

MfG, JBG

--=20
Jan-Benedict Glaw       jbglaw@lug-owl.de    . +49-172-7608481             =
_ O _
"Eine Freie Meinung in  einem Freien Kopf    | Gegen Zensur | Gegen Krieg  =
_ _ O
 fuer einen Freien Staat voll Freier B=FCrger" | im Internet! |   im Irak! =
  O O O
ret =3D do_actions((curr | FREE_SPEECH) & ~(NEW_COPYRIGHT_LAW | DRM | TCPA)=
);

--jRdC2OsRnuV8iIl8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQFBgR2xHb1edYOZ4bsRAmWrAJ9xqtyeV7yu07Ngjym4FiEcndOxAgCfRak6
/zlRqhyxerOoT3HQPzJotj0=
=Oume
-----END PGP SIGNATURE-----

--jRdC2OsRnuV8iIl8--
