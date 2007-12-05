From: "Brian McQueen" <mcqueenorama@gmail.com>
Subject: Re: Serialization in C
Date: Wed, 5 Dec 2007 11:18:46 -0800
Message-ID: <5b3fa8f0712051118k97447b7n6026c19b0d5a4c46@mail.gmail.com>
References: <4756DDE1.3020508@yahoo.co.in>
	 <6a00c8d50712050947i2ac24768k447c643de2ff7c95@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        bh=bnso4FDrn5khsuhUkIS406l6bwsb1GQby5ZvmGj/WI4=;
        b=Ynsuw0b4mHxnX+jCd2dexjY3c2LiC2qgK3smu1PnQfIRipcmum9r0wSoDwKxewr5f10RwSeKXUf019xT9Ucz755jqKdu4h2xg/VhMSUrVwqrQMMPiosBg+KbN6bTHeaAun8kxLbjahE1cdu1jdUt4iMjpaomQoe08uQC2dCmpRg=
In-Reply-To: <6a00c8d50712050947i2ac24768k447c643de2ff7c95@mail.gmail.com>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Steve Graegert <graegerts@gmail.com>
Cc: Dinesh <tdblinux@yahoo.co.in>, linux-c-programming@vger.kernel.org

Check out the xdr stuff from Sun's RPC stuff too.

On Dec 5, 2007 9:47 AM, Steve Graegert <graegerts@gmail.com> wrote:
> On Dec 5, 2007 6:20 PM, Dinesh <tdblinux@yahoo.co.in> wrote:
> >
> >  Hello,
> >
> >  I'm using graph and tree represented in linked list structure  in =
my C
> > program..
> >
> >  I have to save them while running the program to  retrieve later.
> >
> >  Is there any C libraries available to serialize  these structures.=
=2E.
> >
> >  My search became a vain attempt..  It will be fine if I get some
> > relevant information..
>
> I'd recommend taking a look at TPL which seems to be exactly what
> you're looking for.
> Get it from here: http://tpl.sourceforge.net
>
>         \Steve
>
> --
>
> Steve Gr=E4gert
> DigitalEther.de
>
> -
> To unsubscribe from this list: send the line "unsubscribe linux-c-pro=
gramming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
