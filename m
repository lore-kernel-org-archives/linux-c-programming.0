From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: Advanced Programming in the Unix Environment [Stevens]
Date: Sat, 31 Aug 2002 01:00:38 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <15728.1830.843937.21791@cerise.nosuchdomain.co.uk>
References: <20020830150451.GK25019@micromuse.com>
	<15727.48919.957629.115476@cerise.nosuchdomain.co.uk>
	<20020830213519.GA1372@micromuse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20020830213519.GA1372@micromuse.com>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ibraheem Umaru-Mohammed <iumarumo@eidosnet.co.uk>
Cc: linux-c-programming@vger.kernel.org


Ibraheem Umaru-Mohammed wrote:

> I see. I guess it can be done - but not very elegantly. dup2() is
> not the same as a close() and fcntl() because dup2() does the close and
> dup'licating atomically. I thought, the question was hinting at a 
> solution that wasn't atomic, but was a little more elegant than
> exhausting the lower-numbered descriptors below the descriptor we want
> to dup to. 

No. The only "equivalent" to dup2() is fcntl(F_DUPFD), which the
exercise specifically prohibits (otherwise it would be easy); no other
operations allow you to choose the resulting descriptor. If you can't
use either of those, you're limited to using tricks to force dup() to
use the desired descriptor.

> Presumably the issue isn't only the race condition on calling dup()
> after the call to close() in step 3, but I guess there is a potential problem
> if another thread opens a file descriptor in the "available window"
> before we do, and then close()'s it again _before_ we call dup() in step
> 4. So I guess there are multiple race conditions...A nasty exercise to do 
> so early in the book.

I presume that there was an implicit assumption that the program was
single threaded (the book doesn't cover threads at all).

Atomicity can't be "manufactured". If an operation needs to be atomic,
it has to be implemented by the kernel as an atomic operation.

-- 
Glynn Clements <glynn.clements@virgin.net>
