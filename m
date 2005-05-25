From: Steven Smith <sos22@cantab.net>
Subject: Re: kerel level threads
Date: Wed, 25 May 2005 10:06:21 +0100
Message-ID: <20050525090621.GA1453@cam.ac.uk>
References: <20050524034750.70100.qmail@web51307.mail.yahoo.com> <42942467.9060805@cse.iitk.ac.in>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="yrj/dFKFPuw6o+aM"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <42942467.9060805@cse.iitk.ac.in>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
To: "K. Anantha Kiran" <ananth@cse.iitk.ac.in>
Cc: linux-c-programming@vger.kernel.org, sos22@srcf.ucam.org


--yrj/dFKFPuw6o+aM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

>    Does pthread_create() create kernel level threads?
Undefined.  Whether the kernel knows about the threads is up to the
implementation of the threading library.  Usually, on Linux, there is
one kernel thread for every user thread.

> My observation is that either both of the threads be Kernel level
> threads or pthread library has given wrapper functions for blocking
> calls(for example, sleep system call in our case) which stop all of
> the threads to be blocked.
Either would be an acceptable implementation.  Linux pthreads takes
the former approach.

> I read in text books that pthread libray is for creating user level
> threads(threads about which kernel is not aware of).
There are (at least) two different meanings of user-level threads.
pthread_create creates a user-level thread in the sense that it runs
user-level code, but the details of who makes the scheduling decisions
are left up to the implementation.

Steven.

--yrj/dFKFPuw6o+aM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQFClEANO4S8/gLNrjcRAmGwAJ9yKv1JfFfFyOQCEoqv+bx+2hrYGACfbqIU
vjRB8nRw7zhBdpQiW1M6NoA=
=TPyt
-----END PGP SIGNATURE-----

--yrj/dFKFPuw6o+aM--
