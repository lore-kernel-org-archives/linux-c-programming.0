From: =?iso-8859-1?Q?F=E1bio_Russo?= <russo@bluecup.com.br>
Subject: Re: buggy_double_use_of _scanf
Date: Mon, 1 Nov 2004 17:03:50 -0200
Message-ID: <005001c4c045$86334580$2100a8c0@titanio>
References: <417E4640.2040504@laposte.net> <16766.47776.33240.455119@cerise.gclements.plus.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Glynn Clements <glynn@gclements.plus.com>, simon <simon.guinot@laposte.net>
Cc: linux-C-programming <linux-c-programming@vger.kernel.org>


----- Original Message -----
=46rom: "Glynn Clements" <glynn@gclements.plus.com>
To: "simon" <simon.guinot@laposte.net>
Cc: "linux-C-programming" <linux-c-programming@vger.kernel.org>
Sent: Tuesday, October 26, 2004 6:59 PM
Subject: Re: buggy_double_use_of _scanf


>
> simon wrote:
>
> > I have observe a strange scanf behaviour...
> > when using two successive scanf... the second receive a return char=
acter
> >
> > for example :
> >
> > int a;
> > char b;
> >
> > scanf ("%d", &a);
> > fflush (stdin);
> > scanf ("%c", &b);
> > fprintf (stdout, "a : %d\nb : %c\n", a, b);
> >
> > what's the problem ?
>
> What makes you think that there is a problem?
>
> What's the input? If it's a decimal number followed by newline, the
> first scanf() will return the parsed number, the second will return
> the newline.


The problem, I beleve is in the fflush function. I Have the same behavi=
our
with this source code,
but when I put a additional scanf in the line, all works fine -;)

Now I ask:
Why the fflush function did not remove the new line caracter when it sh=
ould
?

it=B4s all folks !!!

        Russo.


-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
