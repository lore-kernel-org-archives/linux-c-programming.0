From: "Mariano Moreyra" <moremari@aca.org.ar>
Subject: RE: good pthreads example?
Date: Wed, 24 Sep 2003 11:58:36 -0300
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <001401c382ac$54e3b1e0$0b04a8c0@aca.org.ar>
References: <20030924142038.GA23791@nevernight.net>
Reply-To: <mariano_moreyra@aca.org.ar>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20030924142038.GA23791@nevernight.net>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: 'Jason Cooper' <jcooper@nevernight.net>, linux-c-programming@vger.kernel.org

Apache does implement pthread starting from version 2


-----Mensaje original-----
De: linux-c-programming-owner@vger.kernel.org
[mailto:linux-c-programming-owner@vger.kernel.org]En nombre de Jason
Cooper
Enviado el: Mi=E9rcoles, 24 de Septiembre de 2003 11:21
Para: linux-c-programming@vger.kernel.org
Asunto: Re: good pthreads example?


Harmeet Uppal (Harmeet_Uppal@KeaneIndia.com) scribbled:
> Hi Jason,
>
> I would suggest you start with Thread Time a book from HP Press and d=
o
> chapter to chapter coding. It would be a great help.
>
> -Harmeet
>
> -----Original Message-----
> From: Jason Cooper [mailto:jcooper@nevernight.net]
> Sent: Monday, September 22, 2003 6:44 PM
> To: linux-c-programming@vger.kernel.org
> Subject: Re: good pthreads example?
>
>
> Raghuveer (rvk@gsecone.com) scribbled:
[snip]
> > Jason Cooper wrote:
> >
> > >Hey all,
> > >
> > >I've been learning pthreads for the past week or so.  So far, I've=
 read
> > >through the man pages, "Pthreads Programming" from O'Reilly, an ol=
d
> > >copy of POSIX 4, and other various google searches.
> > >
> > >What I'm looking for is a good example (open source, of course) of
> > >pthreads in practice.  It doesn't matter whether it's boss/worker,
> > >peer/peer, or assembly line.  I'm looking for practical examples t=
o
> > >learn from.
> > >
> > >The O'Reilly book has a good ATM (cash machine, client/server) exa=
mple,
> > >but it isn't implemented in the real world...
> > >
> > >TIA,
> > >
> > >Cooper.
> > >
> > >PS - I know grepping through source will provide plenty of example=
s of
> > >pthreads in action, but I wouldn't know if they are sound
> > >implementations or not.
>
> Thanks for the reply, unfortunately, what I'm looking for is a
> recommendation of a good FS/OSS package to look at which implements
> pthreads.
>
> As usual, my long-windedness confused the issue :)
>
> Cooper.

Thanks, I'll take a look at it.

I had a chance to grep through /usr/bin for 'pthread', and found
that almost everything appears to implement pthreads.  Unfortunately,
grepping through /usr/sbin revealed that sshd (nor ssh from previous
search) does not implement pthreads.  I had hoped that a package like
OpenSSH, which has a solid reputation, would have been a good example.
Oh well, qmail doesn't appear to either...  Back to the books. *8v)

Perhaps apache or postfix?  I don't use either, so I'll have to d'l the=
m
later...

Cooper.
-
To unsubscribe from this list: send the line "unsubscribe
linux-c-programming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
