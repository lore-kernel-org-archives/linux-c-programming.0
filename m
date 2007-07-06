From: wwp <subscript@free.fr>
Subject: Re: link error
Date: Fri, 6 Jul 2007 08:55:41 +0200
Message-ID: <20070706085541.2032030a@localhost.localdomain>
References: <1183704838.5947.14.camel@debian>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_5Hbc4eNSBHK2fCAlqE2Yhp/";
 protocol="application/pgp-signature"; micalg=PGP-SHA1
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <1183704838.5947.14.camel@debian>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
To: linux-c-programming@vger.kernel.org

--Sig_5Hbc4eNSBHK2fCAlqE2Yhp/
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hello yyy,


On Fri, 06 Jul 2007 14:53:58 +0800 yyy <yaoyy@rising.com.cn> wrote:

> When i link .o file to a dynamic lib, errors appear,
> My link sentence such as:
> g++ -g -shared -fPIC -o xxx.so xxx.o xxxx.o ....
>=20
> the error such as:
> `.L303' referenced in section `.rodata' of xxx.o: defined in discarded
> section `.gnu.linkonce.t._ZN3ALT9TVSPrintfIcEEiPT_PKS1_Pv' of xxx.o
>=20
> any one has any advice, i'm appreciate.

Maybe that could help:
http://www.gentoo.org/proj/en/base/amd64/howtos/index.xml?part=3D1&chap=3D3


Regards,

--=20
wwp

--Sig_5Hbc4eNSBHK2fCAlqE2Yhp/
Content-Type: application/pgp-signature; name=signature.asc
Content-Disposition: attachment; filename=signature.asc

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.7 (GNU/Linux)

iD8DBQFGjeduadgnuQFKG88RAtFYAKCeY2Qx4Ufd/OYgG8U5HfZDv+HWGQCcC684
CaeDHHdHPU8inD6yVYCVE50=
=GiQ4
-----END PGP SIGNATURE-----

--Sig_5Hbc4eNSBHK2fCAlqE2Yhp/--
