From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Subject: Re: Antwort: Re: -EFAULT during freeing a pointer to a structure
Date: Fri, 8 Oct 2004 13:31:01 +0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20041008113101.GK5033@lug-owl.de>
References: <OFFFC2B2B9.78606041-ONC1256F27.002EEFD1@bln.d-trust.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="XLpnloaskCRyB6mV"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <OFFFC2B2B9.78606041-ONC1256F27.002EEFD1@bln.d-trust.de>
List-Id: <linux-c-programming.vger.kernel.org>
To: linux-c-programming@vger.kernel.org


--XLpnloaskCRyB6mV
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, 2004-10-08 11:03:55 +0200, p.boehm@d-trust.net <p.boehm@d-trust.net>
wrote in message <OFFFC2B2B9.78606041-ONC1256F27.002EEFD1@bln.d-trust.de>:
> (it's written from mind, hope there are no spelling mistakes)

There's one, but not that bad...

> # --------------------------------------------------------- #
>=20
> #include <stdio.h>
> #include <stdlib.h>
> #include <string.h>
>=20
> #define MAXNUM 7
>=20
> struct xy {
>      int x;
>      char *y;
> };
>=20
> struct abc {
>      struct xy *next[MAXNUM];

So here you're creating an array of pointers to "struct xy". This array
has got MAXNUM elements, this is currently 7. Note that the correct
array subscripts are from 0 to 6!

> };
>=20
> void init_abc(struct abc *pt, int index) {
>      pt->next[index]=3Dmalloc(sizeof(struct xy));
>      memset(pt->next[index],0,sizeof(struct xy));
> }
>=20
> void free_abc(struct abc *pt, int index) {
>      free(pt->next[index]);
>      pt->next[index]=3DNULL;
> }
>=20
> int main(int argc, char *argv[]) {
>      struct abc *ptr;
>      int index=3D-1;
>=20
>      ptr=3Dmalloc(sizeof(struct abc));
>      memset(ptr, 0, sizeof((struct abc));

Here's a '(' too much, that's the typo.

>=20
>      while(index++<MAXNUM) {
>           init_abc(ptr,index);
>           printf("ptr->next[index] =3D %p\n", ptr->next[index]);
>      }

=2E..and now, think about this loop. Think hard. Got the point? It's
executed for index=3D0 to index=3D7! That's one too much! I suggest you
better write it like

	for (index =3D 0; index < MAXNUM; index++) {
		init_abc (ptr, index);
		printf ("ptr->next[%d] =3D %p\n", index, ptr->next[index]);
	}

>      while(index-->0) {
>           free_abc(ptr,index);
>           printf("ptr->next[index] =3D %p\n", ptr->next[index]);
>      }


And I'd write this as

	for (index =3D MAXNUM - 1; index >=3D 0; index--) {
		free_abc (ptr, index);
		printf ("ptr->next[%d] =3D %p\n", index, ptr->next[index]);
	}

Additionally, I've also made it print out it's index it's actually
working on. If you had done that on the first hand, you'd for sure seen
your error in no time:-)

>      free(ptr);
>      return 0;
> }
>=20
> # ---------------------------------------------------------------------- #

MfG, JBG

--=20
Jan-Benedict Glaw       jbglaw@lug-owl.de    . +49-172-7608481             =
_ O _
"Eine Freie Meinung in  einem Freien Kopf    | Gegen Zensur | Gegen Krieg  =
_ _ O
 fuer einen Freien Staat voll Freier B=FCrger" | im Internet! |   im Irak! =
  O O O
ret =3D do_actions((curr | FREE_SPEECH) & ~(NEW_COPYRIGHT_LAW | DRM | TCPA)=
);

--XLpnloaskCRyB6mV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQFBZnp1Hb1edYOZ4bsRAo5ZAJ4j2syrVwS8uT63GbHj66YSxfbV6QCgk/oZ
h9Y9du0rm0EMPls11SN+k50=
=juua
-----END PGP SIGNATURE-----

--XLpnloaskCRyB6mV--
