From: Eric Bambach <eric@cisu.net>
Subject: Re: Printf and scanf
Date: Sun, 5 Jun 2005 09:03:06 -0500
Message-ID: <200506050903.06198.eric@cisu.net>
References: <20050605122105.1865.qmail@web52905.mail.yahoo.com> <4a618d0805060506545a4337be@mail.gmail.com>
Reply-To: eric@cisu.net
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <4a618d0805060506545a4337be@mail.gmail.com>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Arturas Moskvinas <arturas.moskvinas@gmail.com>
Cc: linux prg <linux-c-programming@vger.kernel.org>

On Sunday 05 June 2005 08:54 am, Arturas Moskvinas wrote:
> > hi
> >
> > this is a simple problem which somebody asked me and i
> > am not able to solve. if somebody here can help me out
> >
> > i just want to know how scanf function can be used on
> > the place of printf and vice versa
>
> Scanf reads from STDIN and printf writes into STDOUT. I do not think
> there is any way to change reading operation with writing... Of cours=
e
> some alchemy might help you :)
>
> I think you misinterpreted something...

I agree. At a most basic level printf copies its arguments into STDOUTs=
=20
buffer. Scanf reads from STDINs buffer and copies to its arguments memo=
ry=20
space. There is no way to make these functions behave differently. Perh=
aps=20
with fprintf and fscanf you can make some magic...but its a silly exerc=
ise=20
and would make code unholy and unreadable.
> Arturas Moskvinas
> -
> To unsubscribe from this list: send the line "unsubscribe linux-newbi=
e" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at http://www.linux-learn.org/faqs

--=20
----------------------------------------
--EB

> All is fine except that I can reliably "oops" it simply by trying to =
read
> from /proc/apm (e.g. cat /proc/apm).
> oops output and ksymoops-2.3.4 output is attached.
> Is there anything else I can contribute?

The latitude and longtitude of the bios writers current position, and
a ballistic missile.

=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0--Alan Cox LKML-Decembe=
r 08,2000=20

----------------------------------------
-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
