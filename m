From: "Kelly Burkhart" <kelly@kkcsm.net>
Subject: Re: how to implement routines that return general strings?
Date: Fri, 11 Aug 2006 15:06:00 -0500
Message-ID: <fa1e4ce70608111306k5bdb728an4a4d72f642030306@mail.gmail.com>
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
To: linux-c-programming@vger.kernel.org

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

This code is to live in a shared library and you wish for it to be
portable then you may want to keep in mind the difficulties on some
platforms of allocating memory in one shared library and freeing in
another.  If this concern is relevant to you, the above must be paired
with void funcCleanup(char*).

This approach is also nice if the calling function can't know the
amount of memory necessary to allocate.

-K
