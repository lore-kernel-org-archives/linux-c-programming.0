From: Celelibi <celelibi@gmail.com>
Subject: Re: passing arguments to pthreads
Date: Wed, 19 Mar 2014 02:44:48 +0100
Message-ID: <CAJR2zJ8UzebT1cWkCyXojtm=3Ggb=5pEx0MkH77koKJpyXjCVw@mail.gmail.com>
References: <53231B89.2020104@gmail.com>
	<CAJR2zJ_eiJPAHjKy1=5HuG7gBO3qFi8b+ggnpbCsv4n5UBUu7Q@mail.gmail.com>
	<53233CC8.8020701@gmail.com>
	<CAJR2zJ8HUX2UcRZWG+-JhAb3LQYHqxh-NBq56P4YyEZNFUkc9A@mail.gmail.com>
	<5328C6F0.9000009@gmail.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :content-type;
        bh=PpKZOjXr/xPOg8GNEES2g3y0hMv50kdYi9llJGJuhT8=;
        b=DH/SUlLoQeEFTmLZxnPp4rYsCuGRt9dp4AH1YNpxHd94+Kbqi4vFIB6t4kb4kypTRh
         oQAdqsOhmIINm82rmOwgulA/VGbE95idfNp2Fls6S6fxEsrjnD8FDK+6bou/UdEuZN1w
         XO3T3XTvlCihw3bmGG9CgAoLbcv7wpWkdJ6zjkKpNqvYALBoDyuw/qQFJD8lKK5HDM3f
         zPwd3LNpiNMCWEbYQbvojCeZc2cNeHiPkxN1yLq1/Dufp1BQ0cHi2lEpGNQ8DhZjYu3C
         2O9s9TkyztfhdISDOY3F8ReSFOiRyyAEtOf7hhSky1f2eaLLmy6LMwF1FmALYp579ANz
         Lkng==
In-Reply-To: <5328C6F0.9000009@gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming <linux-c-programming@vger.kernel.org>

2014-03-18 23:21 UTC+01:00, Daniel Hilst Selli <danielhilst@gmail.com>:
> On 03/14/2014 04:22 PM, Celelibi wrote:
>> 2014-03-14 18:30 UTC+01:00, Daniel Hilst Selli <danielhilst@gmail.com>:
>>> On 03/14/2014 12:46 PM, Celelibi wrote:
>>>> 2014-03-14 16:08 UTC+01:00, Daniel Hilst Selli <danielhilst@gmail.com>:
>>>>> Hi, I have a question about passing multiple arguments to pthreads,
>>>>> the
>>>>> big deal is where the paremeters are kept.. I see two possible
>>>>> solutions.. keep it on static variables that are never deallocated..
>>>>> or
>>>>> on heap.. so here is my first question
>>>>>
>>>>> Passing local (stack) variables as arguments to thread is trouble,
>>>>> since
>>>>> the scope of this variables can go away before my thread
>>>>> returns..right?
>>>>> So forget about local variables
>>>>>
>>>>> So here is the two options I see, static vs heap...
>>>>> I'm using this model on one of my applications, is the same senario, a
>>>>> function that receives 3 ints as arguments and is called as a thread..
>>>>> I
>>>>> create a little wrapper... here is the code
>>>>> http://pastebin.com/Air7u0YD
>>>>>
>>>>>
>>>>> How gurus does this? I free the args on threadfd wrapper since, on my
>>>>> real application can't join the thread, to be honest, is and deatached
>>>>> thread.. Is there something wrong with this strategy, it seems ugly to
>>>>> me....
>>>>>
>>>>> Cheers,
>>>>
>>>> Hello,
>>>>
>>>> If you don't mind making the start time of the threads a bit slower,
>>>> you can make every thread copy its data into its local stack.
>>>> You can either allocate one set of arguments on the stack of the main
>>>> and then, with a semaphore wait for the thread to copy its data before
>>>> erasing it with the data for the second thread and so on.
>>>> Or you can allocate enough memory for the arguments of all the
>>>> threads, start all the threads, and still with a semaphore wait that
>>>> all the threads copied their own data to their stack.
>>> Making parameters local to threads seems an elegant solution for me, how
>>> would I do it? Should I use this?
>>> http://pubs.opengroup.org/onlinepubs/007904975/functions/pthread_getspecific.html
>>
>> I didn't know about pthread_getspecific. But it seems that they only
>> store void*. Not very useful to replace function arguments.
>>
>> I'd just suggest starting your thread routine with something like:
>> struct thread_arg *a = arg;
>> int a1  = a->a1;
>> int a2  = a->a2;
>> int a3  = a->a3;
>> sem_post(a->sem);
> I'm not using semaphores here, I just create a wrapper over the real
> function I want to call with as 3 ints as arguments, something like this
>
> main()
> {
>    int *args = malloc(sizeof(int) * 3);
>    args[0] = x; args[1] = y; args[2] = z;
>    pthread_create(th, detached, wrap, args)
> }
>
> void *wrap(void *args)
> {
>    real_func(args[0], args[1], args[2]);
>    free(args);
> }

You need to cast args as int*.


> The args are only freed when real_func returns, so I don't see problems
> and need to use semaphores, did you? Is just this function that I
> execute as a thread, all others on my layer follow a normal flow, I
> mean, no parallel stuff...

I thought you wanted to avoid using the heap.
Isn't that code more or less what you had in the pastbin in your first message?
Moreover, there are other way of terminating a thread. pthread_cancel
for instance.

But... Do your threads terminate? I thought you didn't wanted to join them.


>> Are you sure you need threads? And not just a way to postpone a long
>> function call until you have time to actually call it?
>>
>> I mean: introducing threads when you don't really need to perform
>> several CPU-intensive actions at the very same time is not always
>> worth it.
>> Although the idea might seem sexy in the begining, it always lead to
>> synchronization problems. And bugs with threaded programs are just
>> harder to spot and to fix.
> I agree, I don't like threads when they aren't needed too, but as a
> layer I have no control on execution flow, and, the stack is already
> full of threads..
>
> Still I'm wondering how to postpone this execution, I can execute a
> signal handler as an alarm or something, but it seems as ugly as threads...
>

You're writing a layer between some user code and some backend that
generate events (you called "the industrial stack"). Right?
What does the main thread executes? Where is the main loop?
You may provide a function to the user code that the user code has to
call every once is a while. Similar to what GTK does with
gtk_main_iteration. This function would process any pending event and
call the callback functions. And if the user code do not want to
handle the main loop, you can provide a function that loops on that
even-processing function. Just like gtk_main.

However, if the main loop of the code is in the backend, then maybe
they provide an "idle event". It's a callback that is called when
there is no other event.

But if you say the backend is already full of threads... Then adding
more may not add much troubles. And if the backend is full of threads,
is that really important that you return to the caller ASAP?


Celelibi
