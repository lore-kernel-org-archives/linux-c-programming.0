From: Steven Smith <sos22@cantab.net>
Subject: Re: Automatic library init
Date: Sun, 5 Jun 2005 14:50:08 +0100
Message-ID: <20050605135008.GA1880@localhost>
References: <1117935271.4561.3.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="BOKacYhQ+x31HxR3"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1117935271.4561.3.camel@localhost.localdomain>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
To: "David L. Martin" <dlmarti@kc2lcf.net>
Cc: C programming list <linux-c-programming@vger.kernel.org>, sos22@srcf.ucam.org


--BOKacYhQ+x31HxR3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

> Back in the day (Borland days), there used to be a pragma directive that
> could be used to automatically call a function with-in the library on
> startup.  I know something like this must exist in gcc but I can't find
> it.
I think the approved method is to use constructor functions:

void cons_func(void) __attribute__((constructor));

void cons_func(void)
{
	/* Do initialisation stuff here */
}

Note that it isn't hugely well defined what order constructor
functions get called in, so be careful when calling other libraries.

Steven.

--BOKacYhQ+x31HxR3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQFCowMQO4S8/gLNrjcRApHDAKCp6T3mLqZHOPsbwMytDa5SpJei+QCeJHxt
GXk1h9bzIUhf7wM/++VEqyE=
=1UK0
-----END PGP SIGNATURE-----

--BOKacYhQ+x31HxR3--
