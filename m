From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Subject: sigaction() handler question
Date: Sat, 1 Mar 2003 16:34:43 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20030301153443.GB27794@lug-owl.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="JYK4vJDZwFMowpUq"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
List-Id: <linux-c-programming.vger.kernel.org>
To: linux-c-programming@vger.kernel.org


--JYK4vJDZwFMowpUq
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

I've added a handler function for a SEGSEGV signal. I'm now that far
that I do know where (from the third void * parameter to the handling
function) to find the entry to the stack. So, for i386, I now can climb
down the stack printing out the stack trace.

Unfortunately, the void * (it is mentioned to be a (ucontext_t *) in
reality...) isn't *that* big help. The stack (with "stack" I here mean
that pointer which points to some stack frame's next stack pointer) is
(on i386) 11*sizeof(long) away. To the worse, I've not really found
helpful manpages or example sources on how to "really" walk down the
stack (from a segsegv handler function). I think this could really help
in debugging for production applications esp. on slow, small
memory-sized system where you otherwise can't shoot down some really
rarely SEGViolations which (of course:-) you can't reproduce in the labs
and (because of it being a multi-threaded application) you won't even
get a core from it...

MfG, JBG

--=20
   Jan-Benedict Glaw       jbglaw@lug-owl.de    . +49-172-7608481
   "Eine Freie Meinung in  einem Freien Kopf    | Gegen Zensur | Gegen Krieg
    fuer einen Freien Staat voll Freier B=FCrger" | im Internet! |   im Ira=
k!
      ret =3D do_actions((curr | FREE_SPEECH) & ~(IRAQ_WAR_2 | DRM | TCPA));

--JYK4vJDZwFMowpUq
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQE+YNMTHb1edYOZ4bsRAo2sAKCAeGvDCL0Wm1C1r21KPhCL7ya0EwCcDPAz
qal4i9QaGATy3ys5IyPYnJw=
=IcfX
-----END PGP SIGNATURE-----

--JYK4vJDZwFMowpUq--
