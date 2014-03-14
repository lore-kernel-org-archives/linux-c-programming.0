From: Celelibi <celelibi@gmail.com>
Subject: Re: passing arguments to pthreads
Date: Fri, 14 Mar 2014 16:46:07 +0100
Message-ID: <CAJR2zJ_eiJPAHjKy1=5HuG7gBO3qFi8b+ggnpbCsv4n5UBUu7Q@mail.gmail.com>
References: <53231B89.2020104@gmail.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=h6zuXz+aHGvu9arGEKFyuK6fkpbnUDk4KZJbNMtyVHM=;
        b=CAfbLCM9mg0P4BscrahF0wncoE//oNMhZKE24m45qy5MBlxFx1Xb1MYGfPYDo1fF/s
         MzKWhMYcbTYfj1cNUMCCY0dU3kTTtlLDNRoyAwKIK48ArleA9V8YG7oSuffGDR4F6wOA
         f+MIY4rSllCX9vKamO/fKt6ii2KRkdLJ9L/blj2YDdDNch0165Fona3xV8Q/mN2PP0vy
         AilQQdSydeZnNXdawF1mIwFoZv8yi7ES9EoA8XA7Iplwdw9DPr3xuEgBU3fZFJU85Acv
         nGxc5ISRGGCpr+RjhkGPeqVGlAdSNLCchrk4MzI4qp9thbeVcXQszyZ31KjPZOXhNthX
         51oQ==
In-Reply-To: <53231B89.2020104@gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Daniel Hilst Selli <danielhilst@gmail.com>
Cc: linux-c-programming@vger.kernel.org

2014-03-14 16:08 UTC+01:00, Daniel Hilst Selli <danielhilst@gmail.com>:
> Hi, I have a question about passing multiple arguments to pthreads, the
> big deal is where the paremeters are kept.. I see two possible
> solutions.. keep it on static variables that are never deallocated.. or
> on heap.. so here is my first question
>
> Passing local (stack) variables as arguments to thread is trouble, since
> the scope of this variables can go away before my thread returns..right?
> So forget about local variables
>
> So here is the two options I see, static vs heap...
> I'm using this model on one of my applications, is the same senario, a
> function that receives 3 ints as arguments and is called as a thread.. I
> create a little wrapper... here is the code http://pastebin.com/Air7u0YD
>
>
> How gurus does this? I free the args on threadfd wrapper since, on my
> real application can't join the thread, to be honest, is and deatached
> thread.. Is there something wrong with this strategy, it seems ugly to
> me....
>
> Cheers,

Hello,

If you don't mind making the start time of the threads a bit slower,
you can make every thread copy its data into its local stack.
You can either allocate one set of arguments on the stack of the main
and then, with a semaphore wait for the thread to copy its data before
erasing it with the data for the second thread and so on.
Or you can allocate enough memory for the arguments of all the
threads, start all the threads, and still with a semaphore wait that
all the threads copied their own data to their stack.

You can also make something in-between by allocating enough memory for
a fixed number of arguments. But it's becoming complicated to handle
for probably no gain.

But actually, I don't really see why you wouldn't join the threads.
You must not terminate the function main while the threads are
running. If you do, all the threads will be terminated.


Celelibi
