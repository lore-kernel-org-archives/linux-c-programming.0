From: Eric Bambach <eric@cisu.net>
Subject: Re: how to implement tail -n
Date: Mon, 24 Jan 2005 00:30:29 -0600
Message-ID: <200501240030.29947.eric@cisu.net>
References: <1106461572.1122.1.camel@KrishnaMohan> <1106487378.1122.14.camel@KrishnaMohan> <009a01c501d8$6d504cf0$dc846840@apac.cisco.com>
Reply-To: eric@cisu.net
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <009a01c501d8$6d504cf0$dc846840@apac.cisco.com>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Venkatesh Joshi <joshiv@cisco.com>
Cc: linux-c-programming@vger.kernel.org

On Sunday 23 January 2005 11:49 pm, you wrote:
> Hi,
>
> I would like to know how to implement "tail -n" in C.
>
> The "-n" option will be used to print the last n lines of a file -
> rather than the default option of printing the last 10 lines of a fil=
e.
>
> I wish to do this in a single pass. I can use lseek() to go to the en=
d
> of the file. How to traverse backwards from there ? Is there any
> function that does this ?

Not that I know of. There is no GOOD way to do this in a single pass si=
nce the=20
lines can be of varying length. If by single pass you meant you want=20
performace, then dont read a char at a time, rather just seek to the en=
d of=20
the file,  read in about 4K( a reasonable buffer) or so and see if you =
can=20
find (n+1) newlines. If you dont, read in 4 more k and keep going backw=
ards=20
till you find them.

P.S. Please dont hi-jack subjects. Type in a new message instead of rep=
lying=20
to something and deleting the original message; it screws with threadin=
g.


> thanks,
> venkatesh
> -
> To unsubscribe from this list: send the line "unsubscribe
> linux-c-programming" in the body of a message to majordomo@vger.kerne=
l.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

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
