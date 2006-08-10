From: "David Rientjes" <rientjes@google.com>
Subject: Re: how to implement routines that return general strings?
Date: Thu, 10 Aug 2006 12:04:25 -0700
Message-ID: <9ec263480608101204t848a37u3e515f6c485a32ce@mail.google.com>
References: <Pine.LNX.4.64.0608101004460.13097@localhost.localdomain>
	 <20060810171238.GC778@drmemory.local>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20060810171238.GC778@drmemory.local>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Scott <drmemory@3rivers.net>
Cc: "Robert P. J. Day" <rpjday@mindspring.com>, linux-c-programming@vger.kernel.org

On 8/10/06, Scott <drmemory@3rivers.net> wrote:
> With the caveat that I haven't done any serious programming in C for
> many years:  As I recall, I always used a protocol halfway between
> these, as:
>
> char *func(size_t bufsiz)
> {
>         char *retval = malloc (bufsiz);
>         if (retval == NULL) return (NULL);
>         /* whatever */
>         return (retval);
> }
>

It looks like this would lead to memory leaks that would be difficult
to track down along a wide variety of code paths upon return.

I recommend the first style: int func(char *buf, size_t bufsize).  All
malloc and frees are then encouraged to sandwich this call.

David
