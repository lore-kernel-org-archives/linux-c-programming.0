From: =?ISO-8859-1?Q?Mat=EDas_Aguirre?= <matiasaguirre@gmail.com>
Subject: Re: Question about Malloc
Date: Tue, 19 Oct 2004 09:41:49 -0300
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <a3c4234104101905413e127d3e@mail.gmail.com>
References: <1097386256.6100.16.camel@localhost.localdomain>
	 <20041010111316.GD5033@lug-owl.de>
Reply-To: =?ISO-8859-1?Q?Mat=EDas_Aguirre?= <matiasaguirre@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20041010111316.GD5033@lug-owl.de>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: linux prg <linux-c-programming@vger.kernel.org>

It's not safer to make:

Recpointer r;
r=3D(Recpointer)malloc(Recpointer);


On Sun, 10 Oct 2004 13:13:16 +0200, Jan-Benedict Glaw <jbglaw@lug-owl.d=
e> wrote:
> On Sun, 2004-10-10 00:31:05 -0500, Edward Parrilla <eparrilla@comcast=
=2Enet>
> wrote in message <1097386256.6100.16.camel@localhost.localdomain>:
> > Hi all,
> > I got the following structure:
> > typedef struct  {
> >       char *file;
> >       char *ip_addres;
> >       }TABLE;
> >
> > then define a pointer to it:
> >
> > typedef TABLE *Recpointer;
> > Recpointer r;
> >
> > I'm trying to use malloc as:
> >
> > r=3Dmalloc(Recpointer);
> > but it gives me error.
>=20



--=20
Mat=EDas Aguirre
-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
