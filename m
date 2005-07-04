From: Steve Graegert <graegerts@gmail.com>
Subject: Re: fork: why to copy process to run new program?
Date: Mon, 4 Jul 2005 14:09:25 +0200
Message-ID: <6a00c8d50507040509691f9358@mail.gmail.com>
References: <daa27s$1kr$1@sea.gmane.org>
	 <17096.39828.119917.882703@gargle.gargle.HOWL>
	 <dab7ij$fs7$1@sea.gmane.org>
Reply-To: Steve Graegert <graegerts@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <dab7ij$fs7$1@sea.gmane.org>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Tom <tom.lobato@terra.com.br>
Cc: linux-c-programming@vger.kernel.org

Reply inline...

On 7/4/05, Tom <tom.lobato@terra.com.br> wrote:
> 
> Hello! :)
> 
> Thank you all answers.
> 
> 
> Glynn Clements wrote:
> 
> >
> > Tom wrote:
> >
> >>         Why, when a program needs to open another, have fork to copy all
> >>         the
> >> initial program just for 'exec' the another? Could'nt initial program
> >> just to "tell" the kernel for open the second program?
> >
> > I'm not sure what you're getting at.
> >
> > If you're asking why fork() and exec() can't be combined into a single
> > spawn() primitive, the answer is twofold:
> 
> sorry by not clear explanation of my question in prev article.
> but I think your answer help to kill my doubt (I say "help" cause I have to
> understand more the whole thing before, maybe reading some docs).
> 
> but my question could be done so: couldn't processA (example.. bash), when
> wants to run processB (example.. ls), just "tell" the kernel (using some
> system call, sure) "hey, please, open /bin/ls. Oh, do you need some env
> vars? ok, here is the list, PWD=/home/tom, VAR2=VALUE2, etc.. Oh do you
> want to know about file descriptos? ok, here is...".

This is what happens, at least conceptually.  To get a good grasp of
processes and memory management at the kernel level Bovet's and
Cesati's "Understanding the Linux Kernel" (O'Reilly) is highly
recommended.  If you're willing to read online David A. Rusling's "The
Linux Kernel" (http://www.tldp.org/LDP/tlk/tlk.html) is a good start.

> >
> > 1. A spawn() primitive would only handle the simplest cases. It's
> > quite common for there to be non-trivial code in the child branch
> > before the exec(), e.g. redirecting descriptors, changing signal
> > handling etc.
> >
> > 2. Even if you had a spawn() primitive, you would still need both
> > fork() and exec(), as it's not that uncommon to use them on their own.
> > So, a spawn() primitive would have to be in addition to the existing
> > primitives. This is extra complexity for little gain.
> >
> > On modern Unices with copy-on-write memory allocation, fork() is
> > relatively cheap, as it only has to copy the page tables, not the
> > actual memory.
> >
> > On older Unices, where fork() copied all of the process' memory, you
> > would use vfork() for the cases where there wasn't any significant
> > code in the child branch. Unlike fork(), vfork() doesn't copy the
> > process' memory. On Linux, vfork() doesn't copy the page tables
> > either.
> >
> > Because a child process created by vfork() shares its memory with the
> > parent, the consequences of modifying memory in the child are
> > undefined. That makes doing anything other than calling exec() or
> > _exit() (but not exit()) problematic. In particular, if exec() fails,
> > you can't recover.
> >
> 
> 
> Thank you
> Tom

Kind Regards

    \Steve
