From: Andrei Bunghez <andrei.bunghez@gmail.com>
Subject: Re: Size of the terminal with curses
Date: Thu, 21 Oct 2004 16:03:25 +0300
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <a7ed6e33041021060378dab242@mail.gmail.com>
References: <cl6gpb$gap$1@sea.gmane.org> <20041021120539.GD5033@lug-owl.de>
Reply-To: Andrei Bunghez <andrei.bunghez@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20041021120539.GD5033@lug-owl.de>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-c-programming@vger.kernel.org

Hi,=20

Calling ioctl with TIOCGWINSZ, would be another soulution...=20
(tty_ioctl(4)). However I am no expert, please correct me if the above
doesn't work with curses.

Andrei




On Thu, 21 Oct 2004 14:05:39 +0200, Jan-Benedict Glaw <jbglaw@lug-owl.d=
e> wrote:
> On Wed, 2004-10-20 22:11:23 +0200, Tyler <tyler@agat.net>
> wrote in message <cl6gpb$gap$1@sea.gmane.org>:
> > How can I get the size of the terminal (in lines and cols) of the a=
ctual
> > terminal ? It would be cool if the solution uses some curses functi=
on.
>=20
> It's LINES and COLS, see <curses.h>.
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
>
-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
