From: James Stevenson <james@stev.org>
Subject: Re: getting ebp from another process ?
Date: 03 Oct 2002 19:05:19 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <1033668319.2139.10.camel@god.stev.org>
References: <20020930195953.DB7C54001@sitemail.everyone.net>
	<1033418323.1854.7.camel@god.stev.org>  <20021001214222.GA1672@cam.ac.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20021001214222.GA1672@cam.ac.uk>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: sos22@cam.ac.uk
Cc: xjnfx@doityourself.com, linux-c-programming@vger.kernel.org

On Tue, 2002-10-01 at 22:42, sos22@cam.ac.uk wrote:
> > > im a little confused by what you mean from another process,
> > > meaning like - im not sure if you want it from a third process, or
> > > just mean another process from the debuggers point of view, but
> > > wouldnt unsigned long foo(void) { __asm__("movl %ebp, %eax"); }
> > > work?
> > its a little more complicated than that.
> > i am actually debugging kernel things in
> > http://user-mode-linux.sf.net/
> > 
> > which has a confusing method of working with
> > debuggers and does not keep a good copy of ebp around
> > but the process is already attached by a so called
> > debugger but really a system call interceptor.
> I'm not quite sure what you're trying to do anymore, but I've assumed
> in the below that you have a process running under the UML, let's say
> X, which corresponds to a process running under the host kernel, let's
> say Y, and you want to extract ebp from process X into a process
> running on the host kernel, Z say.  Now, the problem is that Z cannot
> attach to Y because the UML kernel process is already attached to it.

i am not to sure why i am even doing it anymore.
it was to get a  stack trace from uml when really bad things happen
with the tracing thread.
 
> However, you probably don't need to do that: Run a debugger under the
> UML, and then have it attach to X.  There's nothing attached to X, so
> that should succeed.  The debugger can then communicate with Z in any
> of the usual ways (uml_mconsole, inet domain sockets, ...), and send
> it the ebp of the target process.

by the time i need the info uml and it debugger has fallen over.
its normally caused by bad problems from the uml and the uml tracing
thread. The reson for the ebp from a process is so its much faster
toget a stack dump and i dont need todo it by hand.

> It's a little long winded, and it would only work if X is a userspace
> process under the UML and not one of the kernel threads, but it's the
> simplest that comes to mind.
> 
> Of course, if you're trying to track down a kernel bug, you can just
> gdb the kernel processes (almost) directly using the ptrace proxy - I
> think there are some fairly good instructions on the UML project page.
> (Note: I haven't tried this, so I might be completely wrong.)

yes its works pritty well for most kernel bugs but not in the layer
when uml is going its wired task switching and syscall doging stuff.

thanks
	James







