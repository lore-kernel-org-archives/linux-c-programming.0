From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: Advanced Programming in the Unix Environment [Stevens]
Date: Fri, 30 Aug 2002 19:53:11 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <15727.48919.957629.115476@cerise.nosuchdomain.co.uk>
References: <20020830150451.GK25019@micromuse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20020830150451.GK25019@micromuse.com>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ibraheem Umaru-Mohammed <iumarumo@eidosnet.co.uk>
Cc: linux-c-programming@vger.kernel.org


Ibraheem Umaru-Mohammed wrote:

> So, I was going through some of the exercises in the said book. Came
> across Exercise 3.2, which states the following:
> 
>     ,----[ Exercise 3.2 ]
>     | Write your own function called dup2 that performs the same service
>     | as the dup2 function we described in Section 3.12, without calling
>     | the fcntl function. Be sure to handle errors correctly.
>     `----
> 
> Is there some sort of function that I don't know of that opens a file on a 
> specified file descriptor? If not, am not seeing how this can be done,
> since open returns the lowest available file descriptor - that is we
> can't specify the second argument to dup2 to an open function. I noticed
> fdopen(), but that associates a stream with an *existing* file
> descriptor. Can someone help [1] ?

Functions which allocate descriptors always (AFAIK) use the lowest
unused descriptor. Certainly, dup() behaves this way. So, you could
implement dup2() along the following lines:

1. Call close() on the destination descriptor (the one specified by
the second argument), to ensure that it is available.

2. Repeatedly call open("/dev/null", O_RDONLY), to "consume" any
lower-numbered descriptors. Stop when open() returns the desired
descriptor number. Keep track of the descriptors thus allocated, for
use in step 5.

3. Call close() (again) on the destination descriptor.

4. Call dup() on the source descriptor; this is guaranteed to return
the destination descriptor (notwithstanding potential race conditions
in a multi-threaded program).

5. Call close() on the descriptors which were allocated in step 2,
apart from the last one, which is the destination descriptor.

-- 
Glynn Clements <glynn.clements@virgin.net>
