From: "Amit Dang" <amit_dang@intersolutions.stpn.soft.net>
Subject: Re: shift operator
Date: Tue, 28 Sep 2004 12:07:03 +0530
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <060f01c4a525$9428eea0$9736a8c0@ispl091>
References: <20040928052449.87960.qmail@web52910.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ankit Jain <ankitjain1580@yahoo.com>, Venkatesh Joshi <joshiv@cisco.com>
Cc: linux prg <linux-c-programming@vger.kernel.org>

I think I have the answer. Kindly correct me if am wrong.

Considering variable size to be 4 bytes containing 1. when it is shifted
left 31 times, 1 is moved on to the last bit i.e. 31st (starting from 0).
10000000000000000000000000000000
 Variable being a signed number it becomes negative. Now when you right
shift it 31 times it become
11111111111111111111111111111111
Now again shifting it right by 1 gives
11111111111111111111111111111111 which is representation of -1

But when it is shifted 30 times number repsesentation in bits is
01000000000000000000000000000000
now shifting it 30 times right gives
00000000000000000000000000000001
Shifting it right again gives
00000000000000000000000000000000 which is representaion of 0

It explains the results.
Hope this clears your doubt.
Amit Dang


----- Original Message -----
From: "Ankit Jain" <ankitjain1580@yahoo.com>
To: "Venkatesh Joshi" <joshiv@cisco.com>
Cc: "linux prg" <linux-c-programming@vger.kernel.org>
Sent: Tuesday, September 28, 2004 10:54 AM
Subject: Re: shift operator


> well i am sorry i forgot to tell the var size.
> in this case it is 2 byte int i.e signed
>
> if it is 4 byte then this would be the query
>
> i=1
> i<<=31
> i>>=31
> i>>=1
> what will be the value of i & why
> also
>
> i=1
> i<<=30
> i>>=30
> i>>=1
> what will be the value of i
>  --- Venkatesh Joshi <joshiv@cisco.com> wrote:
> > This depends on the type of variable that "i" is -
> > int, long etc.
> > because that would decide the number of bits in "i".
> >
> > It also depends on whether "i" is signed or
> > unsigned.
> >
> > read up K&R chapter 2 for more info.
> > ----- Original Message -----
> > From: "Ankit Jain" <ankitjain1580@yahoo.com>
> > To: "linux prg"
> > <linux-c-programming@vger.kernel.org>
> > Sent: Tuesday, September 28, 2004 10:18 AM
> > Subject: shift operator
> >
> >
> > > hi
> > >
> > > well if somebody can explain this
> > >
> > > i=1;
> > > i<<=15;
> > > i>>=15;
> > > i>>=1;
> > >
> > > also
> > >
> > > i=1;
> > > i<<=14;
> > > i>>=14;
> > > i>>=1;
> > >
> > > what should be the result of both and why?
> > >
> > > thanks
> > >
> > >
> >
> ________________________________________________________________________
> > > Yahoo! Messenger - Communicate instantly..."Ping"
> > > your friends today! Download Messenger Now
> > > http://uk.messenger.yahoo.com/download/index.html
> > > -
> > > To unsubscribe from this list: send the line
> > "unsubscribe
> > linux-c-programming" in
> > > the body of a message to majordomo@vger.kernel.org
> > > More majordomo info at
> > http://vger.kernel.org/majordomo-info.html
> >
> > -
> > To unsubscribe from this list: send the line
> > "unsubscribe linux-c-programming" in
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at
> > http://vger.kernel.org/majordomo-info.html
> >
>
> ________________________________________________________________________
> Yahoo! Messenger - Communicate instantly..."Ping"
> your friends today! Download Messenger Now
> http://uk.messenger.yahoo.com/download/index.html
> -
> To unsubscribe from this list: send the line "unsubscribe
linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

