From: Steve Graegert <graegerts@gmail.com>
Subject: Re: a good list for application development issues?
Date: Sat, 12 Nov 2005 21:31:56 +0100
Message-ID: <6a00c8d50511121231h6ff72ce4w24bca016dd46216@mail.gmail.com>
References: <Pine.LNX.4.63.0511111159230.12165@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.63.0511111159230.12165@localhost.localdomain>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: C programming list <linux-c-programming@vger.kernel.org>

On 11/11/05, Robert P. J. Day <rpjday@mindspring.com> wrote:
>
>   any recommendations for a list related to application development in
> C?  specifically, design of multi-application systems where
> independent apps might be competing for system resources like
> peripherals, etc.  (sounds a lot like the linux kernel, doesn't it?)

Yes, indeed it sounds like a kernel, but I suppose you're looking for
solutions to common problems in computer programming and algorithm
design.  Some of the classic ones are known as "the sleeping barber
problem" or the "dining philosophers problem".  Every serious text
book on algorithms and software design should cover them.  For a
general discussion related to this topic I can recomment the NIST's
"Dictionary of Algorithms and Data Structures" (DADS) that provides
tons of information and links about the ones just mentioned and lots
of others like priority queues and the like.

	\Steve
