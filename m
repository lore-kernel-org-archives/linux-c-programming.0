From: Steven Smith <sos22@cam.ac.uk>
Subject: Re: (F)using perl regex engine from C ?
Date: Thu, 13 Feb 2003 23:46:23 +0000
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20030213234623.GA14860@cam.ac.uk>
References: <15936.11120.748235.577740@cerise.nosuchdomain.co.uk> <Pine.LNX.4.21.0302140025040.8019-100000@hestia>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="mP3DRpeJDSE+ciuQ"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.21.0302140025040.8019-100000@hestia>
List-Id: <linux-c-programming.vger.kernel.org>
To: "J." <mailing-lists@xs4all.nl>
Cc: linux-c-programming@vger.kernel.org


--mP3DRpeJDSE+ciuQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

> I was wondering if it is possible to access the perl regex engine from a
> C program. Is there a interface to it? Have people done it ? I
> guess so, but where should I start searching ?
It isn't the Perl regex engine, but libpcre (Perl Compatible Regular
Expressions) is fairly close.

Failing that, you'd probably need to either copy and paste chunks of
the Perl source code, or use libperl and run the regexps from embedded
Perl.

Of course, if you just need regular expressions, and aren't bothered
about the Perl-specific things, you could use the regex functions in
libc (regcomp, regexec, regerror, and regfree).

Steven Smith,
sos22@cam.ac.uk.

--mP3DRpeJDSE+ciuQ
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.0 (GNU/Linux)

iD8DBQE+TC5PO4S8/gLNrjcRAocsAJ4hpA+xa3iM6ohdKK9NZfAjRauOdgCdHPhT
oCT5nm3IyKPZ7NBZuyLaAj4=
=zSoP
-----END PGP SIGNATURE-----

--mP3DRpeJDSE+ciuQ--
