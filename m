From: Ibraheem Umaru-Mohammed <umarumohammed@btinternet.com>
Subject: Re: How does malloc tell the kernel to allocate more memory?
Date: Sun, 8 Dec 2002 19:42:41 +0000
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20021208194241.GA15936@btinternet.com>
References: <000301c29eea$3107dd10$032a1c43@joe> <20021208192914.GA4262@bandit.kista.gajba.net>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20021208192914.GA4262@bandit.kista.gajba.net>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux C Programming <linux-c-programming@vger.kernel.org>

* Boris Bezlaj <boris@bandit.kista.gajba.net> [2002-12-08 19:33]:
> On Sun, Dec 08, 2002 at 12:46:57PM -0600, Joseph D. Wagner wrote:
> > I'm trying to write a tracer on memory allocation, and I'm having a little
> > trouble figuring this out.
> 
> You sure this has not been done before?
> > 
> > At some point, malloc has to call the kernel to tell it to allocate more
> > memory for this user process, right?  I can't figure out which function
> > malloc calls, or where in the code (line number) it's called.
> 
> I dont know much about memory management, but there is some documentation
> at lkdp.tk  ..you might want to check it out, although AFAIK it's not finished yet..
> 

man {sbrk|brk}?

			--ibz
-- 
