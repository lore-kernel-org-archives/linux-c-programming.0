From: Stephen Kratzer <kratzers@pa.net>
Subject: Re: standard OS defines
Date: Wed, 22 Aug 2007 16:01:02 -0400
Message-ID: <200708221601.02890.kratzers@pa.net>
References: <46CC81E9.1080904@hp.com> <46CC8E51.4050201@hp.com> <200708221547.25508.kratzers@pa.net>
Reply-To: kratzers@pa.net
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <200708221547.25508.kratzers@pa.net>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Bryan Christ <bryan.christ@hp.com>
Cc: linux-c-programming@vger.kernel.org

On Wednesday 22 August 2007 15:47:25 Stephen Kratzer wrote:
> On Wednesday 22 August 2007 15:28:17 Bryan Christ wrote:
> > Thanks! =A0This list is exactly what I was looking for. =A0Too bad =
there's
> > not a tool for piping to gcc--I was trying to avoid -D.
> >
> > Bryan
>
> This is about as ugly as it gets, but here it is anyway:
>
> echo -e "#ifndef __SOMETHING__\n#define __SOMETHING__\n#endif" | cat =
-
> infile.c | gcc -x c -o outfile.c -
> -
> To unsubscribe from this list: send the line "unsubscribe
> linux-c-programming" in the body of a message to majordomo@vger.kerne=
l.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

The outfile shouldn't have a .c extension since it's a binary. My bad. =
The=20
following is slightly cleaner, but not much:

sed '1 i\#ifndef __SOMETHING__\n#define __SOMETHING__\n#endif\n' infile=
=2Ec |=20
gcc -x c -o outfile -
-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
