From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Subject: Re: daemonization
Date: Fri, 28 Jun 2002 23:03:48 +0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20020628210348.GT17216@lug-owl.de>
References: <20020628154913.A377@nietzsche>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="nDmTXYS4kVhtHHfR"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20020628154913.A377@nietzsche>
List-Id: <linux-c-programming.vger.kernel.org>
To: linux-c-programming@vger.kernel.org


--nDmTXYS4kVhtHHfR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, 2002-06-28 15:49:13 -0500, xlp <xlp@emtel.net.co>
wrote in message <20020628154913.A377@nietzsche>:
> Hi, I want to understand How can a executale object in Unix can become a =
"daemon" ? How can it deal with stdout, and ttys it's connected to? What ar=
e the C library function I should read man?.

- chdir() to "/"

Most important are these:

- become session leader: setsid()
- fork() and let parent exit(0)
- close() stdin, stdout and stderr and re-open() them with /dev/null
- maybe do a chroot()
- maybe open any IP ports to listen on them
- Drop root privileges: setuid(), setgid()
- Ready (TM)
- Afterwards: At any file you open, don't forget O_NOCTTY!

MfG, JBG
PS: And ___always___ check the return values of those library calls!!!

--=20
Jan-Benedict Glaw   .   jbglaw@lug-owl.de   .   +49-172-7608481
	 -- New APT-Proxy written in shell script --
	   http://lug-owl.de/~jbglaw/software/ap2/

--nDmTXYS4kVhtHHfR
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQE9HM8xHb1edYOZ4bsRAuhrAJ995TFiMtp3pS0K98ZiQZCbGKklUgCfXaTJ
KC8hb/m2FNc+PSpj7ynLalk=
=TMrS
-----END PGP SIGNATURE-----

--nDmTXYS4kVhtHHfR--
