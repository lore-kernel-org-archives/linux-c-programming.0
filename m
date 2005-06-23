From: Eric Bambach <eric@cisu.net>
Subject: Re: comparing char to other known char's
Date: Thu, 23 Jun 2005 17:57:58 -0500
Message-ID: <200506231757.58518.eric@cisu.net>
References: <42B9F2C7.2030205@colannino.org> <200506231610.55260.adix@vendio.ro> <42BB1E25.1050500@colannino.org>
Reply-To: eric@cisu.net
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <42BB1E25.1050500@colannino.org>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: James Colannino <james@colannino.org>
Cc: linux-c-programming@vger.kernel.org

On Thursday 23 June 2005 03:40 pm, James Colannino wrote:
> Adrian Popescu wrote:
> > On Thursday 23 June 2005 02:22, James Colannino wrote:
> >>Hey everyone.  I hope this isn't a stupid question.  I've been goog=
ling
> >>around trying to find a function that I can use but haven't been
> >>successful.  Here's what I want to be able to do:
> >>
> >>let's say I have a char called 'character.'  I want to compare
> >>'character' to see if it's any one of the characters in a list.  Fo=
r
> >>example, maybe I would want to test character to see if it's either=
 'e',
> >>'r', '*', etc.
> >>
> >>Is this easy enough to implement?  I could do if (character =3D=3D =
'e' ||
> >>character =3D=3D [...] and so on and so forth, but this seems much =
to
> >>tedious and unreadable to be my only solution.  If anyone has any i=
deas
> >>I'd be extremely grateful :)  Thanks very much in advance.
> >>
> >>James
> >
> > the way you put it ( if (character =3D=3D 'e' || ....) ; it is TRUE=
 if
> > any (or only one) from those chars exists ;
>
> I know.  That's what I wanted.  Basically, I want to check to see if
> each character in a string matches any one of an illegal set of
> characters.  Thus, the function would fail if it encountered an illeg=
al
> character in the string.
>
> James

Generally speaking (in terms of input validation), its better practice =
to=20
check against a LEGAL set of characters rather than an illegal set. Tha=
t way=20
you can get all the characters you need, but everything else is blocked=
=2E If=20
you block illegal ones you're bound to miss a few or even ones from ext=
ended=20
charsets and input methods that you might not have thought of that coul=
d=20
wreck havoc in your program.

HTH!

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
