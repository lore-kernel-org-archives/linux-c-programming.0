From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Subject: Re: Multithreaded /sbin.init? Is it possible?
Date: Sun, 14 Sep 2003 20:25:10 +0200
Sender: linux-newbie-owner@vger.kernel.org
Message-ID: <20030914182509.GZ12661@lug-owl.de>
References: <200309141240.55800.eric@cisu.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="JNs4m2JFMNhdiK2v"
Return-path: <linux-newbie-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <200309141240.55800.eric@cisu.net>
List-Id: <linux-c-programming.vger.kernel.org>
To: linux-newbie@vger.kernel.org, linux-c-programming@vger.kernel.org


--JNs4m2JFMNhdiK2v
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, 2003-09-14 12:40:55 -0500, Eric <eric@cisu.net>
wrote in message <200309141240.55800.eric@cisu.net>:
> Hello,
> 	Wouldn't the Linux Boot process be speeded up if the init program was=20
> multithreaded? I know a little about threads.. and I think there might be=
=20

Not really if they *run*, but if they sleep...

> 	 Each group would only take as long and the slowest script instead of th=
e sum=20
> of the execution time of the scripts. The init would start with the S1=20
> scripts and maybe fork 3 times, wait for each to finish...., then fork ma=
ybe=20
> twice for the S2 group if there are two scripts, wait for them to=20
> finish...etc....

Well, if each group would only take to run as long as it's longest
running member, you'd need the CPU power to run them in parallel.
Threads (or multiple, concurrently running /etc/initd./ scripts) would
need several processors to really run in parallel. If you only have one
CPU, all processes/threads would get time slices to run in.

That is, in theory, their behaviour for *running*. However, init scripts
don't "run" all the time. Some of them actually sleep. Sleeping can even
be parallelized in a good manner with less CPUs than processes, so you
may gain a little speed, but from sleeping-in-parallel, not from
running-in-parallel. On the other hand, you hit the system with greater
memory consumption which, for low-RAM machines, may force you into swap,
which will really make you slow...

> 	Is this even possible?

Well, threads (on their own) are a great thing iff

	- you've got many (identical) tasks to _do_ in parallel while
	  having about the same number of CPUs.
	- you need to wait for rare events (ie. read from serial
	  interfaces and the like).

Threads in their own don't speed a well-written program up. They even
have the capacity to slow you down (by requiring unneccessary task
switches).

However, I've done a little test with my laptop (P2-266, 128MB RAM).
Groupwise parallelized, taking rc2 (not rcS) takes 5sec, vs. 20sec for
the non-parallelized traversal. But screen output now is even less
readable than before (Ever seen HP-UX starting?)...

MfG, JBG

--=20
   Jan-Benedict Glaw       jbglaw@lug-owl.de    . +49-172-7608481
   "Eine Freie Meinung in  einem Freien Kopf    | Gegen Zensur | Gegen Krieg
    fuer einen Freien Staat voll Freier B=FCrger" | im Internet! |   im Ira=
k!
      ret =3D do_actions((curr | FREE_SPEECH) & ~(IRAQ_WAR_2 | DRM | TCPA));

--JNs4m2JFMNhdiK2v
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQE/ZLKFHb1edYOZ4bsRAvsTAJ4/IwnjNxsRYFXStw7g6SpwLxLKfQCgkX0V
6kAmR9ny/mhOcuWpQybRan4=
=4+1Z
-----END PGP SIGNATURE-----

--JNs4m2JFMNhdiK2v--
-
To unsubscribe from this list: send the line "unsubscribe linux-newbie" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
Please read the FAQ at http://www.linux-learn.org/faqs
