From: "Steve Graegert" <graegerts@gmail.com>
Subject: Re: "double free or corruption" - how to solve this?
Date: Fri, 12 May 2006 23:53:13 +0200
Message-ID: <6a00c8d50605121453o2085e263v430a5c550b20cfde@mail.gmail.com>
References: <75062f40605120111s2d27c8c0gb768c50b1ae34588@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <75062f40605120111s2d27c8c0gb768c50b1ae34588@mail.gmail.com>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Shriramana Sharma <samjnaa@gmail.com>
Cc: linux-c-programming@vger.kernel.org

On 5/12/06, Shriramana Sharma <samjnaa@gmail.com> wrote:
> One of my programs, which was working quite well till now, suddenly
> gives me the error:
>
> *** glibc detected *** double free or corruption (top): 0x0808a338 ***
> Aborted
>
> It is a pure C program compiled with GCC 4.02 -- I do not understand
> why it does not work suddenly. Please tell me what the above error can
> be.

Shriramana,

From earlier posts at SLE I suppose you're running SuSE 10 (please
correct me if I am wrong) which uses a glibc version with an
integrated memory checker that can be turned of by setting

export MALLOC_CHECK_=0

If the program is simple you will not have to use dbg in order to
locate the offending code if any.  A combination of electric fence (as
James suggested) and valgrind should do it.  OTOH, if you're using
some libs and/or have switched to a different glibc version recently
you may have some lib mess.  Anyway, try to figure out what's wrong
with using the tools mentioned here and post the code if possible and
give gdb a try.

Bye

	\Steve
