From: "William N. Zanatta" <william@veritel.com.br>
Subject: Re: Signal on Ctrl-C
Date: Tue, 07 May 2002 17:52:21 -0300
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <3CD83E85.8030400@veritel.com.br>
References: <02050222174801.01065@localhost.localdomain> <3CD1B00C.71CB2F38@fi.uba.ar> <3CD83493.F2C50ADC@fi.uba.ar>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; 
To: =?ISO-8859-1?Q?Dar=EDo_Mariani?= <dmarian@fi.uba.ar>
Cc: linux-c-programming@vger.kernel.org

Dar=EDo Mariani wrote:
> Hello:
>   Wich is the UNIX signal emited when you press Ctrl-C on a console
> application?
>   Thanks for your help,
>=20
> 			Dar=EDo
> -
> To unsubscribe from this list: send the line "unsubscribe linux-c-pro=
gramming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>=20
>=20


SIGINT        2        A      Interrupt from keyboard


"man 7 signal" for "THE LIST"


[]'s

william

-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
