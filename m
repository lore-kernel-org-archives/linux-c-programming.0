From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: C Question
Date: Tue, 1 Jun 2010 14:18:10 +0100
Message-ID: <19461.2194.469920.784076@cerise.gclements.plus.com>
References: <AANLkTimNataepVFhtn4kSv_kGv1wTBHMAOgeZTK0hgW-@mail.gmail.com>
	<87r5l09pjt.fsf@erwin.mina86.com>
	<AANLkTilJ0HUomkRuJwrywTcmVoeAAmQb2MTZbwoT57fn@mail.gmail.com>
	<87r5ktfttj.fsf@erwin.mina86.com>
	<AANLkTik-eE99MeOMhJKcINHwzyzT_BcduarrMLVWvCDs@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <AANLkTik-eE99MeOMhJKcINHwzyzT_BcduarrMLVWvCDs@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Randi Botse <nightdecoder@gmail.com>
Cc: Michal Nazarewicz <mina86@tlen.pl>, linux-c-programming@vger.kernel.org


Randi Botse wrote:

> >> Sorry but, i just having another question, consider this code:
> >>
> >> const char *my_strings[] =3D {
> >> =A0 =A0 [0] =3D "index0",
> >> =A0 =A0 [4] =3D "index4",
> >> =A0 =A0 [6] =3D "index6"
> >> };
> >
> > NULLs will be written at indexes 1, 2, 3 and 5. =A0There will be to=
tal of
> > 7 pointers (the last one will point to "index6").
>=20
> That's clear now, i was though the 'unindexed' strings (in this case
> index 1, 2, 3, and 5) remains unintialized (not initialized to NULL).

If you specify an initialiser, the entire object is initialised. If
you specify an incomplete initialiser, the unspecified elements are
initialised to the appropriate zero value (0, 0.0, '\0', NULL, etc).

The C99 standard says (6.7.8p21):

       [#21]  If  there  are fewer initializers in a brace-enclosed
       list than there are elements or members of an aggregate,  or
       fewer  characters  in a string literal used to initialize an
       array of known size than there are elements  in  the  array,
       the   remainder   of  the  aggregate  shall  be  initialized
       implicitly the same as  objects  that  have  static  storage
       duration.

This applies to both traditional C89 sequential initialisers and C99
designated initialisers. It allows you to initialise large arrays or
structures without having to specify every element; e.g.:

	int array[1000] =3D {0};
	struct foo f =3D {0};

will initialise the entire array or structure to zero.

--=20
Glynn Clements <glynn@gclements.plus.com>
--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
