From: Tom <tom.lobato@terra.com.br>
Subject: Re: fork: why to copy process to run new program?
Date: Mon, 04 Jul 2005 08:46:26 -0300
Message-ID: <dab7ij$fs7$1@sea.gmane.org>
References: <daa27s$1kr$1@sea.gmane.org> <17096.39828.119917.882703@gargle.gargle.HOWL>
Mime-Version: 1.0
Content-Transfer-Encoding: 7Bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org


Hello! :)

Thank you all answers.


Glynn Clements wrote:

> 
> Tom wrote:
> 
>>         Why, when a program needs to open another, have fork to copy all
>>         the
>> initial program just for 'exec' the another? Could'nt initial program
>> just to "tell" the kernel for open the second program?
> 
> I'm not sure what you're getting at.
> 
> If you're asking why fork() and exec() can't be combined into a single
> spawn() primitive, the answer is twofold:

sorry by not clear explanation of my question in prev article.
but I think your answer help to kill my doubt (I say "help" cause I have to
understand more the whole thing before, maybe reading some docs).

but my question could be done so: couldn't processA (example.. bash), when
wants to run processB (example.. ls), just "tell" the kernel (using some
system call, sure) "hey, please, open /bin/ls. Oh, do you need some env
vars? ok, here is the list, PWD=/home/tom, VAR2=VALUE2, etc.. Oh do you
want to know about file descriptos? ok, here is...".

> 
> 1. A spawn() primitive would only handle the simplest cases. It's
> quite common for there to be non-trivial code in the child branch
> before the exec(), e.g. redirecting descriptors, changing signal
> handling etc.
> 
> 2. Even if you had a spawn() primitive, you would still need both
> fork() and exec(), as it's not that uncommon to use them on their own.
> So, a spawn() primitive would have to be in addition to the existing
> primitives. This is extra complexity for little gain.
> 
> On modern Unices with copy-on-write memory allocation, fork() is
> relatively cheap, as it only has to copy the page tables, not the
> actual memory.
> 
> On older Unices, where fork() copied all of the process' memory, you
> would use vfork() for the cases where there wasn't any significant
> code in the child branch. Unlike fork(), vfork() doesn't copy the
> process' memory. On Linux, vfork() doesn't copy the page tables
> either.
> 
> Because a child process created by vfork() shares its memory with the
> parent, the consequences of modifying memory in the child are
> undefined. That makes doing anything other than calling exec() or
> _exit() (but not exit()) problematic. In particular, if exec() fails,
> you can't recover.
> 


Thank you
Tom

