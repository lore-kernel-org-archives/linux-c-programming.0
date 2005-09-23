From: HIToC <hitoc_mail@yahoo.it>
Subject: Re: How to use /dev/random
Date: Fri, 23 Sep 2005 11:16:54 +0200
Message-ID: <200509231111.39157.hitoc_mail@yahoo.it>
References: <200509221111.07711.hitoc_mail@yahoo.it> <6a00c8d5050922025348a449a5@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <6a00c8d5050922025348a449a5@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Steve Graegert <graegerts@gmail.com>
Cc: linux-c-programming@vger.kernel.org

On Thursday 22 September 2005 11:53, Steve Graegert wrote:
> You can also read a number of random bytes from /dev/(u)random with dd:
>
>         dd if=/dev/urandom of=/tmp/randnums bs=1 count=500
>
> This reads a sequence of 500 bytes from /dev/urandom and writes them
> to /tmp/randnums.

I have read that the problem of /dev/random is mainly on boot, when there
are few iteration from the user. For this reason is useful first save on a
temporary_random file a 512 bytes block on shutdown of the system.
Then on the new booting, to put the 512 bytes saved on the
temporary_random file in the /dev/random device.
With this procedure we have the random device ready
afterwards boot.

I have two questions:
1) the size of /dev/random is 512 bytes, or the number of bytes
	increase over the new iteration of the user (like mouse clicks,
	key strokes, ecc..)?
2) Where can I put the scripts to read the random number on shutdown
	or to write the previously saved bytes, on boot?


Thanks for every suggestion.
HIToC

-- 
With regards,


					HIToC
					hitoc_mail@yahoo.it
