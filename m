From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Subject: Re: Byte Order
Date: Wed, 12 Jan 2005 18:34:57 +0100
Message-ID: <20050112173457.GS25737@lug-owl.de>
References: <20050112_170357_014648.r_zaca@ig.com.br>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jo46wx5DSA4a/gWG"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20050112_170357_014648.r_zaca@ig.com.br>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
To: linux-c-programming@vger.kernel.org


--jo46wx5DSA4a/gWG
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, 2005-01-12 15:03:57 -0200, r_zaca <r_zaca@ig.com.br>
wrote in message <20050112_170357_014648.r_zaca@ig.com.br>:
Content-Description: Mail message body
>   How can I say if the machine where I am working uses "Host Byte Order" =
or=20
> "Network Byte Order"?=20

Something like this should do the job:

#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

int
main (int argc, char *argv[])
{
        uint32_t i =3D 0x44332211;
        unsigned char *c;

        c =3D (unsigned char *) &i;

        if (c[0] =3D=3D 0x11 && c[1] =3D=3D 0x22 && c[2] =3D=3D 0x33 && c[3=
] =3D=3D 0x44)
                printf ("This is a little-endian host\n");
        else if (c[0] =3D=3D 0x44 && c[1] =3D=3D 0x33 && c[2] =3D=3D 0x22 &=
& c[3] =3D=3D 0x11)
                printf ("This is a big-endian host\n");
        else if (c[0] =3D=3D 0x33 && c[1] =3D=3D 0x44 && c[2] =3D=3D 0x11 &=
& c[3] =3D=3D 0x22)
                printf ("This is a pdp-endian host\n");
        else {
                printf ("This host is broken:-)\n");
                return EXIT_FAILURE;
        }

        return EXIT_SUCCESS;
}


>   Is it an obvius question? I mean, all hosts (machines) uses "Host Byte=
=20
> Order" and when it needs to send data through the network it uses "Networ=
k=20
> Byte Order".=20

The rule is easy: Just *always* either use htonl/htons/ntohl/ntohs or
transmit the number in readable format. The nice thing is that any sane
libc will implement those as macros, so if your host already works in
network byte order, the conversion will get optimized away.

MfG, JBG

--=20
Jan-Benedict Glaw       jbglaw@lug-owl.de    . +49-172-7608481             =
_ O _
"Eine Freie Meinung in  einem Freien Kopf    | Gegen Zensur | Gegen Krieg  =
_ _ O
 fuer einen Freien Staat voll Freier B=C3=BCrger" | im Internet! |   im Ira=
k!   O O O
ret =3D do_actions((curr | FREE_SPEECH) & ~(NEW_COPYRIGHT_LAW | DRM | TCPA)=
);

--jo46wx5DSA4a/gWG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQFB5V/BHb1edYOZ4bsRAg3yAJ9I/A2d3L77b0laZb/RbpFVT5GXlACeMQXx
hbIaV9BmWJV7RFMKdnAGH/s=
=KJrW
-----END PGP SIGNATURE-----

--jo46wx5DSA4a/gWG--
