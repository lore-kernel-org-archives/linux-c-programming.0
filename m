From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: buggy_double_use_of _scanf
Date: Tue, 2 Nov 2004 03:44:35 +0000
Message-ID: <16775.675.574837.678165@cerise.gclements.plus.com>
References: <417E4640.2040504@laposte.net>
	<16766.47776.33240.455119@cerise.gclements.plus.com>
	<005001c4c045$86334580$2100a8c0@titanio>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <005001c4c045$86334580$2100a8c0@titanio>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: =?iso-8859-1?Q?F=E1bio_Russo?= <russo@bluecup.com.br>
Cc: simon <simon.guinot@laposte.net>, linux-C-programming <linux-c-programming@vger.kernel.org>


=46=E1bio Russo wrote:

> > > I have observe a strange scanf behaviour...
> > > when using two successive scanf... the second receive a return ch=
aracter
> > >
> > > for example :
> > >
> > > int a;
> > > char b;
> > >
> > > scanf ("%d", &a);
> > > fflush (stdin);
> > > scanf ("%c", &b);
> > > fprintf (stdout, "a : %d\nb : %c\n", a, b);
> > >
> > > what's the problem ?
> >
> > What makes you think that there is a problem?
> >
> > What's the input? If it's a decimal number followed by newline, the
> > first scanf() will return the parsed number, the second will return
> > the newline.
>=20
>=20
> The problem, I beleve is in the fflush function. I Have the same beha=
viour
> with this source code,
> but when I put a additional scanf in the line, all works fine -;)
>=20
> Now I ask:
> Why the fflush function did not remove the new line caracter when it =
should
> ?

fflush() should not have removed any characters from the buffer. The
purpose of fflush() is to ensure that any data in *output* buffers is
written to the underlying descriptor.

If your input consists of lines, you should probably be using fgets()
to read each line then using sscanf() to parse the text, rather than
using scanf() (or fscanf()) directly.

=46or a start, using fgets() makes it much easier to recover from
errors. If you call scanf(), and it indicates that it didn't read
everything which you wanted it to, it can be unclear as to exactly
what it did read and what is likely to be left in the buffer.

--=20
Glynn Clements <glynn@gclements.plus.com>
-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
