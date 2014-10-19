From: John de la Garza <john@jjdev.com>
Subject: Re: byte copy
Date: Sun, 19 Oct 2014 18:14:27 -0400
Message-ID: <20141019221426.GA14932@John-de-la-Garzas-Macbook-Pro.local>
References: <20141019213216.GA14500@John-de-la-Garzas-Macbook-Pro.local>
 <B8C734DB-DA5E-4FA3-8F0A-07C5F12A5368@gmail.com>
 <20141019221027.GB14895@John-de-la-Garzas-Macbook-Pro.local>
 <B1FB00FE-C781-4985-9DCB-D13080F11C9E@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <B1FB00FE-C781-4985-9DCB-D13080F11C9E@gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: Bogdan Cristea <cristeab@gmail.com>
Cc: linux-c-programming@vger.kernel.org

On Mon, Oct 20, 2014 at 12:12:06AM +0200, Bogdan Cristea wrote:
>=20
> > On 20 Oct 2014, at 00:10, John de la Garza <john@jjdev.com> wrote:
> >=20
> > On Sun, Oct 19, 2014 at 11:42:26PM +0200, Bogdan Cristea wrote:
> >>=20
> >>> On 19 Oct 2014, at 23:32, John de la Garza <john@jjdev.com> wrote=
:
> >>>=20
> >>> Can anone see why these two pieces of code would behave different=
ly?
> >>> They are used in a mergesort merge
> >>>=20
> >>> the top one ends up with c (cp points to an offset in c)
> >>> 1 2 3 1
> >>>=20
> >>> the bottom one (not commented out)
> >>> results in 1 2 3 4 (correct)
> >>>=20
> >>>       /*
> >>>       if (alen =3D=3D 0)
> >>>               memcpy(cp, bp, blen);
> >>>       else if (blen =3D=3D 0){
> >>>               memcpy(cp, ap, alen);
> >>>       }
> >>>       */
> >>>       if (alen =3D=3D 0)
> >>>               while (blen--)
> >>>                       *cp++ =3D *bp++;
> >>>       else
> >>>               while (alen--)
> >>>                       *cp++ =3D *ap++;
> >>>=20
> >>>=20
> >>> if you want to read it with more context see below
> >>> ---------------------------------------------------
> >>>=20
> >>> #include <stdio.h>
> >>> #include <string.h>
> >>> #include <stdlib.h>
> >>>=20
> >>> void pr_array(int *a, int len)
> >>> {
> >>> 	int i;
> >>> 	for (i =3D 0; i < len; i++)
> >>> 		printf("%d ", a[i]);
> >>> 	printf("\n");
> >>> }
> >>> void merge(int *a, int alen, int *b, int blen, int *c)
> >>> {
> >>> 	int *ap =3D a;
> >>> 	int *bp =3D b;
> >>> 	int *cp =3D c;
> >>>=20
> >>> 	while (alen && blen) {
> >>> 		if (*ap <=3D *bp) {
> >>> 			*cp++ =3D *ap++;
> >>> 			alen--;
> >>> 		} else{
> >>> 			*cp++ =3D *bp++;
> >>> 			blen--;
> >>> 		}
> >>> 	}
> >>> 	if (alen =3D=3D 0)
> >>> 		memcpy(cp, bp, blen);
> >>> 	else if (blen =3D=3D 0){
> >>> 		memcpy(cp, ap, alen);
> >>> 	}
> >>> 	/*
> >>> 	if (alen =3D=3D 0)
> >>> 		while (blen--)
> >>> 			*cp++ =3D *bp++;
> >>> 	else
> >>> 		while (alen--)
> >>> 			*cp++ =3D *ap++;
> >>> 	*/
> >>> }
> >>>=20
> >>> void msort(int *arr, int len)
> >>> {
> >>> 	int mid =3D len / 2;
> >>> 	int llen =3D mid;
> >>> 	int rlen =3D len - mid;
> >>> 	int *l =3D malloc(llen);
> >>> 	int *r =3D malloc(rlen);
> >>> 	int i;
> >>>=20
> >>> 	if (len <=3D 1)
> >>> 		return;=09
> >>> 	for (i =3D 0; i < llen; i++)
> >>> 		l[i] =3D arr[i];
> >>> 	for (i =3D mid; i < mid + rlen; i++)
> >>> 		r[i-mid] =3D arr[i];
> >>> 	msort(l, llen);
> >>> 	msort(r, rlen);
> >>> 	merge(l, llen, r, rlen, arr);
> >>> 	free(l);
> >>> 	free(r);
> >>> }
> >>> int main()
> >>> {
> >>> 	int arr[] =3D {4,3, 2, 1};
> >>> 	int len =3D sizeof(arr) /sizeof(int);
> >>> 	int x[] =3D {1,3,5,7};
> >>> 	int y[] =3D {2,4,6,8};
> >>>=20
> >>> 	msort(arr, len);
> >>> 	pr_array(arr, len);
> >>> 	return(0);
> >>> }
> >>=20
> >> memcpy does not work for overlapping memory, use memmove instead
> >>=20
> > Where does it overlap?  I found a big problem, I was passing in siz=
e
> > instead of size * sizeof(int).
>=20
> My intention was to point a possible error source, I haven=E2=80=99t =
looked carefully at your code.
>=20
thanks

I just ran valgrind and realized I made the same mistake in many places
--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
