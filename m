From: crincon@et.com.mx (Cesar Rincon)
Subject: Re: accept() and signals
Date: Wed, 31 Mar 2004 21:08:17 -0600
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20040401030817.GF24581@et.com.mx>
References: <20040331205930.GC24581@et.com.mx> <16491.17543.318847.34527@cerise.nosuchdomain.co.uk> <20040331235424.GE24581@et.com.mx> <16491.26952.611460.119076@cerise.nosuchdomain.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <16491.26952.611460.119076@cerise.nosuchdomain.co.uk>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Glynn Clements <glynn.clements@virgin.net>
Cc: linux-c-programming@vger.kernel.org

Ipsissima verba Glynn Clements:
> It used to be. Versions of libc based upon GNU libc 1.x (i.e. up to
> and including libc-5) used the SysV semantics by default. It was
> changed because:
=2E..

Sounds reasonable.

> Actually, my signal(2) manpage (English, supplied with RedHat 6.2,
> which uses GNU libc 2.1.3) says:
>=20
>        Unlike  on  BSD  systems, signals under Linux are reset to
>        their default  behavior  when  raised.   However,  if  you
>        include  <bsd/signal.h>  instead of <signal.h> then signal
>        is redefined as __bsd_signal and signal has the BSD seman=AD
>        tics.   Both versions of signal are library routines built
>        on top of sigaction(2).
>
> Which is incorrect. So it may not be just the translation which is
> outdated.

=46or what it's worth, my English manpage (supplied by Debian Sid, libc
2.3.2), does not include that text.  It pretty much explains what
you've told me here, and other interesting information (including the
list of POSIX "safe functions" for use in signal handlers).

And my Spanish manpage (btw, a *completely* different one) actually
says that from libc6 on, signal() uses BSD semantics, and points to
"sysv_signal()" if SysV semantics are required (which the English
manpage qualifies as "not recommended").  The sigaction(2) manpage,
though, seems to be much older.

> A large part of the problem is that the GNU project officially
> favours texinfo documentation over traditional manual pages. The
> manpages for most of the libc functions were written by third
> parties (and some of them are taken directly from BSD).

I see.  This is, IMO, somewhat unfortunate.  I never really got the
hang of the texinfo thing.  But, given the state of the manpages, I
think I better teach me to like it soon :-/

 -CR

--=20
Ceterum censeo: SCO delenda est.
-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
