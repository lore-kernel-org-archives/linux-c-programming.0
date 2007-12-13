From: Per Jessen <per@computer.org>
Subject: Re: building libc
Date: Thu, 13 Dec 2007 08:31:58 +0100
Message-ID: <4760DFEE.70903@computer.org>
References: <475D5001.60600@computer.org> <47604165.2070305@computer.org> <84bd26ef0712121743p77080df0t48a2e68443611337@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <84bd26ef0712121743p77080df0t48a2e68443611337@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: =?ISO-8859-1?Q?Dar=EDo_Mariani?= <mariani.dario@gmail.com>
Cc: linux-c-programming@vger.kernel.org

Dar=EDo Mariani wrote:

> http://www.itworld.com/AppDev/1006/UIR000929interposers/pfindex.html.
>=20

Yeah, this is exactly what I intend to try.  My problem is in
getaddrinfo() which has been misbehaving (for quite some time). The
glibc code was fixed by Ian Jackson in glibc 2.6.1 for ubuntu, so I
figured I'd just borrow that and stick the getaddrinfo() object-code
into a shared library which I'd preload with LD_PRELOAD.  Sounds simple=
,
doesn't it?

Well, building the glibc code was no big deal, but as for "just borrow
that", it's not easy.  If I build getaddrinfo.c outside the glibc build
structure, it throws about a million errors.  Option #1 is to attempt t=
o
fix that, but with getaddrinfo.c being about 2000 lines, I'm a little
hesitant about that approach.
Option #2 (I think) is to use the object-code from the built glibc, but
when I try to use the shared library (containing just getaddrinfo.o), i=
t
complains about unresolved symbols - e.g. __inet_ntoa.


/Per Jessen
-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
