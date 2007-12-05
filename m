From: "Steve Graegert" <graegerts@gmail.com>
Subject: Re: Serialization in C
Date: Wed, 5 Dec 2007 20:47:32 +0100
Message-ID: <6a00c8d50712051147t38dbafw335bb4744823f31@mail.gmail.com>
References: <4756DDE1.3020508@yahoo.co.in>
	 <6a00c8d50712050947i2ac24768k447c643de2ff7c95@mail.gmail.com>
	 <5b3fa8f0712051118k97447b7n6026c19b0d5a4c46@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        bh=3ZXHWMESL6BZ9KDYJK0XdZEdUrkuOeRGN9PujDIV/VE=;
        b=sEI4cjXnDcAUvHrJAGaRFqVlv1aQrm57WsHmhZgpbExA3/W4n3IS35kA/Fgj8lGqKXXy97SkoqNKCB0J/HzoipcF6BdvABRFzjVE3E95PSyAa6itXDcNUdDnBC4daXTPnC3vNfQdvlt1Y69ff0scsbpjNlgUqmOQR6JOIsnDEuw=
In-Reply-To: <5b3fa8f0712051118k97447b7n6026c19b0d5a4c46@mail.gmail.com>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Brian McQueen <mcqueenorama@gmail.com>
Cc: Dinesh <tdblinux@yahoo.co.in>, linux-c-programming@vger.kernel.org

On Dec 5, 2007 8:18 PM, Brian McQueen <mcqueenorama@gmail.com> wrote:
> Check out the xdr stuff from Sun's RPC stuff too.

XDR comes to mind first, but it can be very tedious, since you
sometimes have be carefully select between the xdr_reference and
xdr_pointer primitives due to the fact that one operates on
XDR-translated data while the other does not.

Additionally, the developer should get intimately familiar with XDR
first to make use of it because the data structures must be described
properly and many self-written subroutines are needed to facilitate
XDR.  TPL is very intuitive to use and also supports converting the
data to XML back and forth.

Unless you do not need to transfer data between architectures, TPL
wins over XDR.  If native binary representation is not an option XDR
is the way to go.

        \Steve

PS: Please, do not top-post.  Thanks.


> On Dec 5, 2007 9:47 AM, Steve Graegert <graegerts@gmail.com> wrote:
> > On Dec 5, 2007 6:20 PM, Dinesh <tdblinux@yahoo.co.in> wrote:
> > >
> > >  Hello,
> > >
> > >  I'm using graph and tree represented in linked list structure  i=
n my C
> > > program..
> > >
> > >  I have to save them while running the program to  retrieve later=
=2E
> > >
> > >  Is there any C libraries available to serialize  these structure=
s...
> > >
> > >  My search became a vain attempt..  It will be fine if I get some
> > > relevant information..
> >
> > I'd recommend taking a look at TPL which seems to be exactly what
> > you're looking for.
> > Get it from here: http://tpl.sourceforge.net
> >
> >         \Steve
> >
> > --
> >
> > Steve Gr=E4gert
> > DigitalEther.de
>
-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
