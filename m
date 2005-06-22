From: Eric Bambach <eric@cisu.net>
Subject: Re: comparing char to other known char's
Date: Wed, 22 Jun 2005 18:46:22 -0500
Message-ID: <200506221846.22103.eric@cisu.net>
References: <42B9F2C7.2030205@colannino.org>
Reply-To: eric@cisu.net
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <42B9F2C7.2030205@colannino.org>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: James Colannino <james@colannino.org>

On Wednesday 22 June 2005 06:22 pm, James Colannino wrote:
> Hey everyone.  I hope this isn't a stupid question.  I've been googli=
ng
> around trying to find a function that I can use but haven't been
> successful.  Here's what I want to be able to do:
>
> let's say I have a char called 'character.'  I want to compare
> 'character' to see if it's any one of the characters in a list.  For
> example, maybe I would want to test character to see if it's either '=
e',
> 'r', '*', etc.
>
> Is this easy enough to implement?  I could do if (character =3D=3D 'e=
' ||
> character =3D=3D [...] and so on and so forth, but this seems much to
> tedious and unreadable to be my only solution.  If anyone has any ide=
as
> I'd be extremely grateful :)  Thanks very much in advance.
>
> James

=46ill an array with the ascii table

char array[256];

for( int i =3D 0;i < 256;i++){
 array[i] =3D i;
}

then mask out the characters you dont want matched.
 array[69] =3D 0;
 array[72] =3D 0;

Then use the character you receive as the index.
if ( array[character ){
 process this char...
}

There are a few other tricks too....perhaps this will work for you?
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
