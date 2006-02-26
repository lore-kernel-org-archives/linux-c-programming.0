From: wwp <subscript@free.fr>
Subject: Re: Making "make" auto-strip and auto-clean
Date: Sun, 26 Feb 2006 09:56:22 +0100
Message-ID: <20060226095622.3c65df9b@localhost.localdomain>
References: <200602260935.27292.samjnaa@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary=Sig_cO+558bEp32.17eHTIXVXIs;
 protocol="application/pgp-signature"; micalg=PGP-SHA1
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <200602260935.27292.samjnaa@gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
To: linux-c-programming@vger.kernel.org

--Sig_cO+558bEp32.17eHTIXVXIs
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hello Shriramana Sharma,


On Sun, 26 Feb 2006 09:35:27 +0530 Shriramana Sharma <samjnaa@gmail.com> wr=
ote:

> I would like make to always=20
>=20
> 1. strip the executable it created
> 2. remove the *.o files it created
>=20
> after it has compiled the target executable. How do I do this? What do I
> add to the makefile? The current default command I am using is:=20
>=20
> pan: pan.o libswe.a
> 	gcc -g -O2 -o pan pan.o -L. -lswe -lm

First, if you always want to strip, no need to add -g.
Then:

all: pan strip clean

pan: pan.o libswe.a
	gcc -O2 -o $@ pan.o -L. -lswe -lm

strip: pan
	strip $<

clean:
	-rm -f pan.o

Or something similar..


Regards,

--=20
wwp

--Sig_cO+558bEp32.17eHTIXVXIs
Content-Type: application/pgp-signature; name=signature.asc
Content-Disposition: attachment; filename=signature.asc

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.7 (GNU/Linux)

iD8DBQFEAW07adgnuQFKG88RAjGCAJ41+M7I46SfgZdetLKrmW7gcEuBoQCfaail
4+/fv2DFGr1yceJTDV8DfOA=
=ZSzR
-----END PGP SIGNATURE-----

--Sig_cO+558bEp32.17eHTIXVXIs--
