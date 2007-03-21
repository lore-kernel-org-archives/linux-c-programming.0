From: Topher Fischer <javert42@cs.byu.edu>
Subject: Getting output from another program.
Date: Wed, 21 Mar 2007 14:01:14 -0600
Message-ID: <46018F0A.9010801@cs.byu.edu>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="------------enigE69AA6421B67A765C8B3C3B9"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
To: linux-c-programming@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enigE69AA6421B67A765C8B3C3B9
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Today I discovered the 'file' command.  I was immediately embarrassed
and upset that I have gone so long without ever running into it.  It
also made me think of a few questions.

1. Is there a C library that provides equivalent or similar
functionality (especially for identifying MIME types)?

2. What's the best practice for getting output from an external command?
 I've heard of it being done by forking, overwriting the child's file
descriptors for stdin and stdout with pipes, and then exec'ing the
command.


--=20
Topher Fischer
GnuPG Fingerprint: 3597 1B8D C7A5 C5AF 2E19  EFF5 2FC3 BE99 D123 6674
javert42@cs.byu.edu


--------------enigE69AA6421B67A765C8B3C3B9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)
Comment: Using GnuPG with Fedora - http://enigmail.mozdev.org

iD8DBQFGAY8ML8O+mdEjZnQRAumsAJ4he4frDrdbe9xSi9G4hu1tN2JvDACcCm8t
qUVSSAA0N/zz1MeOER7vsEA=
=NDyI
-----END PGP SIGNATURE-----

--------------enigE69AA6421B67A765C8B3C3B9--
