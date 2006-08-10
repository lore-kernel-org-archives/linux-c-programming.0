From: Scott <drmemory@3rivers.net>
Subject: Re: how to implement routines that return general strings?
Date: Thu, 10 Aug 2006 11:12:38 -0600
Message-ID: <20060810171238.GC778@drmemory.local>
References: <Pine.LNX.4.64.0608101004460.13097@localhost.localdomain>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.64.0608101004460.13097@localhost.localdomain>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Robert P. J. Day" <rpjday@mindspring.com>, linux-c-programming@vger.kernel.org

On Thu, Aug 10, 2006 at 10:10:21AM -0400, Robert P. J. Day wrote:
> 
>   i'm about to design and implement a number of routines that return
> strings and, as far as i can tell, i have two general design choices.
> 
>   int		func(char* buf, int bufsiz) ;
>   char*		func() ;
> 

With the caveat that I haven't done any serious programming in C for
many years:  As I recall, I always used a protocol halfway between
these, as:

char *func(size_t bufsiz)
{
	char *retval = malloc (bufsiz);
	if (retval == NULL) return (NULL);
	/* whatever */
	return (retval);
}

My thinking being that the low-level memory allocation (or a static
buffer, if that is appropriate) is better handled in the lower-level
routine. NULL vs valid pointer was usually good enough, though I do
recall hacking something together with one of these to where a static
error-code was recorded in the routine if something went wrong, which
could be retrieved by sending a magic value for bufsiz:

char *foo = func(128);
if (foo == NULL) {
  errcode = (int) func(0xFFFF);
  .....
}

I suppose violating all precepts of proper coding, but it used to
work.....

Good luck, and I'd appreciate hearing what your final decision is!

Scott Swanson
