From: Hubert CHAUMETTE <hubert.chaumette@wanadoo.fr>
Subject: Re: sizeof *data, when data isn't initalized, is that right?
Date: Thu, 22 Jan 2015 19:38:44 +0100
Message-ID: <54C143B4.4070104@wanadoo.fr>
References: <54C13F4A.2020404@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <54C13F4A.2020404@gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Daniel Hilst Selli <danielhilst@gmail.com>, "linux-c-programming@vger.kernel.org" <linux-c-programming@vger.kernel.org>

Hi,

As I understand it, sizeof(*data) is the same as sizeof(struct mcp23s08=
_driver_data). There should be no pointer dereference here, so I would =
say it isn't an issue. That notation is quite confusing though.
Note that data is surrounded by parenthesis, at least in Linux 3.18, in=
 gpio-mcp23s08.c
Regards,

Hubert

Le 22/01/2015 19:19, Daniel Hilst Selli a =C3=A9crit :
> I came across this code:
>
>         struct mcp23s08_driver_data     *data;
>     ...
>     data =3D kzalloc(sizeof *data + chips * sizeof(struct mcp23s08),
>                         GFP_KERNEL);
>
>
> Since data wasn't initialized when `sizeof *data' is called, wasn't t=
his a non-initialized pointer dereference?
>
> Cheers
> --=20
> To unsubscribe from this list: send the line "unsubscribe linux-c-pro=
gramming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
