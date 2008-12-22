From: XComp <xcomp@arcor.de>
Subject: Re: Problem with ucontext_t struct in signal handler
Date: Mon, 22 Dec 2008 09:31:22 -0800
Message-ID: <E490BF2D-4E27-4E5B-90F8-79D0D7819A14@arcor.de>
References: <40DE47A0-6538-4713-A44E-02984FAF5DC0@arcor.de> <18763.37381.997899.934804@cerise.gclements.plus.com>
Mime-Version: 1.0 (Apple Message framework v929.2)
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <18763.37381.997899.934804@cerise.gclements.plus.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"; delsp="yes"
To: Glynn Clements <glynn@gclements.plus.com>
Cc: linux-c-programming@vger.kernel.org

> XComp wrote:
>
>>> It seems likely that either the registers or the stack (wherever "i"
>>> is stored) is getting trashed. What is "i" in the cases where the  
>>> test
>>> fails?
>>
>> You find a sample output below. It seems to work in some cases. So  
>> you
>> might be right with the stack. But why? I mean... there is nothing
>> else but the for-loop. Or do I have the wrong idea of how the stack
>> works?! Can a stack be overflown by a simple for-loop? Is an  
>> alternate
>> signal stack needed? I thought it doesn't because the current stack
>> should be big enough.
>
> It isn't an issue with it overflowing. I was assuming that the loop
> terminated because "i" was getting set to a value > 1000000000, which
> implies it was being corrupted.
>
> Your output indicates that isn't actually the case; it appears that
> the branch back to the beginning of the loop is being skipped.
>
>>>> But it does not cancel after the first signal is raised.
>>>> I've found out that using the third parameter old_context for  
>>>> storing
>>>> the old context is the reason. But I don't know why.
>>>
>>> Note that the old_context parameter to the signal handler won't be
>>> pointing to any of your context "slots". When a signal occurs, the
>>> current context will be saved in a ucontext_t on the current  
>>> context's
>>> stack, and the old_context argument will point to that.
>>
>> I'm not sure whether I understood this correctly. What do you mean
>> with slots?
>
> Well, I was assuming that your code vaguely resembles the URL you
> gave:
>
> 	http://www.seas.upenn.edu/~cse381/context_demo.c
>
> By "slots", I was refering to:
>
> 	ucontext_t contexts[NUMCONTEXTS];   /* store our context info */
>
> OTOH, if the only contexts involved are these two:
>
>>> static ucontext_t thread_context;
>>> static ucontext_t scheduler_context;
>
> then those are the "slots".
>
> In any case, I don't think that you can rely upon the old_context
> being usable once you leave the signal handler. Even if you copy the
> contents, the uc_mcontext field may not be meaningful outside of the
> handler.

So you think that solving the problem in this way will lead me in a  
dead end?
But I am confused because of the fact that it works sometimes.  
Shouldn't it work the whole time or at no time only?

>
>>>> So I thought there might be a problem in the kernel. Am I right?
>>>
>>> I don't think so.
>>
>> Because of the fact that ucontext_t is part of the C library? I
>> thought that it might be a kernel issue because of the signal  
>> handling
>> which is implemented in the kernel.
>
> No, I'm just saying that a failure for context-switching to behave as
> you expect with regard to signal handlers isn't a reason to assume a
> bug. The standards are fairly vague about how signal handling and
> contexts interact.
>
> However, it's also true that the context handling is almost purely in
> user-space. The only system call involved is sigprocmask() to get the
> signal mask in getcontext() and set it in setcontext()/swapcontext().
>
>> So you see that the for-loops quits right after a signal was  
>> caught. I
>> am really in a dead end now. Do you see any parts of my code, which
>> might be wrong?
>
> Probably the line:
>
> 	thread_context = *((ucontext_t*) old_context);
>
> I wouldn't assume that you can do anything with old_context other than
> pass it to setcontext() or swapcontext() within the signal handler. In
> the absence of documentation to the contrary, I wouldn't assume that
> it can be stored and used outside of the handler.

I've tested it. If I use the old_context with setcontext() and go  
directly back to the thread in this case (the scheduler_function would  
be ignored), the behaviour is the same. Sometimes the loop finishes,  
sometimes not.

>
>
> It's quite possible that the context_t passed to a signal handler and
> a context created by calling getcontext() within a signal handler have
> some "magic" within the mcontext_t to unwind the signal handling
>
> I note that the code at the above URL doesn't use the old_context
> parameter at all.
>
> -- 
> Glynn Clements <glynn@gclements.plus.com>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-c- 
> programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

