From: Tony Clarke <tony.clarke@palamon.ie>
Subject: Re: program killed
Date: Thu, 14 Aug 2003 11:25:07 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <3F3B6383.70507@palamon.ie>
References: <Pine.A41.4.20.0308132043580.88086-100000@delfin.unideb.hu> <200308141107.47697.qhwang@ieeta.pt>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <200308141107.47697.qhwang@ieeta.pt>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: qhwang@ieeta.pt
Cc: linux-c-programming@vger.kernel.org

Sounds like your system was tight on memory and the Memory Manager=20
thought your
program was a good one to kill to recoup some scarce memory.

Have a look in /mm/oom_kill.c to see how it figures out who to kill.

>Hi there,
>
>Can anyone give me some hints about why my program is killed by system? I =
am=20
>now debugging a program but after it runs for a while, I got a message say=
ing=20
>"Program terminated with signal SIGKILL, Killed". What's the causes?=20
>Memory? I am the only user since I disconnected the computer (64 MB RAM) t=
o=20
>the network.  Last night I also run my program on my laptop (256 MB RAM), =
it=20
>worked well when I used a part of data set (image). With the whole data th=
e=20
>program also got killed. I checked the syslog and found "VM: kill the prog=
ram=20
>XXX". I used MALLOC_CHECK_ but there is no memory abuse. Any suggestion?
>
>Many thanks in advance.
>
>QingHua
>-
>To unsubscribe from this list: send the line "unsubscribe linux-c-programm=
ing" in
>the body of a message to majordomo@vger.kernel.org
>More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
> =20
>



***************************************************************************=
***
The information in this e-mail is confidential and may be legally privilege=
d.
It is intended solely for the addressee.  Access to this e-mail by anyone e=
lse
is unauthorised.  If you are not the intended recipient, any disclosure,
copying, distribution, or any action taken or omitted to be taken in relian=
ce
on it, is prohibited and may be unlawful.
Please note that emails to, from and within RT=C9 may be subject to the Fre=
edom
of Information Act 1997 and may be liable to disclosure.
***************************************************************************=
***
-
To unsubscribe from this list: send the line "unsubscribe linux-c-programmi=
ng" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
