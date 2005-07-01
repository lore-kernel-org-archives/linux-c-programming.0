From: leslie.polzer@gmx.net
Subject: Problem with pointer to external function
Date: Fri, 1 Jul 2005 12:30:26 +0200
Message-ID: <20050701103026.GA2965@paktahn.black.cat>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="C7zPtVaVf+AK4Oqc"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
To: linux-c-programming@vger.kernel.org
Cc: leslie.polzer@gmx.net


--C7zPtVaVf+AK4Oqc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello list,

why do it get the segfault below? What's wrong?


[sky@paktahn ~/code/cbtest]% cat main.c     =20
#include <stdio.h>

typedef void (*callback)();

extern callback cb;

int
main (int argc, char** argv)
{
        cb();

        return(0);
}

[sky@paktahn ~/code/cbtest]% cat defhandlers.c      =20
void cb()
{
}

[sky@paktahn ~/code/cbtest]% gcc main.c defhandlers.c -ggdb
[sky@paktahn ~/code/cbtest]% gdb ./a.out=20
GNU gdb 6.3
Copyright 2004 Free Software Foundation, Inc.
GDB is free software, covered by the GNU General Public License, and you are
welcome to change it and/or distribute copies of it under certain condition=
s.
Type "show copying" to see the conditions.
There is absolutely no warranty for GDB.  Type "show warranty" for details.
This GDB was configured as "i686-pc-linux-gnu"...Using host libthread_db li=
brary "/lib/tls/libthread_db.so.1".

(gdb) run
Starting program: /home/sky/code/cbtest/a.out=20

Program received signal SIGSEGV, Segmentation fault.
0x5de58955 in ?? ()
(gdb) bt full
#0  0x5de58955 in ?? ()
No symbol table info available.
#1  0x08048367 in main (argc=3D1, argv=3D0xbffff634) at main.c:10
No locals.
(gdb)


Regards,

Leslie

--=20
PGP-KID: 0x52D70289

--C7zPtVaVf+AK4Oqc
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQFCxRtCn/ep3VLXAokRApurAKC+o1vQHEQX3grG/lDMJA717QRVNwCg2k87
jr5mAnmE6xOq2tNc3HmQZHI=
=au/p
-----END PGP SIGNATURE-----

--C7zPtVaVf+AK4Oqc--
