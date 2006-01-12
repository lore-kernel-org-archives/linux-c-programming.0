From: Patrick Leslie Polzer <leslie.polzer@gmx.net>
Subject: Re: Double values - what precision do I use for fprintf?
Date: Thu, 12 Jan 2006 15:17:08 +0100
Message-ID: <20060112151708.24751b03.leslie.polzer@gmx.net>
References: <200601121800.19678.samjnaa@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__12_Jan_2006_15_17_08_+0100_B+I.OX.EbzObEuvj"
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <200601121800.19678.samjnaa@gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
To: Shriramana Sharma <samjnaa@gmail.com>
Cc: linux-c-programming@vger.kernel.org

--Signature=_Thu__12_Jan_2006_15_17_08_+0100_B+I.OX.EbzObEuvj
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


On Thu, 12 Jan 2006 18:00:19 +0530
Shriramana Sharma <Shriramana Sharma <samjnaa@gmail.com>> wrote:

 | First I tried using "%20.15f" as the format string:
 |
 | [...]
 |=20
 | Then I used "%30.25f":
 |
 | [...]=20
 |=20
 | Ignoring the small differences in the two sets of data (longitude and sp=
eed
 | of eight celestial bodies computer at two different instants) I wonder -=
 if
I | keep increasing the number of decimal places where will it end?
At some point you will get only zeroes.  This point is reached when the man=
tissa
length is exceeded.

Leslie


--=20
gpg --keyserver pgp.mit.edu --recv-keys 0x52D70289

--Signature=_Thu__12_Jan_2006_15_17_08_+0100_B+I.OX.EbzObEuvj
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2 (GNU/Linux)

iD8DBQFDxmTrn/ep3VLXAokRAsc4AJ9dBFm7TJyW1nlJ1jybCKTNy+AdZQCg1QUL
r1HPTG0ZueDKnjP1HCCOeJY=
=0EII
-----END PGP SIGNATURE-----

--Signature=_Thu__12_Jan_2006_15_17_08_+0100_B+I.OX.EbzObEuvj--
