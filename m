From: Ibraheem Umaru-Mohammed <iumarumo@eidosnet.co.uk>
Subject: Re: Advanced Programming in the Unix Environment [Stevens]
Date: Fri, 30 Aug 2002 22:35:19 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20020830213519.GA1372@micromuse.com>
References: <20020830150451.GK25019@micromuse.com> <15727.48919.957629.115476@cerise.nosuchdomain.co.uk>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <15727.48919.957629.115476@cerise.nosuchdomain.co.uk>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Glynn Clements <glynn.clements@virgin.net>
Cc: linux-c-programming@vger.kernel.org

["Glynn Clements"="Glynn"]
Glynn >> 
Glynn >> Ibraheem Umaru-Mohammed wrote:
Glynn >> 
Glynn >> > So, I was going through some of the exercises in the said book. Came
Glynn >> > across Exercise 3.2, which states the following:
Glynn >> > 
Glynn >> >     ,----[ Exercise 3.2 ]
Glynn >> >     | Write your own function called dup2 that performs the same service
Glynn >> >     | as the dup2 function we described in Section 3.12, without calling
Glynn >> >     | the fcntl function. Be sure to handle errors correctly.
Glynn >> >     `----
Glynn >> > 
Glynn >> > Is there some sort of function that I don't know of that opens a file on a 
Glynn >> > specified file descriptor? If not, am not seeing how this can be done,
Glynn >> > since open returns the lowest available file descriptor - that is we
Glynn >> > can't specify the second argument to dup2 to an open function. I noticed
Glynn >> > fdopen(), but that associates a stream with an *existing* file
Glynn >> > descriptor. Can someone help [1] ?
Glynn >> 
Glynn >> Functions which allocate descriptors always (AFAIK) use the lowest
Glynn >> unused descriptor. Certainly, dup() behaves this way. So, you could
Glynn >> implement dup2() along the following lines:
Glynn >> 
Glynn >> 1. Call close() on the destination descriptor (the one specified by
Glynn >> the second argument), to ensure that it is available.
Glynn >> 
Glynn >> 2. Repeatedly call open("/dev/null", O_RDONLY), to "consume" any
Glynn >> lower-numbered descriptors. Stop when open() returns the desired
Glynn >> descriptor number. Keep track of the descriptors thus allocated, for
Glynn >> use in step 5.
Glynn >> 
Glynn >> 3. Call close() (again) on the destination descriptor.
Glynn >> 
Glynn >> 4. Call dup() on the source descriptor; this is guaranteed to return
Glynn >> the destination descriptor (notwithstanding potential race conditions
Glynn >> in a multi-threaded program).
Glynn >> 
Glynn >> 5. Call close() on the descriptors which were allocated in step 2,
Glynn >> apart from the last one, which is the destination descriptor.
Glynn >> 

I see. I guess it can be done - but not very elegantly. dup2() is
not the same as a close() and fcntl() because dup2() does the close and
dup'licating atomically. I thought, the question was hinting at a 
solution that wasn't atomic, but was a little more elegant than
exhausting the lower-numbered descriptors below the descriptor we want
to dup to. 

Presumably the issue isn't only the race condition on calling dup()
after the call to close() in step 3, but I guess there is a potential problem
if another thread opens a file descriptor in the "available window"
before we do, and then close()'s it again _before_ we call dup() in step
4. So I guess there are multiple race conditions...A nasty exercise to do 
so early in the book.

Anyway, thanks for the response.

Kindest regards,

				--ibz.

-- 
				Ibraheem Umaru-Mohammed 
					"ibz"
			umarumohammed (at) btinternet (dot) com
