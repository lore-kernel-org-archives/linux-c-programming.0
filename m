From: "J." <mailing-lists@xs4all.nl>
Subject: Re: obstack_alloc & _obstack_newchunk
Date: Thu, 24 Feb 2005 10:04:56 +0100 (CET)
Message-ID: <Pine.LNX.4.21.0502240946390.558-100000@hestia>
References: <d9def9db05022314495977f841@mail.gmail.com>
Reply-To: linux-c-programming@vger.kernel.org
Mime-Version: 1.0
In-Reply-To: <d9def9db05022314495977f841@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

On Wed, 23 Feb 2005, Rechberger Markus wrote:

> hmm what's the advantage of using the obstack_* functions? isn't
> malloc already enough? never saw it in an application actually so I'm
> just curious about it..
> 
> thanks
> Markus

Actually I was asking myself the exact same thing after I read that the
GCC compiler uses this memory allocation strategy. If you google for
obstack you will find a lot of programs using the obstack libs.

From what I understand upon till now, and please correct me if I am wrong:
obstack is a data stack that is used to create pooled memory allocation.
Memory allocation and deallocation, is said to be much faster because it's
done a pool at a time. Error-handling pools can be preallocated so that
programs can make good recovery's if no more regular memory is available.
The lifespan of a memory pool can be crontrolled like the way the apache
webserver does e.g. `Apache Portable Runtime'. 

For me personally I don't think I will use this strategy's because I
simply don't need it, but it is still interesting to look into it
because it requires me to actually think about how memory allocation works
and what the options are.

J.

> > On Wed, 23 Feb 2005, Mariano Moreyra wrote:
> > > Hi J.
> > >
> > > You need to init your obstack before using it
> > > Also, you need to declare this before calling obstack_init()
> > >
> > > #define obstack_chunk_alloc malloc
> > > #define obstack_chunk_free free
> > >
> > > So, your code would look like this:
> > 
> > <CUT>
> > ...
> > </CUT>
> > 
> > Thank you for the complete answer.. !!
> > 
> > Cheers, J.
> > -
--
http://www.rdrs.net/

