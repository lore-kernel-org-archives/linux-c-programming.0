From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: (non-member) wait-notify mechanism in pthreads
Date: Mon, 28 Apr 2003 14:57:29 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <16045.13129.643228.647757@cerise.nosuchdomain.co.uk>
References: <3EACE858.8000700@hq.ntsp.nec.co.jp>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <3EACE858.8000700@hq.ntsp.nec.co.jp>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ronkhu@ntsp.nec.co.jp
Cc: linux-c-programming@vger.kernel.org


ronkhu wrote:

> Im not a member of this list but I've got a question:
> How does one go about implementing a wait-notify mechanism in pthreads 
> in lieu of the
> busy-waiting approach( which tends to be a cpu-hog)?

Mutexes, condition variables, or POSIX semaphores. See the "POSIX
Threads" section in the "libc" Info file for more details.

-- 
Glynn Clements <glynn.clements@virgin.net>
