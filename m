From: Jason Cooper <jcooper@nevernight.net>
Subject: Re: good pthreads example?
Date: Wed, 24 Sep 2003 10:20:38 -0400
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20030924142038.GA23791@nevernight.net>
References: <8EA11405E59BD611BA7100104B93C26002254BE0@exdel01.del.mgsl.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <8EA11405E59BD611BA7100104B93C26002254BE0@exdel01.del.mgsl.com>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

Harmeet Uppal (Harmeet_Uppal@KeaneIndia.com) scribbled:
> Hi Jason,
> 
> I would suggest you start with Thread Time a book from HP Press and do
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
> > >I've been learning pthreads for the past week or so.  So far, I've read
> > >through the man pages, "Pthreads Programming" from O'Reilly, an old
> > >copy of POSIX 4, and other various google searches.
> > >
> > >What I'm looking for is a good example (open source, of course) of 
> > >pthreads in practice.  It doesn't matter whether it's boss/worker,
> > >peer/peer, or assembly line.  I'm looking for practical examples to
> > >learn from.  
> > >
> > >The O'Reilly book has a good ATM (cash machine, client/server) example,
> > >but it isn't implemented in the real world...
> > >
> > >TIA,
> > >
> > >Cooper.
> > >
> > >PS - I know grepping through source will provide plenty of examples of
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

Perhaps apache or postfix?  I don't use either, so I'll have to d'l them
later...

Cooper.
