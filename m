From: Eric Bambach <eric@cisu.net>
Subject: Re: malloc and free
Date: Fri, 24 Dec 2004 12:52:36 -0600
Message-ID: <200412241252.36261.eric@cisu.net>
References: <20041224183913.9579.qmail@web52907.mail.yahoo.com>
Reply-To: eric@cisu.net
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20041224183913.9579.qmail@web52907.mail.yahoo.com>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Ankit Jain <ankitjain1580@yahoo.com>
Cc: linux-c-programming@vger.kernel.org

On Friday 24 December 2004 12:39 pm, you wrote:
> hi
>
> routine xyz uses malloc and free functions. it gives
> accurate and correct result if called once.
>
> but if the function is called in a loop N number of
> times then probably it gives segmentation fault.
>
> what is the reason?  can any body guess or test code
> is needed?
>
> thanks
>
> ankit jain

A common cause of failure in the malloc/free routines is memory corrupt=
ion.=20
The trick about memory corruption and buffer overflows is that they wor=
k=20
sometimes/most of the time. Perhaps you are doing out-of-bounds reading=
 or=20
(gak!) writing with the memory. Try running it under valgrind to see if=
 this=20
is the case.

Also, although routine xyz may not corrupt the memory perhaps something=
 else=20
in your program is? Writing in strange places confuses libc and can res=
ult in=20
a segfault in places that can be quite far away from the original spot =
of=20
corruption.

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
