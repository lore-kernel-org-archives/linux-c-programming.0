From: "Steven Smith" <sos22@cam.ac.uk>
Subject: Re: Linux source code: malloc.c
Date: Thu, 6 Jan 2005 16:10:29 +0000
Message-ID: <20050106161029.GA6113@archibold>
References: <20041230130432.4f93abe2@tethys.montpellier.4js.com> <000b01c4eff2$623ff7e0$8a7e4ed5@j0s6l8> <013701c4f3be$6b230710$dc846840@apac.cisco.com> <20050106091104.GA3805@archibold> <1105025253.41dd58e57c0f7@132.248.10.8>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="GvXjxJ+pjyke8COw"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1105025253.41dd58e57c0f7@132.248.10.8>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
To: davidgn@servidor.unam.mx
Cc: linux-c-programming@vger.kernel.org, sos22@srcf.ucam.org


--GvXjxJ+pjyke8COw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

> > > Where can I see the implementation of free() and malloc() in Linux
> > > source code? I am not able to locate the file malloc.c.
> > That's because malloc() isn't in Linux-the-kernel: it's in glibc.
> > The file you're looking for is malloc/malloc.c in the glibc tarball.
> Except the kernel implements its own "kmalloc", which if I'm not wrong is called
> upon by libc's malloc
Um, sort of... the kernel does implement a function kmalloc, but it's
not the same as the user-exposed one.  For a start, memory allocated by
kmalloc is only accessible from kernel space, rather than user programs.

The kernel does provide two main primitives for userspace programs to
allocated memory: mmap and brk.  These are both fairly limited,
though.  mmap can only cope with multiples of the page size (4096
bytes on x86), while brk enforces a stack-like discipline.

sys_mmap and sys_brk do call upon kmalloc themselves, though.

Steven.


--GvXjxJ+pjyke8COw
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.6 (FreeBSD)

iD8DBQFB3WL1O4S8/gLNrjcRAppxAKDHAAfTE6kbxmGxeOo0S9OC9c/NwgCgxVIW
e9uhrvTqhzLq1XHXL08FoPg=
=KDLT
-----END PGP SIGNATURE-----

--GvXjxJ+pjyke8COw--
