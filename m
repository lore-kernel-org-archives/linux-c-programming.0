From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: accept() and signals
Date: Thu, 1 Apr 2004 01:58:48 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <16491.26952.611460.119076@cerise.nosuchdomain.co.uk>
References: <20040331205930.GC24581@et.com.mx>
	<16491.17543.318847.34527@cerise.nosuchdomain.co.uk>
	<20040331235424.GE24581@et.com.mx>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20040331235424.GE24581@et.com.mx>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Cesar Rincon <crincon@et.com.mx>
Cc: linux-c-programming@vger.kernel.org


Cesar Rincon wrote:

> > The default behaviour of signal() in GNU libc 2.x is the BSD
> > behaviour, i.e. interrupted system calls are automatically
> > restarted, and the handler isn't reset upon receipt of a signal. If
> > you want system calls such as accept() to be interrupted, you shoul=
d
> > use sigaction() without the SA_RESTART flag.
>=20
> Which works perfectly, thank you very much.
>=20
> > More generally, the safest approach is to always use sigaction()
> > rather than to assume a particular behaviour from signal().
>=20
> And it says that much in the manual, duh.  It's just that I was using
> Spanish-translated dev manpages, which are, now I know, ahem, a bit
> outdated.  E.g., sigaction(2) says that SA_RESETHAND is the default
> behaviour of signal()...

It used to be. Versions of libc based upon GNU libc 1.x (i.e. up to
and including libc-5) used the SysV semantics by default. It was
changed because:

1. Resetting the signal disposition (i.e. the SysV semantics or the
SA_RESETHAND flag) is the wrong thing to do more often than it is the
right thing to do.

2. Interrupting system calls (i.e. the SysV semantics) is probably the
wrong thing to do at least as often as it is the right thing to do.

3. Interrupting system calls when the programmer wasn't expecting it
is arguably worse than not interrupting them when the programmer was
expecting it. In the latter case, the programmer will probably
discover (and presumably fix) the problem fairly quickly. In the
former case, the program will survive cursory testing but may fail in
actual use.

Actually, my signal(2) manpage (English, supplied with RedHat 6.2,
which uses GNU libc 2.1.3) says:

       Unlike  on  BSD  systems, signals under Linux are reset to
       their default  behavior  when  raised.   However,  if  you
       include  <bsd/signal.h>  instead of <signal.h> then signal
       is redefined as __bsd_signal and signal has the BSD seman=AD
       tics.   Both versions of signal are library routines built
       on top of sigaction(2).

Which is incorrect. So it may not be just the translation which is
outdated.

A large part of the problem is that the GNU project officially favours
texinfo documentation over traditional manual pages. The manpages for
most of the libc functions were written by third parties (and some of
them are taken directly from BSD).

--=20
Glynn Clements <glynn.clements@virgin.net>
-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
