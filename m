From: =?iso-8859-1?Q?Dar=EDo?= Mariani <dmarian@fi.uba.ar>
Subject: Re: Running make seems to be crashing my computer.
Date: Thu, 02 May 2002 18:30:52 -0300
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <3CD1B00C.71CB2F38@fi.uba.ar>
References: <02050222174801.01065@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: inbox@andy.co.uk
Cc: linux-c-programming@vger.kernel.org


Two things come to my mind:
1) An error in your installation, I cannot tell much about it, may be
others can.
2) Compiling makes the processor give it all, I saw damaged processor
that worked with small loads, but when trying to compile anything they
couldn't.

  Try compiling something that works, for instance a production kernel.
If it does not compile, definitely is one of the two points above, and
if it ends with something like "internal compiler error" I will put all
my money to point 2.

	Dar=EDo

Andrew Edmondson wrote:
>=20
> Does anyone know of anything dangerous running make 3.79.1 at all? Af=
ter I
> try to make some software I'm writing my PC crashes and re-boots. It'=
s not
> the software that's the problem since I am not able to run it yet, I'=
m
> integrating some new changes.
>=20
> Is there anything within a Makefile that could cause problems? It's
> definately running make that's the problem because I am not running a=
nything
> else that I don't run for hours at a time during normal use.
>=20
> At the re-boot I had the message:
>=20
> 74 Segmentation fault
>         initlog -c "fsck -T -a $fsckoptions /"
>=20
> And while checking the filesystems:
>=20
> bash: error loading shared libraries; Version GLIBC_2.0 not defined i=
n file
> libc.so.6 with linktime reference.
>=20
> Does anyone have any ideas?
>=20
> Andrew
> --
>=20
> for x in *; do echo go on\!; sleep 1;done; echo Have a cup of tea\!
> -
> To unsubscribe from this list: send the line "unsubscribe linux-c-pro=
gramming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
