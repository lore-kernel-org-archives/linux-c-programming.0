From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: sigaction() handler question
Date: Sat, 1 Mar 2003 19:42:57 +0000
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <15969.3393.564727.128046@cerise.nosuchdomain.co.uk>
References: <20030301153443.GB27794@lug-owl.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20030301153443.GB27794@lug-owl.de>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Cc: linux-c-programming@vger.kernel.org


Jan-Benedict Glaw wrote:

> I've added a handler function for a SEGSEGV signal. I'm now that far
> that I do know where (from the third void * parameter to the handling
> function) to find the entry to the stack. So, for i386, I now can climb
> down the stack printing out the stack trace.
> 
> Unfortunately, the void * (it is mentioned to be a (ucontext_t *) in
> reality...) isn't *that* big help. The stack (with "stack" I here mean
> that pointer which points to some stack frame's next stack pointer) is
> (on i386) 11*sizeof(long) away.

11? Looking at sys/ucontext.h, that would be:

	((ucontext_t *)ptr)->uc_mcontext.gregs[ESP];

whereas you probably want:

	((ucontext_t *)ptr)->uc_mcontext.gregs[EBP];

which is the previous entry, i.e. ((int *)ptr)[10].

> To the worse, I've not really found
> helpful manpages or example sources on how to "really" walk down the
> stack (from a segsegv handler function).

Each stack frame is of the form:

	...
	<local variables>
EBP->	saved EBP
	saved EIP
	<arguments>
	...

where memory addresses increase downwards.

The saved EBP for the topmost stack frame is NULL.

So, walking the linked list of stack frames should be a matter of:

static void handler(int sig, siginfo_t *si, void *ptr)
{
	ucontext_t *uc = ptr;
	void **ebp;
	for (ebp = (void **) uc->uc_mcontext.gregs[EBP]; ebp; ebp = ebp[0])
	{
		void *saved_eip = ebp[1];
		/* arguments are at &ebp[2] and above */
		/* local variables are below ebp */
	}
	...
}

A couple of caveats:

1. If any of the functions in the call chain were compiled with
-fomit-frame-pointer, it won't generate usable stack frames, and the
above code will probably crash. To prevent this, you would need to
"validate" each stack frame by checking that the saved EBP and EIP
values are plausible.

2. If SIGSEGV is raised, arbitrary portions of the process' memory
could be trashed. Don't expect that library functions will work
correctly (or at all), or that static variables will contain correct
values.

-- 
Glynn Clements <glynn.clements@virgin.net>
