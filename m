From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Subject: Re: Problem with pthreads on socket
Date: Sun, 7 Nov 2004 18:05:07 +0100
Message-ID: <20041107170507.GB10443@lug-owl.de>
References: <20041106211522.GJ2094@lug-owl.de> <20041107091517.63691.qmail@web90004.mail.scd.yahoo.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="V0207lvV8h4k8FAm"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20041107091517.63691.qmail@web90004.mail.scd.yahoo.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
To: linux-c-programming@vger.kernel.org


--V0207lvV8h4k8FAm
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, 2004-11-07 01:15:17 -0800, Linux Kernel <linuxkrnl@yahoo.com>
wrote in message <20041107091517.63691.qmail@web90004.mail.scd.yahoo.com>:
> >From what i understand,in fact, this threads are
> working asynchronus and by using mutex, to be a switch
> between threads.

Correct is that they're asynchronous to each other. But mutexes aren't
used to switch between them. Mutexes are used to lock-out any other
thready while accessing commonly-used resources.

For example, if you have an application that echoes everything back, you
probably don't need *any* mutexes at all, because receiving one byte and
sending it back doesn't access any commonly used resources.

> I wish to know how the threads can run synchronus or
> totally independent.

They are independant. If you need "synchronous" working mode, you
probably shouldn't use threads at all:-)

> If you know, some how, a sample source code which is
> working, please tell me.=20

> P.S. I can send by e-mail the entire source code.

Maybe first start with an exact description of what needs to be done. To
speak honest (and not offending), parts of your sources looked quite
spaghetti-like (but that may be because of cutting out any unneeded
code). So maybe a description of the exact task would be a better start
here...

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

--V0207lvV8h4k8FAm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQFBjlXDHb1edYOZ4bsRAkpNAJ0YIRJhm1BcXt01tgUEPeQf69KLqgCdEJVi
KH2AF85DWqzroaZPiV8kDpQ=
=JkQF
-----END PGP SIGNATURE-----

--V0207lvV8h4k8FAm--
