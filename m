From: Eric Bambach <eric@cisu.net>
Subject: Re: access & dump framebuffer
Date: Sun, 16 Oct 2005 12:49:02 -0500
Message-ID: <200510161249.02632.eric@cisu.net>
References: <Pine.LNX.4.21.0510161257350.737-100000@hestia>
Reply-To: eric@cisu.net
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.21.0510161257350.737-100000@hestia>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: "J." <mailing-lists@xs4all.nl>
Cc: linux-c-programming@vger.kernel.org

J.

I haven't done this before but perhaps I can get you started.

I wouldnt try to do it from the kernel becuase drivers have already bee=
n=20
written to do that. In order to display an image the kernel will have t=
o be=20
compiled with FrameBuffer support for whichever videocard the machine h=
as.=20

Next, I would look into the bootsplash packages and how that uses the=20
framebuffer device for displaying images. There are also vaious librari=
es=20
that you can link traditional X programs against so they can be used in=
 an=20
environment without X. They use the framebuffer device instead. I seem =
to=20
recall that people have even gotten the mozilla browser to open up in a=
 cli=20
environment. Search for those libraries and see how they do it.

My main point is that you want to do is find out how to use the video=20
framebuffer device once you know the machine's kernel supports it.=20

 Hope that gets you started!

On Sunday 16 October 2005 06:01 am, J. wrote:
> Sunday, October 16 12:57:35
>
> Hi ..
>
> Question - I was thinking about writing a program that creates a
> screendump [image] only from the cli. [not X]. Where should I access
> the data that is displayed on the screen? Directly from the hardware,=
 or
> from the kernel somewhere or .. ?
>
> Any comments, thoughts or hints are appreciated.
>
> Thankx.
>
> J.

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
