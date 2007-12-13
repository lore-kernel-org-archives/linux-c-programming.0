From: "=?ISO-8859-1?Q?Dar=EDo_Mariani?=" <mariani.dario@gmail.com>
Subject: Re: building libc
Date: Wed, 12 Dec 2007 22:44:29 -0300
Message-ID: <84bd26ef0712121744x4f4b431mdb14f26d85408c68@mail.gmail.com>
References: <475D5001.60600@computer.org> <47604165.2070305@computer.org>
	 <84bd26ef0712121743p77080df0t48a2e68443611337@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        bh=hvqfJxW9EiK0myp4Rph4piM1pmIs7dPCtWTw6Cf6oyo=;
        b=QbLxY3vsAsg1hAO+UFYiGdH0ei+/wAftVAUpgomKW+V5ePWEovqa9N6Sl2HKz+/7MO399QHmOIfeauyzdKhtxhX1uhvHbBgBL2loK4iP9cmVnXNXIY3+3o6Gkxdhap0moLYvFvyWTjX6W7qNxGllQzUZ3xzjUI2OH7G+lb4UXOw=
In-Reply-To: <84bd26ef0712121743p77080df0t48a2e68443611337@mail.gmail.com>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Per Jessen <per@computer.org>
Cc: linux-c-programming@vger.kernel.org

On Dec 12, 2007 10:43 PM, Dar=EDo Mariani <mariani.dario@gmail.com> wro=
te:

>
> On Dec 12, 2007 5:15 PM, Per Jessen <per@computer.org> wrote:
>
>
> > Per Jessen wrote:
> > > All,
> > >
> > > I'm trying to build a shared libary with a modified getaddrinfo()=
 from
> > > glibc.  getaddrinfo() sorts the results from DNS according to RFC=
3484,
> > > but this screws up round-robin load-balancing.
> > >
> > > Ian Jackson put a fix into ubuntus glibc 2.6.1, and this is what =
I'm
> > > trying to use.
> > >
> > > So, I've got glibc-2.6.1 from ubuntu all built, and I'm now tryin=
g to
> > > build my own mygetaddrinfo.so containing just the patched getaddr=
info().
> > > Has anyone attempted something similar, and if so, do you have an=
y hints
> > > for me?
> >
> > Alright, I realize this was perhaps a little unclear.  What I'm try=
ing
> > to achieve is actually quite simple:
> >
> > - to replace the normal getaddrinfo() routine from the default glib=
c
> > libary with my own version.
> >
> > My "own" version just happens to be 2000 lines of getaddrinfo from =
the
> > ubuntu glibc which was patched to fix the RFC3484 problem.  I'm jus=
t not
> > very keen on working my way through the 2000 lines and fixing thing=
s
> > such that it will compile outside of the complete glibc tree.
> >
> >
> > Per Jessen, Zurich
> >
> >
>
> There is a method to replace glibc functions, don't remember how exac=
tly but take a look at Transconnect (http://transconnect.sourceforge.ne=
t/ ) and this link: http://www.itworld.com/AppDev/1006/UIR000929interpo=
sers/pfindex.html.
>
>

There is a method to replace glibc functions, don't remember how
exactly but take a look at Transconnect
(http://transconnect.sourceforge.net/ ) and this link:
http://www.itworld.com/AppDev/1006/UIR000929interposers/pfindex.html.
-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
