From: Scott <drmemory@3rivers.net>
Subject: Re: Into the Void
Date: Thu, 27 Jan 2005 10:01:05 -0700
Message-ID: <20050127170105.GB945@drmemory.local>
References: <OFCBCF8B9A.C4F17DCE-ON85256F95.004B650B@teal.com> <20050126161137.GA954@drmemory.local> <41F867F2.5000201@hq.ntsp.nec.co.jp>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <41F867F2.5000201@hq.ntsp.nec.co.jp>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

On Thu, Jan 27, 2005 at 12:02:58PM +0800, Ron Michael Khu wrote:
> extra typing?? r u using the term "type" in the same context as "data 
> type"(progamming language concept)?
> or "type" in the sense "keyboard typing"??

The latter. Jeff was telling me that I had to cast all of the
arguments to (void *), rather than, as you correctly said, the return
value. It doesn't seem to me (or more importantly, to the compiler)
that casting the ARGUMENTS is necessary?

> 
> *TAKE NOTE of the enclosing parenthesis:
> ((char*)SOMETHING)[index] ='\0'   

I did get it right later in my post, didn't I?
> >Or, I guess, to follow Ron's suggestion too:
> >
> >  ((char*) memcpy ((void *) *data_buf, (void *) bp, len)) [len] = '\0';

> 
> P.S. Hmmmm... u seem to have trouble understanding what a "void*" is.
> Void * could be anything.. thus u cant simply go around indexing a void*
> and treating it like an array without properly casting it...

I'm starting to grok it. I learned C back in the old days before there
was such a thing, and you could pretty much do anything you wanted
with any pointer. Could sure shoot yourself in the foot if you weren't
paying attention! Actually, I suppose back then memcpy and the like
returned char*. To test my understanding: I have to cast the function
because of the indexing operation. If I just ASSIGN the return value,
then the compiler does implicit type-casting for me. As in:

  char *bp;
  bp = memcpy(foo,bar,len);

Thanks for your help; I actually managed to get the program to compile
with no errors, but now am getting a segmentation fault which I can't
track down, so I'll probably be back to plague you folks some more!

Scott.
