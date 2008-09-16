From: "Xu Yang" <risingsunxy@googlemail.com>
Subject: Re: looking for a function
Date: Tue, 16 Sep 2008 16:14:53 +0200
Message-ID: <ab40e9c0809160714p4b2df3cfw2c72f03ac8b2d29e@mail.gmail.com>
References: <ab40e9c0809160626o1cc6e7en5e09650a1d04affe@mail.gmail.com>
	 <6a00c8d50809160701v2cf11b93ta86c30398cfe2e6b@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=yIMpt7epspHurTE710isH+KXsJcrgXUJYP4JOze5PLs=;
        b=rNruvP2s7ixDzUu9GUFQDnC3FPupbpeKGm0O3i30gcD/23a1WO+Zkt8sGztpIkx9CT
         a3KcU8wHPWX+YmPhVT1qP+X32UzVLqnH3Fn58a6fF8O+oF2QAOp6egEWGkyarkMx8bLC
         d4BMb1qfla+G0PoBNd5lqEy6l78nxCA3XUTkM=
In-Reply-To: <6a00c8d50809160701v2cf11b93ta86c30398cfe2e6b@mail.gmail.com>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Steve Graegert <graegerts@gmail.com>
Cc: linux-c-programming@vger.kernel.org

Hi Steve,

thanks for your reply :-)

I will try this. I am evaluating some scheduling algorithm, so I would
like to learn about how the threads migrate. That is why I am asking
for such kind of function.

thank for your help!

Bes regards,

Yang

2008/9/16, Steve Graegert <graegerts@gmail.com>:
> Xu Yang,
>
> On Linux sched_getcpu(3) comes to mind.  This function is not particu=
larly
> useful since the information returned by the function might not be co=
rrect
> at the point of its return as threads can be switched to other CPUs (=
read:
> cores) at anytime (although CPU/core switching can be quite expensive=
 due to
> cache line bouncing for instance)
>
> So, once the information has been obtained it might already be obsole=
te.
> Anyway, I hope that is what you're looking for.
>
>         \Steve
>
> --
>
> Steve Gr=E4gert
>
>
>
> On Tue, Sep 16, 2008 at 3:26 PM, Xu Yang <risingsunxy@googlemail.com>=
 wrote:
> >
> > Hi guys,
> >
> > I am looking for a function that can show me the current thread is
> > running on which cpu.
> >
> > e.g I am using pthread to write a multithreaded program, in each
> > thread I would like to insert such kind of function so that I can k=
now
> > on which cpu this thread is running on.
> >
> > which function should be used?
> >
> > thanks for the help!!
> >
> > best regards,
> >
> >
> >
> > Yang
> > --
> > To unsubscribe from this list: send the line "unsubscribe
> linux-c-programming" in
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at
> http://vger.kernel.org/majordomo-info.html
> >
>
>
--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
