From: Eric Bambach <eric@cisu.net>
Subject: Re: strace write/read output
Date: Tue, 22 Mar 2005 13:05:32 -0600
Message-ID: <200503221305.32606.eric@cisu.net>
References: <Pine.LNX.4.58.0503221104060.30671@ns.isi.ulatina.ac.cr>
Reply-To: eric@cisu.net
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
In-Reply-To: <Pine.LNX.4.58.0503221104060.30671@ns.isi.ulatina.ac.cr>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Fabio Miranda Hamburger <fabmirha@ns.isi.ulatina.ac.cr>
Cc: linux-c-programming@vger.kernel.org

On Tuesday 22 March 2005 11:05 am, Fabio Miranda Hamburger wrote:
> hello,
>
> I am debugging a tcpip app on linux, I would like to use strace to sh=
ow me
> *all* the data passed to read() and write() function to the sockets
> stream.
>
> thanks,
>
      Does strace with the -e option do what you want? man strace. It s=
eems to=20
do read and write. Prepare for big logfiles ;)
> ---
> Fabio Andres Miranda
> Ingenieria de sistemas informaticos
> Universidad Latina - Costa Rica
>
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
