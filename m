From: Eric Bambach <eric@cisu.net>
Subject: Re: Byte Order
Date: Wed, 12 Jan 2005 11:31:16 -0600
Message-ID: <200501121131.16555.eric@cisu.net>
References: <20050112_170357_014648.r_zaca@ig.com.br>
Reply-To: eric@cisu.net
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20050112_170357_014648.r_zaca@ig.com.br>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: r_zaca <r_zaca@ig.com.br>
Cc: linux-c-programming@vger.kernel.org

On Wednesday 12 January 2005 11:03 am, you wrote:
>   Hello all,
>
>   How can I say if the machine where I am working uses "Host Byte Ord=
er" or
> "Network Byte Order"?
>   Is it an obvius question? I mean, all hosts (machines) uses "Host B=
yte
> Order" and when it needs to send data through the network it uses "Ne=
twork
> Byte Order".
>   Thanks.

Well,

 Im not sure if this answers your question, but when doing network prog=
ramming=20
you should always use hton and ntoh conversions to make your program po=
rtable=20
whether or not your machine uses the same byte order as the network.

 If you;re asking which architectures are Big Endian and little endian =
and how=20
to tell..then im afraid I dont know. Google will tell you which archite=
ctures=20
are which.

However, man pages also say "On machines which have a byte order which =
is the=20
same as the network order, routines are defined as null macros." so its=
 safe=20
and desirable to use whether your machine uses the same of different or=
dering=20
anyways.

P.S. If you want to check Endianess perhaps you can pass an int through=
 htons=20
or ntohs (etc.) and see if it changes the values. If it doesn't, then y=
ou're=20
using the same ordering as the network. Perhaps someone can clarify if =
this=20
will actually work its just a stab in the dark.
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
