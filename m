From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Subject: Re: Multithreaded /sbin.init? Is it possible?
Date: Sun, 14 Sep 2003 21:37:20 +0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20030914193720.GA12661@lug-owl.de>
References: <200309141240.55800.eric@cisu.net> <20030914182509.GZ12661@lug-owl.de> <200309141359.43121.eric@cisu.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5KENZRfAmuo1v8rU"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <200309141359.43121.eric@cisu.net>
List-Id: <linux-c-programming.vger.kernel.org>
To: linux-c-programming@vger.kernel.org


--5KENZRfAmuo1v8rU
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, 2003-09-14 13:59:43 -0500, Eric <eric@cisu.net>
wrote in message <200309141359.43121.eric@cisu.net>:
> On Sunday 14 September 2003 01:25 pm, Jan-Benedict Glaw wrote:
> > On Sun, 2003-09-14 12:40:55 -0500, Eric <eric@cisu.net>
> > wrote in message <200309141240.55800.eric@cisu.net>:
> > > Hello,
> > > 	Wouldn't the Linux Boot process be speeded up if the init program was
> > > multithreaded? I know a little about threads.. and I think there migh=
t be
> >
> > Not really if they *run*, but if they sleep...
> >
> True. But I remember seeing my entire boot process halt if a script doesn=
t=20
> terminate. Or are you talking about something else. I know that init scri=
pts=20
> often start other programs in the background. Is this what you mean by sl=
eep?

Well, even in your "threatened" (or better named partially parallelized)
run a single script which doesn't finish will halt the whole process
because you're waiting for a *group* to finish...

Wrt. sleep, many scripts work like this:

- Check if binary is there (0.05sec)
- Execute binary (0.1sec)
- sleep 1

For me (Debian/unstable), I find 10 scripts in group "20". Let only half
of them sleep for a second. If you run them one-by-one, you'll have to
sleep for 5 seconds (while all testing for binaries / startup of
binaries take only 0.5sec). If you run all of them in parallel (given
that you've got enough RAM not to be forced into swap), you'll save
4sec...

> > > 	 Each group would only take as long and the slowest script instead of
> > > the sum of the execution time of the scripts. The init would start wi=
th
> > > the S1 scripts and maybe fork 3 times, wait for each to finish...., t=
hen
> > > fork maybe twice for the S2 group if there are two scripts, wait for =
them
> > > to finish...etc....
> >
> > Well, if each group would only take to run as long as it's longest
> > running member, you'd need the CPU power to run them in parallel.
> > Threads (or multiple, concurrently running /etc/initd./ scripts) would
> > need several processors to really run in parallel. If you only have one
> > CPU, all processes/threads would get time slices to run in.
> >
> > That is, in theory, their behaviour for *running*. However, init scripts
> > don't "run" all the time. Some of them actually sleep. Sleeping can even
> > be parallelized in a good manner with less CPUs than processes, so you
> > may gain a little speed, but from sleeping-in-parallel, not from
> > running-in-parallel. On the other hand, you hit the system with greater
> > memory consumption which, for low-RAM machines, may force you into swap,
> > which will really make you slow...
> 	I wasn't really concerned about RAM consumption. Im talking about speedi=
ng=20
> things up for a reasonably recent system such as a user desktop box which=
=20
> gets rebooted alot instead of a p133 router which never reboots.

For these type of boxes, it'll indeed be a speedup to run each numbered
group in parallel.

But this has nothing to do with threads:)

> > > 	Is this even possible?
> >
> > Well, threads (on their own) are a great thing iff
> >
> > 	- you've got many (identical) tasks to _do_ in parallel while
> > 	  having about the same number of CPUs.
> > 	- you need to wait for rare events (ie. read from serial
> > 	  interfaces and the like).
> >
> > Threads in their own don't speed a well-written program up. They even
> > have the capacity to slow you down (by requiring unneccessary task
> > switches).
> >
> 	True, I do know this much. So far its just a theory that parallelizing w=
ill=20
> speed up boot time on a UniProcessor machine.
> 	I have a SMP AthlonMP w/ 512MB ram box so running the boot in parallel i=
s=20
> particularly interesting and useful to me.

ACK. As I told, if you've got enough RAM and a number of groups with > 1
member (ie. Debians group 20 containing 10 members for me), you'll most
probably see a *real* speed-up.

> > However, I've done a little test with my laptop (P2-266, 128MB RAM).
> > Groupwise parallelized, taking rc2 (not rcS) takes 5sec, vs. 20sec for
> > the non-parallelized traversal. But screen output now is even less
> > readable than before (Ever seen HP-UX starting?)...

> 	Lol, yea I completely understood at the outset that a simple modificatio=
n of=20
> init would make the boot process unreadable. However I am taking it in si=
mple=20
> steps and theorizing about the possible speed benifits, not the actual=20
> usability yet.  Could you please send me the source or a more descriptive=
=20
> e-mail on how you groupwise-parallelized init 2?  Did you modify the init=
=20
> source or did you do a little quick hacking and just run the scripts in=
=20
> parallel with bash or something?

It's quite simple. Debians /etc/init.d/rc script uses a function
"startup". I've modified it so that:

	- The 'Sxx' value is cutted out of the script name and compared
	  to the last value.
	- At command execution, a '&' is added.
	- Looks like this, then:

OLD_S=3DS00
startup() {
	NEW_S=3D"`echo "$1" | cut -f 4 -d '/' | cut -b 1-3`"
	if [ "${OLD_S}" =3D "${NEW_S}" ]; then
		wait
		OLD_S=3D"${NEW_S}"
	fi
# ...original startup code, with '&' added to the command execution
}

Additionally, you need a wait after the 'start loop'.

Quite simple, eh? You can do the same to the /etc/init.d/rcS script,
which controls system startup phase (/etc/rcS.d/*).

MfG, JBG

--=20
   Jan-Benedict Glaw       jbglaw@lug-owl.de    . +49-172-7608481
   "Eine Freie Meinung in  einem Freien Kopf    | Gegen Zensur | Gegen Krieg
    fuer einen Freien Staat voll Freier B=FCrger" | im Internet! |   im Ira=
k!
      ret =3D do_actions((curr | FREE_SPEECH) & ~(IRAQ_WAR_2 | DRM | TCPA));

--5KENZRfAmuo1v8rU
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQE/ZMNwHb1edYOZ4bsRAlH4AJ4sEuTrrq9jx9dIKqwTzr1ucoqIxQCgiFXT
hxW0NxbpIGbWau7VgQJS+AE=
=Hp3H
-----END PGP SIGNATURE-----

--5KENZRfAmuo1v8rU--
