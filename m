From: "Steven" <sos22@cam.ac.uk>
Subject: Re: (F)stack trace
Date: Thu, 21 Aug 2003 08:57:04 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20030821075704.GA598@archibold.chu.cam.ac.uk>
References: <DD9E117A8BE9F34FA4130376EC9C1F6A05E5136D@BANMLVEM01.e2k.ad.ge.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="FCuugMFkClbJLl1L"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <DD9E117A8BE9F34FA4130376EC9C1F6A05E5136D@BANMLVEM01.e2k.ad.ge.com>
List-Id: <linux-c-programming.vger.kernel.org>
To: "Singh, Umesh K (MED)" <Umesh.Singh@geind.ge.com>
Cc: linux-c-programming@vger.kernel.org


--FCuugMFkClbJLl1L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

> is it possible to get the stack trace without attaching the process
> to debugger. For Ex. can i write a func let's say
> "print_stack_trace()" and call it anywhere in my program to print
> the stack trace at that point of time.
If you're using glibc, it's reasonably easy:

#include <execinfo.h>

void print_stack_trace(void)
{
	void *buffer[100];
	int x;
	x = backtrace(buffer, 100);
	backtrace_symbols_fd(buffer, x, 1);
}

Steven Smith,
sos22@cam.ac.uk.

--FCuugMFkClbJLl1L
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (FreeBSD)

iD4DBQE/RHtQO4S8/gLNrjcRAoipAKCPB+6KGLdVmGRXCPBKh66HpLfYjwCY3t51
kPuajO9SMzFP5WoHS65mmw==
=6gjI
-----END PGP SIGNATURE-----

--FCuugMFkClbJLl1L--
