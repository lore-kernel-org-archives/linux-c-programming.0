From: Eric Bambach <eric@cisu.net>
Subject: Re: File I/O wrapper?
Date: Tue, 25 Jan 2005 13:42:01 -0600
Message-ID: <200501251342.01283.eric@cisu.net>
References: <1450f66c05012411557e328fa1@mail.gmail.com> <200501241454.21502.eric@cisu.net> <1450f66c05012508457a3f123c@mail.gmail.com>
Reply-To: eric@cisu.net
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <1450f66c05012508457a3f123c@mail.gmail.com>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Dan Gary <funkychunkymunky@gmail.com>
Cc: linux-c-programming@vger.kernel.org

On Tuesday 25 January 2005 10:45 am, Dan Gary wrote:
> I originally avoided fifos because I couldn't figure out how to tell
> my program when to switch modes from read to write on the fifo.
>
> I need this to be able to dump data back out the "pipe" when a read i=
s
> done, to be able to use this as a dropin replacement for log files,
> and potentially config files.

Maybe im misunderstanding you, but I have no clue as to the purpose of =
what=20
you're trying to accomplish. You are writing a program that can act as =
a=20
config file to be read by one program, while acting as a logfile to be=20
written to by another?

Im not a programming guru, but I doubt this will work as a "drop in"=20
replacement for programs as you cant get enough data from a read or a w=
rite=20
call to know what kind of data the program is expecting or what it will=
 be=20
writing. You either need the sending/receiving program to identify itse=
lf to=20
you (sockets, two-way pipe), or you need to snoop pretty hard on the=20
reader/writer which is a trick in itself.=20

You probably will need a kernel module, or an interesting new filesyste=
m.

Perhaps you can enlighten me further, as this sounds interesting, even =
if its=20
not feasable as a generic "drop in" replacement.

> And I really didn't want the i/o blocking, and although I've heard
> about ways to limit that I haven't seen a good example.
>
>
> I never thought about a char device though, might be the ticket.
>
> > What comes to my mind is a fifo also. Why do you say its not suitab=
le?
> > Perhaps you are looking at it wrong. Please explain why you can't d=
ont
> > want to use a FIFO and perhaps it will help us think of an alternat=
ive.
> >
> > Anything you can do on a file you can do with a FIFO. Perhaps you d=
ont
> > want the SIGPIPE problem and blocking reads/writes?
> >
> > Sockets would be better but require the original program know about=
 them.
> >
> > Perhaps registering a character device with the kernel and having t=
he
> > original program write on /dev/mylog and your program receiving it.
> >
> > Heres a neat link on an example device driver chardev.c Not sure if=
 its
> > for 2.4 or 2.6, but its a good place to start if you will actually =
need
> > to write a kernel module to shunt some data for you.
> >
> > http://www.faqs.org/docs/kernel/x571.html
> >
> > ----------------------------------------
> > --EB
> >
> > > All is fine except that I can reliably "oops" it simply by trying=
 to
> > > read from /proc/apm (e.g. cat /proc/apm).
> > > oops output and ksymoops-2.3.4 output is attached.
> > > Is there anything else I can contribute?
> >
> > The latitude and longtitude of the bios writers current position, a=
nd
> > a ballistic missile.
> >
> >                 --Alan Cox LKML-December 08,2000
> >
> > ----------------------------------------

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
