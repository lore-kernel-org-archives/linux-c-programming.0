From: Patrick Leslie Polzer <leslie.polzer@gmx.net>
Subject: wcscat problem
Date: Thu, 19 Jan 2006 16:38:00 +0100
Message-ID: <20060119163800.1b45d984.leslie.polzer@gmx.net>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__19_Jan_2006_16_38_00_+0100_Wo8wp_vAVwTOQtSo"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
To: linux-c-programming@vger.kernel.org

--Signature=_Thu__19_Jan_2006_16_38_00_+0100_Wo8wp_vAVwTOQtSo
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


Hello list,

why does wcscat not work like strcat does?
It seems to be leaving the null byte in (C99 source):


#define _GNU_SOURCE
#include <wchar.h>


int main (int ac, char** av)
{
        wchar_t* ws =3D malloc(8);
        wcscpy(ws, (wchar_t*)"abc");
        wcscat(ws, (wchar_t*)"def");
        printf("%s/%s\n", ws, (void*)ws+4); /* "abc/def" [*] */


        char* s =3D malloc(8);
        strcpy(s, "abc");
        strcat(s, "def");
        printf("%s/%s\n", s, s+4); /* "abcdef/ef" */

        return 0;
}

Why is this?  I also noticed the compiler (gcc4) takes "string steps"
when performing pointer arithmetics with wchar_t pointers, that's why
I needed to cast to void* in line [*].

Leslie


--=20
gpg --keyserver pgp.mit.edu --recv-keys 0x52D70289

--Signature=_Thu__19_Jan_2006_16_38_00_+0100_Wo8wp_vAVwTOQtSo
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2 (GNU/Linux)

iD8DBQFDz7Jbn/ep3VLXAokRAoVyAJ95OFmccXxRP4gEVbIMhOiXvhznIgCfQmB1
Yzzky5TSPJZlbRh+32AHLj0=
=ngTL
-----END PGP SIGNATURE-----

--Signature=_Thu__19_Jan_2006_16_38_00_+0100_Wo8wp_vAVwTOQtSo--
