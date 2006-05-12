From: "Steve Graegert" <graegerts@gmail.com>
Subject: Re: "double free or corruption" - how to solve this?
Date: Fri, 12 May 2006 10:45:17 +0200
Message-ID: <6a00c8d50605120145r3319e9c6hdb15c3630aeffadd@mail.gmail.com>
References: <75062f40605120111s2d27c8c0gb768c50b1ae34588@mail.gmail.com>
	 <20060512101927.136dd5df@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20060512101927.136dd5df@localhost.localdomain>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-c-programming@vger.kernel.org

On 5/12/06, wwp <subscript@free.fr> wrote:
> Hello Shriramana,
>
>
> On Fri, 12 May 2006 13:41:12 +0530 "Shriramana Sharma" <samjnaa@gmail.com> wrote:
>
> > One of my programs, which was working quite well till now, suddenly
> > gives me the error:
> >
> > *** glibc detected *** double free or corruption (top): 0x0808a338 ***
> > Aborted
> >
> > It is a pure C program compiled with GCC 4.02 -- I do not understand
> > why it does not work suddenly. Please tell me what the above error can
> > be.
>
> Would be nice to run it from gdb, in order to get the backtrace when it
> crashes. This should help you understand where and why :).

Additionally, you can try valgrind, which reports typical programming
errors like calling free() twice on the same object.

	\Steve
