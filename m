From: davidgn@servidor.unam.mx
Subject: Re: Linux source code: malloc.c
Date: Thu, 06 Jan 2005 09:27:33 -0600 (CST)
Message-ID: <1105025253.41dd58e57c0f7@132.248.10.8>
References: <20041230130432.4f93abe2@tethys.montpellier.4js.com> <000b01c4eff2$623ff7e0$8a7e4ed5@j0s6l8> <013701c4f3be$6b230710$dc846840@apac.cisco.com> <20050106091104.GA3805@archibold>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20050106091104.GA3805@archibold>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-c-programming@vger.kernel.org

Mensaje citado por: Steven Smith <sos22@cam.ac.uk>:

> > Where can I see the implementation of free() and malloc() in Linux
> > source code? I am not able to locate the file malloc.c.
> That's because malloc() isn't in Linux-the-kernel: it's in glibc.
> The file you're looking for is malloc/malloc.c in the glibc tarball.
>=20

Except the kernel implements its own "kmalloc", which if I'm not wrong =
is called
upon by libc's malloc


-------------------------------------------------
www.correo.unam.mx
UNAMonos Comunic=E1ndonos

-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
