From: Ibraheem Umaru-Mohammed <iumarumo@eidosnet.co.uk>
Subject: Advanced Programming in the Unix Environment [Stevens]
Date: Fri, 30 Aug 2002 16:04:51 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20020830150451.GK25019@micromuse.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

So, I was going through some of the exercises in the said book. Came
across Exercise 3.2, which states the following:

    ,----[ Exercise 3.2 ]
    | Write your own function called dup2 that performs the same service
    | as the dup2 function we described in Section 3.12, without calling
    | the fcntl function. Be sure to handle errors correctly.
    `----

Is there some sort of function that I don't know of that opens a file on a 
specified file descriptor? If not, am not seeing how this can be done,
since open returns the lowest available file descriptor - that is we
can't specify the second argument to dup2 to an open function. I noticed
fdopen(), but that associates a stream with an *existing* file
descriptor. Can someone help [1] ?

Kindest regards,

				--ibz.

[1] - The answer is not at the back of the book. :(

-- 
				Ibraheem Umaru-Mohammed 
					"ibz"
			umarumohammed (at) btinternet (dot) com
