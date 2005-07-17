From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: macros with global variables?
Date: Sun, 17 Jul 2005 09:44:23 +0100
Message-ID: <17114.6759.545367.971052@gargle.gargle.HOWL>
References: <Pine.LNX.4.63.0507140830420.4466@mathanlap1.rdmcorp.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.63.0507140830420.4466@mathanlap1.rdmcorp.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: "Robert P. J. Day" <rpjday@mindspring.com>
Cc: C programming list <linux-c-programming@vger.kernel.org>


Robert P. J. Day wrote:

>   not sure if this is outside the scope of this mailing list but i
> just downloaded the source for a simple SSL-aware ftp client
> (netkit-ftp-ssl), did the configure and the make and got:
>=20
> ftp.c: In function =E2recvrequest=E2:
> ftp.c:1127: error: =E2pdata=E2undeclared (first use in this function)
> ftp.c:1127: error: (Each undeclared identifier is reported only once
> ftp.c:1127: error: for each function it appears in.)
>=20
>   ok, fair enough, check the offending header file to find the
> following macro definition:
>=20
> #define is_ssl_fd(X,Y)    ( (SSL_get_fd((X))=3D=3D0) || \
>                             (SSL_get_fd((X))=3D=3D1) || \
>                             (SSL_get_fd((X))=3D=3Dpdata) || \
>                             (SSL_get_fd((X))=3D=3D(Y)) \
>=20
>   ?????.  so i have a macro which accepts two arguments, but expands
> to include an explicit reference to something called "pdata", which
> does not exist, hence the error message.
>=20
>   i tend to avoid defining macros that refer to anything but their ow=
n
> arguments.  what might the above mean?  is there some well-known idio=
m
> for C programmers that makes the above, in some way, acceptable?
> (i've perused the code and the object "pdata", whatever that is, is
> simply not defined anywhere.  so is there a context in which the abov=
e
> makes sense in some way?)

At the risk of stating the obvious, the only context where it makes
sense is one where "pdata" is defined, as either a global variable,
local variable or macro.

Macros with external references are generally best avoided, although
sometimes it can simplify the code signficantly.

--=20
Glynn Clements <glynn@gclements.plus.com>
-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
