From: "Steven Smith" <sos22@cam.ac.uk>
Subject: Re: Implementation of read( )
Date: Mon, 26 Jan 2004 21:28:31 +0000
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20040126212831.GA57901@archibold.chu.cam.ac.uk>
References: <20040126201655.DBEB51E447@xprdmailfe25.nwk.excite.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="k1lZvvs/B4yU6o8G"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20040126201655.DBEB51E447@xprdmailfe25.nwk.excite.com>
List-Id: <linux-c-programming.vger.kernel.org>
To: Vineet Joglekar <vintya@excite.com>
Cc: linux-c-programming@vger.kernel.org


--k1lZvvs/B4yU6o8G
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

> I have read that read() makes the kernel invoke sys_read()
Yup.

> and I want to do the same thing with some additional
> functionalities. Where can i get the implementation of the read()
> function so that on the parallel lines I will be able to write my
> own my_read() function which in turn will call the sys_read() too?
Nowadays, most programs will use glibc's implementation of read, which
is in the glibc source (sysdeps/unix/sysv/linux/i386/syscall.S,
mostly).  There is, however, a macro in asm/unistd.h in the kernel
source pool which will do the basics for you.  The code goes like
this:

#include <asm/unistd.h>
#define __NR_private_read __NR_read
_syscall3(int, private_read, int, fd, char *, buf, size_t, size);

Calling private_read will then make the read system call directly
without going through libc.  Strictly speaking, it is valid to just
redefine read in the obvious way, but that gets horribly confusing.

The alternative approach is to call your function read, taking
advantage of the fact that a normal symbol will override one of the
weak symbols in libc, and then just call __libc_read when you need to
use the libc implementation.

Steven Smith,
sos22@cam.ac.uk

--k1lZvvs/B4yU6o8G
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (FreeBSD)

iD8DBQFAFYZ/O4S8/gLNrjcRAiykAJ9S0HZHrgMX2Cnq4XwLTd7IBywPIQCgvKSd
s+cC9O5e8dK8olGEMgqW2Us=
=Yb5f
-----END PGP SIGNATURE-----

--k1lZvvs/B4yU6o8G--
