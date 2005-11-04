From: davidgn@servidor.unam.mx
Subject: Re: exec question
Date: Fri, 04 Nov 2005 10:22:37 -0600 (CST)
Message-ID: <1131121357.436b8acd4e129@www.correo.unam.mx>
References: <436AECF0.5090109@gmail.com> <1131083883.10404.3.camel@mokona> <436AF357.5050109@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <436AF357.5050109@gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-c-programming@vger.kernel.org

Quoting ework0 <ework0@gmail.com>:

> David Eduardo G=C3=B3mez Noguera wrote:
>=20
> >On Thu, 2005-11-03 at 23:09 -0600, ework0 wrote:
> > =20
> >
> >>Hello,
> >>
> >>How can I execute a program (without the full path, just the name)
> using=20
> >>exec's system calls within a C program? ej: buf[]=3D{"uname",NULL};
> >>
> >>Thanks for a brief example,
> >>
> >>ework0
> >>
> >>
> >>   =20
> >>
> >
> >I think not, not with exec's family of functions anyway.
> >You could try system though, or popen or some other way, but its a b=
it
> >risky to call programs without the full path.
> >
> > =20
> >
> are you sure DAVID!!! ???? I cant use system() or popen() is unsecure=
!
>=20
>=20


The reason you can avoid a full path with system and popen is because t=
hey first
spawn a shell and then have the shell execute the program.=20
The shell first looks for the program in the PATH env variable.

Also to use exec you probably want to fork() first.

But then again, what does that buff variable is for? if it's ARGV, then=
 its
right to have the name for the program only, but the filename argument =
still
needs to include the full path

i.e.

execv("/bin/uname", buff);

would execute /bin/uname, and if it happened to read it's first paramet=
er
(argv[0]) it would find the string "uname"
there would also be no more parameters (argc =3D=3D 1)

-------------------------------------------------
www.correo.unam.mx
UNAMonos Comunic=E1ndonos

-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
