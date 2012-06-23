From: Vladimir Murzin <murzin.v@gmail.com>
Subject: Re: nanosleep over multiple processes
Date: Sat, 23 Jun 2012 17:11:28 +0400
Message-ID: <20120623131126.GA2650@pinguin>
References: <CAA6iF_7rzg8o0C5kbNgcRYmgj=t+0As-YQzP7Ddbmaz6yMAqLA@mail.gmail.com>
 <20120622055356.GA15833@opentech.at>
 <CAA6iF_60u5dbOm7aQF30iWbsFHMj4=aPu8Ekg=McSF8QJ8yyQg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-type:content-disposition:in-reply-to:user-agent;
        bh=FECVbqaRHZXYG2SvZr0PEhwQHG+q+lALoUHdP1gmugM=;
        b=vteohXH7y15zqCAlvDAd2NTEVo7NZN1e+WNXNTUhMSed3UuLthYku6Lmq/FyK3l9i0
         22hjjEb+cr9y2bkhjG+1hYd2GgWaQas+tACNDOV1m1A3sMg2Y7hPOWIF2RNzHjvbzbIm
         IVRpZ25hLgvfCd/Q/zh3REln3Dabsw37sSImFBe/e0OCCGc8D+0mFgo3O3tKU38E1Pnr
         7BNdDWtYMHGuOLchufh6Y5gIzH4KSX+lOD3dk8w3Gz1yn1Hfhx1FjjH8auiCjy2v0IlP
         IDnJTk23IVMjzxbslTksiZggWM9+vBjH1iV/YIMe6M3ZF+Hj4hwz4OXK+R4HIk8nhjpB
         mmXA==
Content-Disposition: inline
In-Reply-To: <CAA6iF_60u5dbOm7aQF30iWbsFHMj4=aPu8Ekg=McSF8QJ8yyQg@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Randi Botse <nightdecoder@gmail.com>
Cc: Nicholas Mc Guire <der.herr@hofr.at>, linux-c-programming <linux-c-programming@vger.kernel.org>

On Fri, Jun 22, 2012 at 03:38:14PM +0700, Randi Botse wrote:
> Hi Nicholas,
> 
> So sorry, I was mean clock_gettime() not nanosleep(), my bad. The
> unique ID must be different in all proces, so no duplicated ID in
> entire process.
> 
> And here the ID should be generated:
> 
> struct timespec ts;
> clock_gettime(CLOCK_REALTIME, &ts);
> unsigned long uid = ts.tv_sec + ts.tv_nsec;
> 
> Does your reply also covering this?
> 
> Thanks,
> 
> On 6/22/12, Nicholas Mc Guire <der.herr@hofr.at> wrote:
> > On Fri, 22 Jun 2012, Randi Botse wrote:
> >
> >> Hi All,
> >>
> >> In nanosecond precision, if I have multiple processes run nanosleep(),
> >> how possbile they will get the same struct timespec value? both the
> >> tv_sec and tv_nsec value. Of course the tv_sec (second) is most
> >> possible, but how about the tv_nsec (nanosecond)?
> >>
> >> I wan't to create a simple stupid unique id or something like that,
> >> but with without too much effort. The unique id will be tv_sec +
> >> tv_nsec.
> >>
> > while it is highly unlikely that they get the same tv_nsec it is not
> > impossible so it will not make for a good ID. The problem with such
> > an ID is simply that if you have a collision then it will be very hard
> > to debug this situation. Even worse this solution would not be portable
> > at all - it even could work on one box (e.g. a UP system where the
> > processes never execute physically concurrent) and fail on a MP in
> > rare cases - portability to other OS would also be very shaky at the
> > concept level (even if the API were pure POSIX).
> >
> > there are unique objects available to any process, pid, address (if
> > address space randomization is enabled), /dev/random|/dev/urandom
> > fetching a long long from there is far more reliable than generating
> > a shaky long long from tv_nsecs (where the upper bits will almost
> > surely match).
> >
> > let us know what you need it for and it is easiert to give some
> > suggestions.
> >
> > thx!
> > hofrat
> >
> >
> --
> To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

Hi

Why don't you use universally unique identifier (UUID)[1]?
I was invented and standardized to deal with cases like yours.
You can find more information how to use UUID in your software form
man uuid [2]

[1] http://en.wikipedia.org/wiki/Universally_unique_identifier
[2] http://linux.die.net/man/3/uuid

Best wishes
Vladimir Murzin
