From: wwp <subscript@free.fr>
Subject: Re: "double free or corruption" - how to solve this?
Date: Fri, 12 May 2006 10:19:27 +0200
Message-ID: <20060512101927.136dd5df@localhost.localdomain>
References: <75062f40605120111s2d27c8c0gb768c50b1ae34588@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_F.oJyvD80=aFIlj7osJNii1";
 protocol="application/pgp-signature"; micalg=PGP-SHA1
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <75062f40605120111s2d27c8c0gb768c50b1ae34588@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
To: linux-c-programming@vger.kernel.org

--Sig_F.oJyvD80=aFIlj7osJNii1
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hello Shriramana,


On Fri, 12 May 2006 13:41:12 +0530 "Shriramana Sharma" <samjnaa@gmail.com> =
wrote:

> One of my programs, which was working quite well till now, suddenly
> gives me the error:
>=20
> *** glibc detected *** double free or corruption (top): 0x0808a338 ***
> Aborted
>=20
> It is a pure C program compiled with GCC 4.02 -- I do not understand
> why it does not work suddenly. Please tell me what the above error can
> be.

Would be nice to run it from gdb, in order to get the backtrace when it
crashes. This should help you understand where and why :).


Regards,

--=20
wwp

--Sig_F.oJyvD80=aFIlj7osJNii1
Content-Type: application/pgp-signature; name=signature.asc
Content-Disposition: attachment; filename=signature.asc

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.3 (GNU/Linux)

iD8DBQFEZEUPadgnuQFKG88RAspbAJ9Fwoxcdc3S4kX3UwF+pW1Y4xcjPgCaApK0
j+OzwcqAFLRWJvMa6VpcWnU=
=NnpM
-----END PGP SIGNATURE-----

--Sig_F.oJyvD80=aFIlj7osJNii1--
