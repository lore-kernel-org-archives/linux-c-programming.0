From: Eric Bambach <eric@cisu.net>
Subject: Re: Multithreading with C++
Date: Thu, 7 Apr 2005 11:36:11 -0500
Message-ID: <200504071136.11219.eric@cisu.net>
References: <D2AA47A6FB2C1A48AF0526440C0F245CAA3676@monm207.nae.ds.army.mil>
Reply-To: eric@cisu.net
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <D2AA47A6FB2C1A48AF0526440C0F245CAA3676@monm207.nae.ds.army.mil>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: "Huber, George K RDECOM CERDEC STCD SRI" <George.K.Huber@us.army.mil>
Cc: linux prg <linux-c-programming@vger.kernel.org>

On Thursday 07 April 2005 12:02 pm, you wrote:
> All,
>
> This may be a little off topic, but I though I would try here first.

Did you compile with -lpthread and -D_REENTRANT? If I remeber correctly=
, this=20
is something I had alot of trouble with when I started thread programmi=
ng.=20
Similiar error and everything. Compiled but the library calls weren't=20
working. Make sure to include <pthread.h> too  ;)

> I am writting a multi-threaded program and would like to have each
> thread `managed' by a class.  I have attempted to do this like this,
> using the pthreads library:

--snip--

> Thanks,
> George Huber
>

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
