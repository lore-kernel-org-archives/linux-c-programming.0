From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: Howto print off_t
Date: Thu, 27 Jun 2002 21:54:56 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <15643.31648.958108.45171@cerise.nosuchdomain.co.uk>
References: <Pine.LNX.4.33.0206262314360.10613-100000@talentix.dwd.de>
	<15642.44080.970456.988159@cerise.nosuchdomain.co.uk>
	<02062720242701.02594@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <02062720242701.02594@localhost.localdomain>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org


Andrew Edmondson wrote:

> > > What is the best way to print an off_t variable. On a 32 bit machine
> > > you can print it with %ld and on a 64 bit machine you need to print
> > > it with %lld.
> >
> > On a 64-bit machine, "long" is probably 64 bits.
> >
> > > Do all implementations know about %lld?
> >
> > No.
> 
> 
> Technically no, but c99 defines long long with the modifier ll in conjunction 
> with d, i, o, u, x, X so %lld is valid and should be portable.

Well, portable to all C99-conforming implementations, which is
basically the same thing as "not portable".

-- 
Glynn Clements <glynn.clements@virgin.net>
