From: Srinivas Chinta <chintasrinivas_tech@yahoo.com>
Subject: Re: How to RESET the client connection socket?
Date: Thu, 22 Apr 2004 02:17:22 -0700 (PDT)
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20040422091722.78999.qmail@web21208.mail.yahoo.com>
References: <20040421133208.GF12700@lug-owl.de>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20040421133208.GF12700@lug-owl.de>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Cc: linux-c-programming@vger.kernel.org

Thanks a lot for clearing my problem.
By the way, is shutdown(2) something similar to
setting socket linger options ?
And, this shutdown(2) send any RESET error something
back to client? or, client will be able to know that
the server has RESET the connection?

Thanks,
Srini

--- Jan-Benedict Glaw <jbglaw@lug-owl.de> wrote:
> On Wed, 2004-04-21 06:16:53 -0700, Srinivas Chinta
> <chintasrinivas_tech@yahoo.com>
> wrote in message
>
<20040421131653.73513.qmail@web21208.mail.yahoo.com>:
>=20
> > I have a server, and some clients connected to it.
> How
> > do i RESET a client connection socket ? Are there
> any
>=20
> IIRC you can do that with shutdown(2).
>=20
> MfG, JBG
>=20
> --=20
>    Jan-Benedict Glaw       jbglaw@lug-owl.de    .
> +49-172-7608481
>    "Eine Freie Meinung in  einem Freien Kopf    |
> Gegen Zensur | Gegen Krieg
>     fuer einen Freien Staat voll Freier B=FCrger" | im
> Internet! |   im Irak!
>    ret =3D do_actions((curr | FREE_SPEECH) &
> ~(NEW_COPYRIGHT_LAW | DRM | TCPA));
>=20

> ATTACHMENT part 2 application/pgp-signature
name=3Dsignature.asc




=09
	=09
__________________________________
Do you Yahoo!?
Yahoo! Photos: High-quality 4x6 digital prints for 25=A2
http://photos.yahoo.com/ph/print_splash
-
To unsubscribe from this list: send the line "unsubscribe linux-c-programmi=
ng" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
