From: Steven Smith <sos22@cam.ac.uk>
Subject: Re: Mutual exclusion
Date: Sun, 9 Jun 2002 18:46:30 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20020609174630.GA448@cam.ac.uk>
References: <20020609120501.A12543@whatever.local>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="FL5UXtIhxfXey3p5"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20020609120501.A12543@whatever.local>
List-Id: <linux-c-programming.vger.kernel.org>
To: linux-c-programming@vger.kernel.org


--FL5UXtIhxfXey3p5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

> 	What are the different types of Mutual exclusion primitives available
> in linux?  I know there is the pthread mutex and semaphores.  Is there
> anything else?
Off of the top of my head:

1) pthreads spinlocks
2) pthreads barriers
3) pthreads conditional variables
4) pthreads rwlocks
5) SysV semaphore sets
6) SysV message queues
7) fcntl file locks
8) flock file locks
9) You could probably do something with signals as well, if you're careful
10) Or with a load of pipes and suitable ingenuity
11) link() and the dnotify API, if you're feeling somewhat silly
12) flockfile()

These require varying degrees of cleverness to use, and the best one
(as always) depends on what you're using it for. There are probably
more if you look hard enough, as well.

Unless you have somewhat unusual needs, it's probably easiest to
stick to pthreads mutexs and semaphores.

Steven Smith,
sos22@cam.ac.uk.

--FL5UXtIhxfXey3p5
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE9A5R2O4S8/gLNrjcRAkrKAJ9++YxrQpaVyIFMtg0TU0GRQpdj+ACfYnPV
t9Xmp2ameEz18mPx7qGvyJU=
=DnYA
-----END PGP SIGNATURE-----

--FL5UXtIhxfXey3p5--
