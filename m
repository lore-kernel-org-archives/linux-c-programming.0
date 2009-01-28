From: xcomp@arcor.de
Subject: Is it bad to let a signal handler stay alive for a long time
Date: Wed, 28 Jan 2009 19:58:18 +0100 (CET)
Message-ID: <16930643.1233169098680.JavaMail.ngmail@webmail14.arcor-online.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-c-programming@vger.kernel.org

Hi all,
I am still thinking about a preemptive scheduling implementation in use=
r-mode. Therefore I have switched from using setcontext to calling swap=
context in the signal handler. This approach seems to solve the problem=
 I had with setcontext in the signal handler (in my test program for lo=
ops does not finished correctly in every case).
But now I ran into another question: If I am using swapcontext inside t=
he signal handler its context stays alive for a long time (because othe=
r contexts are running before the handler can finish its work). I didn'=
t find any trouble caused by this till now. But I've found also many si=
tes where they say that a signal handler should include only a small am=
ount of code so that it can finish fast.
So my questions are: Can anyone explain, why it is still a bad idea to =
use swapcontext inside the signal handler, although there seem to be no=
 problems with it? If there are, which problems can occur? Does anyone =
has a good idea for a stress test in order to find problems? Simply run=
ning a huge number of code does not seem to be enough.
I appreciate any responds.

Thx,
Matthias

Erwischt! Bei Arcor sehen Sie die besten Promi-Bilder riesengro=DF und =
in Top-Qualit=E4t. Hier finden Sie die sch=F6nsten Schnappsch=FCsse auf=
 dem roten Teppich, lernen die Frauen des Womanizers Boris Becker kenne=
n und schauen den Royals ins Wohnzimmer. Viel Spa=DF auf Ihrer virtuell=
en Reise durch die Welt der Stars und Sternchen: http://vip.arcor.de.
--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
