From: =?iso-8859-1?q?szonyi=20calin?= <caszonyi@yahoo.com>
Subject: Re: Multithreaded /sbin.init? Is it possible?
Date: Mon, 15 Sep 2003 12:29:29 +0200 (CEST)
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20030915102929.8156.qmail@web40605.mail.yahoo.com>
References: <200309141240.55800.eric@cisu.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <200309141240.55800.eric@cisu.net>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: eric@cisu.net, linux-newbie@vger.kernel.org, linux-c-programming@vger.kernel.org

 --- Eric <eric@cisu.net> a =E9crit=A0:=20
> 	Wouldn't the Linux Boot process be speeded up if the init
> program was=20
> multithreaded?=20

No
Boot scripts _must_ be executed in a predefined order.
I was playing a liitle with this and i can give you the=20
following advice:

1. Bash is the most executed program in the init scripts
to speed up boot process you must speedup bash.
Some people suggest to make statically linked. This is=20
my sugestion too. Loading every shared library takes time.

2. Use a script to start your daemons not 20.=20
I use Slackware which has one script for each runlevel.=20
Believe me. There _is_ a difference compared to Mandrake=20
for example.=20

3. The disk load has an impact on speed also.
If you start 5 processes in parralel they will start slower
than 5 scripts sequentially because of the loading of every
script in the same time.

4. A bigger processor cache also helps a lot :-)

just my 2 cents.

Sorry for the off-topic answer in linux-c-programming

> ----------------------
> Eric Bambach  =20
> Eric (at) CISU (dot) net=20
> ----------------------

Calin

=3D=3D=3D=3D=3D
--
A mouse is a device used to point at=20
the xterm you want to type in.
Kim Alm on a.s.r.

___________________________________________________________
Do You Yahoo!? -- Une adresse @yahoo.fr gratuite et en fran=E7ais !
Yahoo! Mail : http://fr.mail.yahoo.com
-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
