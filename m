From: Celelibi <celelibi@gmail.com>
Subject: Re: String formatting in signal handler
Date: Sat, 20 Oct 2012 22:03:10 +0200
Message-ID: <CAJR2zJ8BOv59han+VTw510ntwcx+ug4EkSRzepK9p-Ljc2S7bQ@mail.gmail.com>
References: <CAA6iF_48vgd8Shu-49w-3mJMSi-5eMbVGFFER5RYEkKKCkv3Nw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :content-type;
        bh=8Rw4cZdqjWG9j1XbYtiXQkb5StSIQGTx4I6+4ctTDew=;
        b=LAN5uy+clkB1Nk/Sl/HoLikFBShvzCPRFUGifTe5jnalk7ZLulKjrjwhmw9jOzcszq
         1qDMezBTKvP0b5mROsppdS6wEWT/BS17Co//YY3PZpOmJXnILjPnUSMeLt/zTra8QLl9
         au5GFxJll+HzFWB3n5z3tpeLlOjNNaYhQJs0n+eoSzj/b3RXs3C6Km8LTSyFtN9RflRy
         WlaydECHzXe8jWpQ0aDbEbJ95g/N4mMvrfvb9l+1OO/6eqS+JvOKe7+hGBC6JZloVtUC
         ndiGZF5XtLEkVz3c0ozMkOvRX3fOAs2Ie0boGllHjgDzlII66RItzNeeYdVo7MbwTivK
         NB6A==
In-Reply-To: <CAA6iF_48vgd8Shu-49w-3mJMSi-5eMbVGFFER5RYEkKKCkv3Nw@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

2012/10/20, Randi Botse <nightdecoder@gmail.com>:
> Hi List,
>
> Almost (maybe all) function from the standard library stdio.h and
> string.h are not safely to be called by signal handler. If so, how to
> format string in a signal handler?. I want to log some signals which
> sent to my program, the contents is for example: time, the signal
> number itself, etc, and then write it to a file.
>
> Regards.
> --
> To unsubscribe from this list: send the line "unsubscribe
> linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>


Hi,

You can only call safely system calls listed in man 7 signal. write is
one of them. So you can reimplement some snprintf and write it.
But I wouldn't recommend that for several reasons.
1) The most important thing is that you should not call any syscall
inside a signal handler because :
1.1) a syscall may be blocking and thus preventing your program to run
and to handle those signals
1.2) a syscall usually have side effects, which might create a race
condition with respect to the main program. Especially, it modify
errno, and your main program may be preempted just between a syscall
and a test to errno.
2) You may need a buffer to implement your formatting and cannot call
malloc nor brk.
3) You need a loop! If you receive several signal at the same time,
you get notified only once. There is no signal counter.

So, you may still do your processing inside the signal handler if you
take care of all these points (and thoses I forgot). But I would
recommend that your handler set a (volatile) flag to 1 and you do not
use SA_RESTART. Thus, every time a signal is raised, the blocking
syscall will fail with EAGAIN and  you can do your work inside your
main program without any limitation.
Thought you still have to take care of these points:
1) the flag MUST be volatile ;
2) you MUST loop because you may have received several signals ;
3) in order to lower the risk of race conditions, you MUST block the
signal from the time you test the flag to the time you've finished
your processing and reset the flag to 0.
4) If you have several syscalls in the main program, I'd suggest you
block the interesting signal almost every time, and you unblock it
only when you're about to perform some syscall you know they will be
long.


Celelibi
