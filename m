From: "Steven" <sos22@cam.ac.uk>
Subject: Re: Linux syscall list
Date: Tue, 5 Aug 2003 19:10:44 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20030805181044.GA828@archibold.chu.cam.ac.uk>
References: <200308050906.33542.rafael@thinkfreak.com.br>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="nFreZHaLTZJo0R7j"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <200308050906.33542.rafael@thinkfreak.com.br>
List-Id: <linux-c-programming.vger.kernel.org>
To: Rafael Costa dos Santos <rafael@thinkfreak.com.br>
Cc: linux-c-programming@vger.kernel.org


--nFreZHaLTZJo0R7j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

> Where can I find the last linux syscall list ?
The system call table for an x86 Linux kernel is at the end of
arch/i386/kernel/entry.S.  The __NR_ constants are defined in
include/asm-i386/unistd.h.

Sorry, but I don't know the equivalents for other architectures.

Steven Smith,
sos22@cam.ac.uk.

--nFreZHaLTZJo0R7j
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (FreeBSD)

iD8DBQE/L/MkO4S8/gLNrjcRAilXAKDWn8MMRukwTnUTcjBxJT6hlFewZQCgtIVr
Bq3POOd3uo9LTri9Fyrcr+8=
=ZQte
-----END PGP SIGNATURE-----

--nFreZHaLTZJo0R7j--
