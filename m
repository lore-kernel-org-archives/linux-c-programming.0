From: Christoph Bussenius <busseniu@cip.physik.uni-muenchen.de>
Subject: Re: stracing pwd
Date: Sat, 19 Jun 2004 18:13:02 +0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20040619161302.GA31012@opaque>
References: <1087658980.8158.13.camel@mokona>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1087658980.8158.13.camel@mokona>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-c-programming@vger.kernel.org
Cc: Linux C Programming <linux-c-programming@vger.kernel.org>

On Sat, Jun 19, 2004 at 10:29:40AM -0500, David Eduardo G=F3mez Noguera=
 wrote:
> /usr/src/linux-2.6.7
> /usr/src/linux -> /usr/src/linux-2.6.7
>=20
> under /usr/src/linux,=20
> pwd prints /usr/src/linux
> pwd -L too
> pwd -P prints /usr/src/linux-2.6.7
> but an strace always shows the same
> write(1, "/usr/src/linux-2.6.7\n", 21/usr/src/linux-2.6.7
> )  =3D 21
> and it prints /usr/src/linux-2.6.7 to stdout no matter the parameter
> given to pwd.
>=20
> Anyone knows why that could happen?=20
> ( I haven't seen to the pwd code yet though)

The difference is that the first time you call pwd, you actually call
the shell builtin named pwd. The second time you call pwd, you call
/bin/pwd. The shell thinks you are where you have cd'd to, but in fact,
you are in /usr/src/linux-2.6.7. Just try typing /bin/pwd in the shell.

Cheers,
Christoph

--=20
``There's no dark side of the moon, really
Matter of fact, it's all dark''

--Pink Floyd
-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
