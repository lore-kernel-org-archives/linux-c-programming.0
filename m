From: Alphex =?UTF-8?B?S2HDpG5va2Vu?= <akaanoken@softminecorp.com>
Subject: Re: working with /dev/dsp on linux
Date: Thu, 24 Mar 2005 14:55:45 +0300
Message-ID: <20050324145545.021488da.akaanoken@softminecorp.com>
References: <20050323171951.059b9e2d.akaanoken@softminecorp.com>
	<20050324113808.3236.qmail@web52908.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
In-Reply-To: <20050324113808.3236.qmail@web52908.mail.yahoo.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: caszonyi@yahoo.com
Cc: linux-c-programming@vger.kernel.org

On Thu, 24 Mar 2005 12:38:08 +0100 (CET)
szonyi calin <caszonyi@yahoo.com> wrote:

>  --- Alphex Ka=C3=A4noken <akaanoken@softminecorp.com> a =C3=A9crit=C2=
=A0:=20
> > Hi all,
> > I need help with playing sound files (wav raw data) on oss.
> > Some (devices|modules for this devices) doesn't support 8kHz
> > sample rate in example,
> > but I need to play it's in my emulation of some device.
> > I think that I need for resampling, but I don't know how to do
> > it.
> > Please help me with, or just point to good documentation.
> > I'm was on google already ;-)
> >=20
> > Thanx and sorry for my english.
> >=20
>=20
> sox s your friend
> man sox =20
no, I can't use sox or anything other libruary,=20
I decided to wrote it myself, so,
thanx anyway.
>=20
> --
> A mouse is a device used to point at=20
> the xterm you want to type in.
> Kim Alm on a.s.r.
>=20
>=20
> =09
>=20
> =09
> 	=09
> __________________________________________________________________
> D=C3=A9couvrez le nouveau Yahoo! Mail : 250 Mo d'espace de stockage p=
our vos mails !=20
> Cr=C3=A9ez votre Yahoo! Mail sur http://fr.mail.yahoo.com/
> -
> To unsubscribe from this list: send the line "unsubscribe linux-c-pro=
gramming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>=20


--=20
Valmis ...
Alphex Ka=C3=A4noken,
Software Developer
-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
