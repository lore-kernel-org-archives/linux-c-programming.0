From: Ankit Jain <ankitjain1580@yahoo.com>
Subject: Re: shift operator
Date: Tue, 28 Sep 2004 06:24:49 +0100 (BST)
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20040928052449.87960.qmail@web52910.mail.yahoo.com>
References: <01c401c4a518$68c33c00$dc846840@apac.cisco.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <01c401c4a518$68c33c00$dc846840@apac.cisco.com>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Venkatesh Joshi <joshiv@cisco.com>
Cc: linux prg <linux-c-programming@vger.kernel.org>

well i am sorry i forgot to tell the var size.
in this case it is 2 byte int i.e signed

if it is 4 byte then this would be the query

i=1
i<<=31
i>>=31
i>>=1
what will be the value of i & why
also

i=1
i<<=30
i>>=30
i>>=1
what will be the value of i 
 --- Venkatesh Joshi <joshiv@cisco.com> wrote: 
> This depends on the type of variable that "i" is -
> int, long etc.
> because that would decide the number of bits in "i".
> 
> It also depends on whether "i" is signed or
> unsigned.
> 
> read up K&R chapter 2 for more info.
> ----- Original Message -----
> From: "Ankit Jain" <ankitjain1580@yahoo.com>
> To: "linux prg"
> <linux-c-programming@vger.kernel.org>
> Sent: Tuesday, September 28, 2004 10:18 AM
> Subject: shift operator
> 
> 
> > hi
> >
> > well if somebody can explain this
> >
> > i=1;
> > i<<=15;
> > i>>=15;
> > i>>=1;
> >
> > also
> >
> > i=1;
> > i<<=14;
> > i>>=14;
> > i>>=1;
> >
> > what should be the result of both and why?
> >
> > thanks
> >
> >
>
________________________________________________________________________
> > Yahoo! Messenger - Communicate instantly..."Ping"
> > your friends today! Download Messenger Now
> > http://uk.messenger.yahoo.com/download/index.html
> > -
> > To unsubscribe from this list: send the line
> "unsubscribe
> linux-c-programming" in
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at 
> http://vger.kernel.org/majordomo-info.html
> 
> -
> To unsubscribe from this list: send the line
> "unsubscribe linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at 
> http://vger.kernel.org/majordomo-info.html
>  

________________________________________________________________________
Yahoo! Messenger - Communicate instantly..."Ping" 
your friends today! Download Messenger Now 
http://uk.messenger.yahoo.com/download/index.html
