From: Celelibi <celelibi@gmail.com>
Subject: Re: passing arguments to pthreads
Date: Fri, 14 Mar 2014 20:22:40 +0100
Message-ID: <CAJR2zJ8HUX2UcRZWG+-JhAb3LQYHqxh-NBq56P4YyEZNFUkc9A@mail.gmail.com>
References: <53231B89.2020104@gmail.com>
	<CAJR2zJ_eiJPAHjKy1=5HuG7gBO3qFi8b+ggnpbCsv4n5UBUu7Q@mail.gmail.com>
	<53233CC8.8020701@gmail.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=CWIZd1xUNJ7t1q47VL5Yoyq09hKrhDvO0rmyMsUoog4=;
        b=k7l46XxtZQUnPtmvN01viy7PSD2tIlvk8V5B3tGeL3KMIeORXwI7/y81ol/ARDTu0G
         tM8VbGZSY4QYpqIfUWu+5S9j41+u6R5qIJFVPBekFdC9ORflesAreEzmL+4Qv7RIRH54
         1Aj+VYDflaIxOCY4/uzK5+URJGQFt8HLidH5+EjPSsy4yaoiOKHYUWfSKstw8lJixnDY
         R4VPZ4rS1JAlFAq25nx2/oab0AjJxXrDeMEofGw1D5Y7vIBKWmJyfxvMCZJXyweXaPne
         Lbrb3LMeJRn66jRYXl6dRlgU9lbHjTL/w+Fd7fDJWfv3TBDWiC2kXvjosH0HMhOiu4I/
         N9oQ==
In-Reply-To: <53233CC8.8020701@gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Daniel Hilst Selli <danielhilst@gmail.com>
Cc: linux-c-programming@vger.kernel.org

2014-03-14 18:30 UTC+01:00, Daniel Hilst Selli <danielhilst@gmail.com>:
> On 03/14/2014 12:46 PM, Celelibi wrote:
>> 2014-03-14 16:08 UTC+01:00, Daniel Hilst Selli <danielhilst@gmail.com>:
>>> Hi, I have a question about passing multiple arguments to pthreads, the
>>> big deal is where the paremeters are kept.. I see two possible
>>> solutions.. keep it on static variables that are never deallocated.. or
>>> on heap.. so here is my first question
>>>
>>> Passing local (stack) variables as arguments to thread is trouble, since
>>> the scope of this variables can go away before my thread returns..right?
>>> So forget about local variables
>>>
>>> So here is the two options I see, static vs heap...
>>> I'm using this model on one of my applications, is the same senario, a
>>> function that receives 3 ints as arguments and is called as a thread.. I
>>> create a little wrapper... here is the code http://pastebin.com/Air7u0YD
>>>
>>>
>>> How gurus does this? I free the args on threadfd wrapper since, on my
>>> real application can't join the thread, to be honest, is and deatached
>>> thread.. Is there something wrong with this strategy, it seems ugly to
>>> me....
>>>
>>> Cheers,
>>
>> Hello,
>>
>> If you don't mind making the start time of the threads a bit slower,
>> you can make every thread copy its data into its local stack.
>> You can either allocate one set of arguments on the stack of the main
>> and then, with a semaphore wait for the thread to copy its data before
>> erasing it with the data for the second thread and so on.
>> Or you can allocate enough memory for the arguments of all the
>> threads, start all the threads, and still with a semaphore wait that
>> all the threads copied their own data to their stack.
> Making parameters local to threads seems an elegant solution for me, how
> would I do it? Should I use this?
> http://pubs.opengroup.org/onlinepubs/007904975/functions/pthread_getspecific.html

I didn't know about pthread_getspecific. But it seems that they only
store void*. Not very useful to replace function arguments.

I'd just suggest starting your thread routine with something like:
struct thread_arg *a = arg;
int a1  = a->a1;
int a2  = a->a2;
int a3  = a->a3;
sem_post(a->sem);

>
>
>>
>> You can also make something in-between by allocating enough memory for
>> a fixed number of arguments. But it's becoming complicated to handle
>> for probably no gain.
> This seems what I'm doing right now.. For simple cases seems acceptable
> but for complex case, it seems to be trouble to handle...
>
>>
>> But actually, I don't really see why you wouldn't join the threads.
>> You must not terminate the function main while the threads are
>> running. If you do, all the threads will be terminated.
> I have this cenario, I'm wrinting a layer that will sit between an
> industrial stack and end user (a programmer)... the stack will call my
> callback for any events that ocurr, my callback should forward the call
> to user's callback based on event, in other words, my layer will handle
> some events, others are passed to user.. The problem is that the stack
> call my callback from its context and this blocks stack execution until
> my callback returns, this is the reason I'm creating a new thread in
> first place.. I can't trust user to return fast, I can't wait for it..
> this is why I'm not joining the thread...

Are you sure you need threads? And not just a way to postpone a long
function call until you have time to actually call it?

I mean: introducing threads when you don't really need to perform
several CPU-intensive actions at the very same time is not always
worth it.
Although the idea might seem sexy in the begining, it always lead to
synchronization problems. And bugs with threaded programs are just
harder to spot and to fix.


Celelibi
