From: Francis Lau <fkwlau@utcc.utoronto.ca>
Subject: Re: quotactl
Date: Wed, 2 Jul 2003 14:58:29 -0400
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.44.0307021454080.20193-100000@gpu.utcc>
References: <3F03225D.30601@fi.uba.ar>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <3F03225D.30601@fi.uba.ar>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: =?ISO-8859-1?Q?Dar=EDo_Mariani?= <dmarian@fi.uba.ar>
Cc: linux-c-programming@vger.kernel.org

On Wed, 2 Jul 2003, Dar=EDo Mariani wrote:

>    If you did not recompile the kernel, it has quota support. Has the=
 FS=20
> you are quering been mounted with the usrquota option?

Yes the FS is mounted with the usrqutoa option.  I can use repquota,=20
edquota, quota, quotacheck, quotaon, quotaoff...etc. with no problems. =
=20
I only have problems with I use quotactl in my C code. =20

=46rancis

>=20
> Francis Lau wrote:
> >>make a clean compilation of the kernel from the beggining.(use make=
 clean &&
> >>make mrproper).Be sure that no object files exist when you start bu=
ilding
> >>your new kernel.Try this....and e-mail again:)
> >>
> >=20
> > I'm running RedHat 9 with the stock 2.4.20 SMP kernel.  Unfortunate=
ly, I=20
> > cannot (not allowed to) recompile the kernel...Any other suggestion=
s?
> >=20
> > Thanks
> > Francis
> >=20
> > -
> > To unsubscribe from this list: send the line "unsubscribe linux-c-p=
rogramming" in
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
> >=20
>=20
>=20
> -
> To unsubscribe from this list: send the line "unsubscribe linux-c-pro=
gramming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>=20

-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
