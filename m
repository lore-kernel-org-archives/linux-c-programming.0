From: Steven Smith <sos22@cam.ac.uk>
Subject: Re: Debugging a Process ...
Date: Sat, 26 Oct 2002 08:44:21 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20021026074421.GA328@cam.ac.uk>
References: <3DB86A25.5000109@uv.unitec.edu>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="mYCpIKhGyMATD0i+"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <3DB86A25.5000109@uv.unitec.edu>
List-Id: <linux-c-programming.vger.kernel.org>
To: Ivan Deras <ideras@uv.unitec.edu>
Cc: linux-c-programming@vger.kernel.org


--mYCpIKhGyMATD0i+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> I want to know how to debug a process in Linux, i know that in Windows i=
=20
> can use Windows-API to attach a debugger process to the debugged=20
> process, but in Linux i don't know ...
If you want to attach an existing debugger, look at the documentation
for that debugger (in gdb, it's ``gdb <program_name> <pid of program>'').
If you're thinking of writing your own, have a look at man ptrace.
This isn't the clearest of documents, so you may want to have a look
at the source to a few programs which use it, like gdb, strace, or
ltrace, before starting on your own.

Steven Smith,
sos22@cam.ac.uk.

--mYCpIKhGyMATD0i+
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE9ukfVO4S8/gLNrjcRAv6kAKDaGEaZU/d+4+vkg4rNnvDy8bbuiwCdFwfN
jfXJLhb7Cgo6am3WJqdNSb4=
=d89b
-----END PGP SIGNATURE-----

--mYCpIKhGyMATD0i+--
