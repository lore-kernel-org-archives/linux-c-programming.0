From: Elias Athanasopoulos <elathan@phys.uoa.gr>
Subject: Re: parse error
Date: Mon, 27 Sep 2004 01:51:55 +0300
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20040926225155.GA823@velka.phys.uoa.gr>
References: <20040926143252.39003.qmail@web52902.mail.yahoo.com> <20040925062900.GC1997@velka.phys.uoa.gr> <20040928061451.GC847@lug-owl.de>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20040928061451.GC847@lug-owl.de>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux prg <linux-c-programming@vger.kernel.org>

On Tue, Sep 28, 2004 at 08:14:51AM +0200, Jan-Benedict Glaw wrote:
> On Sat, 2004-09-25 09:29:01 +0300, Elias Athanasopoulos <elathan@phys.uoa.gr>
> wrote in message <20040925062900.GC1997@velka.phys.uoa.gr>:
> > On Sun, Sep 26, 2004 at 03:32:52PM +0100, Ankit Jain wrote:
> > > hi
> > > 
> > > i could not understand why compiler has put semi colon
> > > before else due t owhich this parse error comes....
> > > 
> > > thanks
> > >   
> > > #define exch(x,y) { int tmp; tmp=x; x=y; y=tmp; }
> > 
> > #define exch(x,y) do { int tmp; tmp=x; x=y; y=tmp; } while(0);
> 
> Nearly:-) Omit the last semicolon to make it work...

Right. :-) Actually after a lot of C Coding it's too difficult to
develop the habit to omit a last semicolon in one line of code. 

Regards,
-- 
University of Athens			I bet the human brain 
Physics Department				is a kludge --Marvin Minsky 

	
