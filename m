From: Micha Feigin <michf@post.tau.ac.il>
Subject: Re: Fwd: constant in C
Date: Fri, 24 Sep 2004 12:17:18 +0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20040924101717.GC9014@luna.mooo.com>
References: <20040924033646.62233.qmail@web52901.mail.yahoo.com> <a7ed6e3304092400165ad53b8c@mail.gmail.com> <4f2e7cd304092400315c83fd1e@mail.gmail.com>
	 <4f2e7cd304092400333259f597@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4f2e7cd304092400333259f597@mail.gmail.com>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

On Fri, Sep 24, 2004 at 01:03:17PM +0530, Uday Karan wrote:
> Sorry didn't CC to list.
> 
> > Therefore you cannot use sizeof(const),  &const etc.
> 
> sizeof (CONST) can be done and would return the size of an integral
> type that would be able to hold that value, could be 4 for ints or 8
> for long ints, if none of these can take up the value (because you're

Actually the size of long int is 4 and the size of short is 2, the size
of int depends on the platform. With the old 16bit platforms (if you
can still find them ;-) it was 2 and with 32 bit machines its 4.

Int was supposed to be a word, but on 64bit machines that is not longer
stable.

with 64bits, a pointer is of size 8, but int and long can be either 4
or 8 and sometimes there is long long.

have look at http://en.wikipedia.org/wiki/64-bit.

> substitutive constant is insanely large), the compiler would usually
> give out a warning (if truncating) or an error straightaway.
> 
> - Uday
> -
> To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>  
>  +++++++++++++++++++++++++++++++++++++++++++
>  This Mail Was Scanned By Mail-seCure System
>  at the Tel-Aviv University CC.
> 
