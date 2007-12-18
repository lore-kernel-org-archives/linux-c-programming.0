From: Topher <javert42@cs.byu.edu>
Subject: mmap questions
Date: Mon, 17 Dec 2007 22:51:43 -0700
Message-ID: <47675FEF.2010903@cs.byu.edu>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="------------enig589E4342183F6B1CC60DF072"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
To: linux-c-programming@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enig589E4342183F6B1CC60DF072
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

I've read through the man pages on mmap, munmap, and msync, and I still
am not sure that I'm using the correct flags.  Actually, I'm not even
completely sure that mmap is the way to go.

I'm creating a queue-like data structure that uses a fixed amount of
heap space.  When it fills up, it must dump itself to a file, and then
it can consider itself "cleared", and continue adding elements.  If a
remove() call is made on the structure, and it's currently empty but has
previously dumped to disk, it loads the data from disk, and then
continues.  Also, this is only a single-threaded application.

I thought that I should use the MAP_PRIVATE flag when I map the file,
then just munmap() then call close(fd) when I dump it, but that's not
working.  I'm just getting empty files.

Is mmap even the way to go, or should I just be using write() and read()?=



--=20
Topher Fischer
GnuPG Fingerprint: 3597 1B8D C7A5 C5AF 2E19  EFF5 2FC3 BE99 D123 6674
javert42@cs.byu.edu | http://www.thetopher.com


--------------enig589E4342183F6B1CC60DF072
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.7 (GNU/Linux)
Comment: Using GnuPG with Fedora - http://enigmail.mozdev.org

iD8DBQFHZ1/yL8O+mdEjZnQRAuqQAJ9K88o8bALMWB7BHCr98U6uw2ERRQCcDoG4
Jh21n/G8PbC+zUM9BDN63/A=
=cc83
-----END PGP SIGNATURE-----

--------------enig589E4342183F6B1CC60DF072--
