From: Eric Bambach <eric@cisu.net>
Subject: Re: Forcing a core dump
Date: Fri, 20 Aug 2004 11:45:05 -0500
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <200408201145.05363.eric@cisu.net>
References: <200408191209.37695.opacki@acn.waw.pl> <412622F5.2080208@fi.uba.ar>
Reply-To: eric@cisu.net
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <412622F5.2080208@fi.uba.ar>
Content-Disposition: inline
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: =?iso-8859-1?q?Dar=EDo_Mariani?= <dmarian@fi.uba.ar>
Cc: linux-c-programming@vger.kernel.org

On Friday 20 August 2004 11:12 am, Dar=EDo Mariani wrote:
> Hello:
>    Is it possible to force a running program to generate a core dump.=
 My
> problem is that I have a program that, from time to time, it freezes =
and
> I want to know what's going on.

	Others may correct me if I'm wrong, however if you issue a SIGSTOP or =
SIGKILL=20
most programs will coredump will they not? You have to enable core dump=
ing in=20
your environment using ulimit -c (number in KB).
	Plus you should be able to attach gdb if its been compiled with debugg=
ing=20
symbols, and even if it hasn't you will still get some debug control.
--=20

-EB
-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
