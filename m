From: Jason Cooper <jcooper@nevernight.net>
Subject: Re: good pthreads example?
Date: Mon, 22 Sep 2003 09:14:23 -0400
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20030922131423.GA31065@nevernight.net>
References: <20030921153731.GB4142@nevernight.net> <3F6EF090.3060208@gsecone.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <3F6EF090.3060208@gsecone.com>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

Raghuveer (rvk@gsecone.com) scribbled:
> Hi Cooper,
> 
> I donno whether this basic example will be enough for ur requirement, 
> anyway here it is,
> You can try creating the thread like...
> void func(void);
> main()
> {
>    pthread_t tid;
>    retVal = pthread_create(&tid, NULL, (void *)func, (void *) NULL);
>    /* validate here with retVal */
> }
> 
> void
> func(void)
> {
>    pthread_detach(pthread_self()); /* if detached thread */
>    /* some printf */
> }
> 
> Pls ignore if this is very basic.
> 
> Regards
> -Raghu
> 
> 
> Jason Cooper wrote:
> 
> >Hey all,
> >
> >I've been learning pthreads for the past week or so.  So far, I've read
> >through the man pages, "Pthreads Programming" from O'Reilly, an old
> >copy of POSIX 4, and other various google searches.
> >
> >What I'm looking for is a good example (open source, of course) of 
> >pthreads in practice.  It doesn't matter whether it's boss/worker,
> >peer/peer, or assembly line.  I'm looking for practical examples to
> >learn from.  
> >
> >The O'Reilly book has a good ATM (cash machine, client/server) example,
> >but it isn't implemented in the real world...
> >
> >TIA,
> >
> >Cooper.
> >
> >PS - I know grepping through source will provide plenty of examples of
> >pthreads in action, but I wouldn't know if they are sound
> >implementations or not.

Thanks for the reply, unfortunately, what I'm looking for is a
recommendation of a good FS/OSS package to look at which implements
pthreads.  

As usual, my long-windedness confused the issue :)

Cooper.
