From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Subject: Re: a 'wrapper'
Date: Sat, 29 Jun 2002 16:49:08 +0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20020629144908.GU17216@lug-owl.de>
References: <20020629052348.A50622@nietzsche>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="XSEVMyPRvc8xgDhM"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20020629052348.A50622@nietzsche>
List-Id: <linux-c-programming.vger.kernel.org>
To: linux-c-programming@vger.kernel.org


--XSEVMyPRvc8xgDhM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, 2002-06-29 05:25:02 -0500, xlp <xlp@emtel.net.co>
wrote in message <20020629052348.A50622@nietzsche>:
> hi, i have been trying to let certain process working on a remote machine=
 in this way:
> nohup ./a.out >> /dev/null &
> but when i log off, the process dies.
> Can i code a certain process that fork itself, call setsid() and run a.ou=
t with system() or exec() ?
> How can i deal with this situation? I want that the executable object a.o=
ut forget about terminal control and do its work without care about sdtin/s=
tdout/stderr.

You should never ever use system(), is's insecure. Use exec*(). However,
you won't need that - try this:

	nohup ./a.out > /dev/null 2>&1 < /dev/null &

It probably dies because of a SIGPIPE if it attempts to read something
from stdin or if it tries to write to stdout. You break this file
descriptors in the moment you log off...

MfG, JBG

--=20
Jan-Benedict Glaw   .   jbglaw@lug-owl.de   .   +49-172-7608481
	 -- New APT-Proxy written in shell script --
	   http://lug-owl.de/~jbglaw/software/ap2/

--XSEVMyPRvc8xgDhM
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQE9HciKHb1edYOZ4bsRAu0OAJ4+SoopRK63Opca+RxguymTMYH72wCfeieM
9tNxX1ClBeuB1ds/xolkTww=
=RqAg
-----END PGP SIGNATURE-----

--XSEVMyPRvc8xgDhM--
