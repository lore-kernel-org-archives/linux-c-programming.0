From: =?ISO-8859-1?Q?Mat=EDas_Aguirre?= <matiasaguirre@gmail.com>
Subject: Re: Question about Malloc
Date: Tue, 19 Oct 2004 10:52:12 -0300
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <a3c42341041019065236207a98@mail.gmail.com>
References: <1097386256.6100.16.camel@localhost.localdomain>
	 <20041010111316.GD5033@lug-owl.de>
	 <a3c4234104101905413e127d3e@mail.gmail.com>
	 <20041019132738.GR5033@lug-owl.de>
Reply-To: =?ISO-8859-1?Q?Mat=EDas_Aguirre?= <matiasaguirre@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20041019132738.GR5033@lug-owl.de>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: linux prg <linux-c-programming@vger.kernel.org>

i agree with that, i didn't fix inside de malloc, i only suggested
about the cast

but my big error was speak about c++ and not about c, in c++ the
compiler (g++ in this case) warn you about that conversion....

sorry

On Tue, 19 Oct 2004 15:27:38 +0200, Jan-Benedict Glaw <jbglaw@lug-owl.d=
e> wrote:
> On Tue, 2004-10-19 09:41:49 -0300, Mat=EDas Aguirre <matiasaguirre@gm=
ail.com>
> wrote in message <a3c4234104101905413e127d3e@mail.gmail.com>:
> > It's not safer to make:
> >
> > Recpointer r;
> > r=3D(Recpointer)malloc(Recpointer);
>=20
> malloc is void, while r isn't. So you don't need the cast here. Howev=
er,
> notice that your malloc call is actually wrong: the argument isn't a
> number (or sizeof(something)), but only a type.
>=20
> General rule of thumb:
>=20
>         The "output" of malloc should be assigned to a variable whose
>         type is a pointer to whatever you give to sizeof(xxx) as the
>         malloc argument.
>=20
> or in short:
>=20
>         One star more on the left than on the right.
>=20
> Of course, if you play with types, this doesn't apply any longer...
>=20
>=20
>=20
> MfG, JBG
>=20
> --
> Jan-Benedict Glaw       jbglaw@lug-owl.de    . +49-172-7608481       =
      _ O _
> "Eine Freie Meinung in  einem Freien Kopf    | Gegen Zensur | Gegen K=
rieg  _ _ O
>  fuer einen Freien Staat voll Freier B=FCrger" | im Internet! |   im =
Irak!   O O O
> ret =3D do_actions((curr | FREE_SPEECH) & ~(NEW_COPYRIGHT_LAW | DRM |=
 TCPA));
>=20
>=20
>=20


--=20
Mat=EDas Aguirre
-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
