From: Daniel Hilst Selli <danielhilst@gmail.com>
Subject: Re: passing arguments to pthreads
Date: Fri, 14 Mar 2014 14:30:48 -0300
Message-ID: <53233CC8.8020701@gmail.com>
References: <53231B89.2020104@gmail.com> <CAJR2zJ_eiJPAHjKy1=5HuG7gBO3qFi8b+ggnpbCsv4n5UBUu7Q@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=p72c21CEW9Atf5zkqsHsMOXr+eT+Wb/anNpfAOxF/z4=;
        b=rMqhpqu28w0oTujumxyqUfNQd455m6dv7VLjgTbM4JfGipgcFm3ND0bbPg/B3JcckP
         PXAzyPLAJsIO7KRQrW0Q0sI77b+u9rQ71zohtTMKiy2HBmHZboeKbHP4/h2SOQFmg4Ea
         eWIdHHuaprJyocu2S5VYvPGOgYu4+0V8JPltqKqYtYPdbl4R+xRJ3oCs2GSxRn5vhNlj
         A96dOaYTC448JfDklYYcjs7x9zVvXB0bWz3sxFriAZTyx0PbzZq27GH9E/eBo5PI/HYI
         Y24nbYmSB1Tzn+pzZHwoWtrDiWN0pyWXl3o4wOu/nOfrgqqTD8Cojj4OHyUmfJwRZy9X
         niHA==
In-Reply-To: <CAJR2zJ_eiJPAHjKy1=5HuG7gBO3qFi8b+ggnpbCsv4n5UBUu7Q@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Celelibi <celelibi@gmail.com>
Cc: linux-c-programming@vger.kernel.org

On 03/14/2014 12:46 PM, Celelibi wrote:
> 2014-03-14 16:08 UTC+01:00, Daniel Hilst Selli <danielhilst@gmail.com>:
>> Hi, I have a question about passing multiple arguments to pthreads, the
>> big deal is where the paremeters are kept.. I see two possible
>> solutions.. keep it on static variables that are never deallocated.. or
>> on heap.. so here is my first question
>>
>> Passing local (stack) variables as arguments to thread is trouble, since
>> the scope of this variables can go away before my thread returns..right?
>> So forget about local variables
>>
>> So here is the two options I see, static vs heap...
>> I'm using this model on one of my applications, is the same senario, a
>> function that receives 3 ints as arguments and is called as a thread.. I
>> create a little wrapper... here is the code http://pastebin.com/Air7u0YD
>>
>>
>> How gurus does this? I free the args on threadfd wrapper since, on my
>> real application can't join the thread, to be honest, is and deatached
>> thread.. Is there something wrong with this strategy, it seems ugly to
>> me....
>>
>> Cheers,
>
> Hello,
>
> If you don't mind making the start time of the threads a bit slower,
> you can make every thread copy its data into its local stack.
> You can either allocate one set of arguments on the stack of the main
> and then, with a semaphore wait for the thread to copy its data before
> erasing it with the data for the second thread and so on.
> Or you can allocate enough memory for the arguments of all the
> threads, start all the threads, and still with a semaphore wait that
> all the threads copied their own data to their stack.
Making parameters local to threads seems an elegant solution for me, how 
would I do it? Should I use this? 
http://pubs.opengroup.org/onlinepubs/007904975/functions/pthread_getspecific.html


>
> You can also make something in-between by allocating enough memory for
> a fixed number of arguments. But it's becoming complicated to handle
> for probably no gain.
This seems what I'm doing right now.. For simple cases seems acceptable 
but for complex case, it seems to be trouble to handle...

>
> But actually, I don't really see why you wouldn't join the threads.
> You must not terminate the function main while the threads are
> running. If you do, all the threads will be terminated.
I have this cenario, I'm wrinting a layer that will sit between an 
industrial stack and end user (a programmer)... the stack will call my 
callback for any events that ocurr, my callback should forward the call 
to user's callback based on event, in other words, my layer will handle 
some events, others are passed to user.. The problem is that the stack 
call my callback from its context and this blocks stack execution until 
my callback returns, this is the reason I'm creating a new thread in 
first place.. I can't trust user to return fast, I can't wait for it.. 
this is why I'm not joining the thread...

Thanks for your help :-)

Cheers...
>
>
> Celelibi
>

