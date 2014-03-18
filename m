From: Daniel Hilst Selli <danielhilst@gmail.com>
Subject: Re: passing arguments to pthreads
Date: Tue, 18 Mar 2014 19:21:36 -0300
Message-ID: <5328C6F0.9000009@gmail.com>
References: <53231B89.2020104@gmail.com>	<CAJR2zJ_eiJPAHjKy1=5HuG7gBO3qFi8b+ggnpbCsv4n5UBUu7Q@mail.gmail.com>	<53233CC8.8020701@gmail.com> <CAJR2zJ8HUX2UcRZWG+-JhAb3LQYHqxh-NBq56P4YyEZNFUkc9A@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:cc:subject:references
         :in-reply-to:content-type:content-transfer-encoding;
        bh=g7POum3nlnVZ9cZO0tscAaA2iWjClySPwSXI9oxob30=;
        b=xPUpgZaMh5PlB5kNuYtji+N36h5oJ3OpfCqsju9rl1k7Mz4PGGHfzr4TBYBCqyy2VM
         0ak4kK/Xqb6axMpGJVtNGrAVcnaq/ENxTTuiVl91uhJDDpddNkKlX6ggTiuln0jAxUxn
         BuPaSV0mA/zzaGADeOPNNSorTWACSOb44yF54Q481u008ePn96YgK+Coyutyuxn2EPeC
         0BaHq3aNqR2g0aZgOEWLwB3jvOQIyMP25KHz7hx2Zt5X5tWBt247BNaa3Na6yFz8jZhs
         q+TyaVsiZb2wfzr+QFOUPgcBf8VU6PBQSebmR8CgNpPiAuDlm+NsYaQshYogdHmdmu26
         /yYg==
In-Reply-To: <CAJR2zJ8HUX2UcRZWG+-JhAb3LQYHqxh-NBq56P4YyEZNFUkc9A@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: 
Cc: linux-c-programming@vger.kernel.org

On 03/14/2014 04:22 PM, Celelibi wrote:
> 2014-03-14 18:30 UTC+01:00, Daniel Hilst Selli <danielhilst@gmail.com>:
>> On 03/14/2014 12:46 PM, Celelibi wrote:
>>> 2014-03-14 16:08 UTC+01:00, Daniel Hilst Selli <danielhilst@gmail.com>:
>>>> Hi, I have a question about passing multiple arguments to pthreads, the
>>>> big deal is where the paremeters are kept.. I see two possible
>>>> solutions.. keep it on static variables that are never deallocated.. or
>>>> on heap.. so here is my first question
>>>>
>>>> Passing local (stack) variables as arguments to thread is trouble, since
>>>> the scope of this variables can go away before my thread returns..right?
>>>> So forget about local variables
>>>>
>>>> So here is the two options I see, static vs heap...
>>>> I'm using this model on one of my applications, is the same senario, a
>>>> function that receives 3 ints as arguments and is called as a thread.. I
>>>> create a little wrapper... here is the code http://pastebin.com/Air7u0YD
>>>>
>>>>
>>>> How gurus does this? I free the args on threadfd wrapper since, on my
>>>> real application can't join the thread, to be honest, is and deatached
>>>> thread.. Is there something wrong with this strategy, it seems ugly to
>>>> me....
>>>>
>>>> Cheers,
>>>
>>> Hello,
>>>
>>> If you don't mind making the start time of the threads a bit slower,
>>> you can make every thread copy its data into its local stack.
>>> You can either allocate one set of arguments on the stack of the main
>>> and then, with a semaphore wait for the thread to copy its data before
>>> erasing it with the data for the second thread and so on.
>>> Or you can allocate enough memory for the arguments of all the
>>> threads, start all the threads, and still with a semaphore wait that
>>> all the threads copied their own data to their stack.
>> Making parameters local to threads seems an elegant solution for me, how
>> would I do it? Should I use this?
>> http://pubs.opengroup.org/onlinepubs/007904975/functions/pthread_getspecific.html
>
> I didn't know about pthread_getspecific. But it seems that they only
> store void*. Not very useful to replace function arguments.
>
> I'd just suggest starting your thread routine with something like:
> struct thread_arg *a = arg;
> int a1  = a->a1;
> int a2  = a->a2;
> int a3  = a->a3;
> sem_post(a->sem);
I'm not using semaphores here, I just create a wrapper over the real 
function I want to call with as 3 ints as arguments, something like this

main()
{
   int *args = malloc(sizeof(int) * 3);
   args[0] = x; args[1] = y; args[2] = z;
   pthread_create(th, detached, wrap, args)
}

void *wrap(void *args)
{
   real_func(args[0], args[1], args[2]);
   free(args);
}


The args are only freed when real_func returns, so I don't see problems 
and need to use semaphores, did you? Is just this function that I 
execute as a thread, all others on my layer follow a normal flow, I 
mean, no parallel stuff...


>
>>
>>
>>>
>>> You can also make something in-between by allocating enough memory for
>>> a fixed number of arguments. But it's becoming complicated to handle
>>> for probably no gain.
>> This seems what I'm doing right now.. For simple cases seems acceptable
>> but for complex case, it seems to be trouble to handle...
>>
>>>
>>> But actually, I don't really see why you wouldn't join the threads.
>>> You must not terminate the function main while the threads are
>>> running. If you do, all the threads will be terminated.
>> I have this cenario, I'm wrinting a layer that will sit between an
>> industrial stack and end user (a programmer)... the stack will call my
>> callback for any events that ocurr, my callback should forward the call
>> to user's callback based on event, in other words, my layer will handle
>> some events, others are passed to user.. The problem is that the stack
>> call my callback from its context and this blocks stack execution until
>> my callback returns, this is the reason I'm creating a new thread in
>> first place.. I can't trust user to return fast, I can't wait for it..
>> this is why I'm not joining the thread...
>
> Are you sure you need threads? And not just a way to postpone a long
> function call until you have time to actually call it?
>
> I mean: introducing threads when you don't really need to perform
> several CPU-intensive actions at the very same time is not always
> worth it.
> Although the idea might seem sexy in the begining, it always lead to
> synchronization problems. And bugs with threaded programs are just
> harder to spot and to fix.
I agree, I don't like threads when they aren't needed too, but as a 
layer I have no control on execution flow, and, the stack is already 
full of threads..

Still I'm wondering how to postpone this execution, I can execute a 
signal handler as an alarm or something, but it seems as ugly as threads...

Thanks for your answer :-)
Cheers,
>
>
> Celelibi
>

