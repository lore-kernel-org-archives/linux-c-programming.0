From: Rafael <vergandash@ig.com.br>
Subject: Re: File I/O wrapper?
Date: Tue, 25 Jan 2005 03:49:03 -0200
Message-ID: <200501250349.03476.vergandash@ig.com.br>
References: <1450f66c05012411557e328fa1@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <1450f66c05012411557e328fa1@mail.gmail.com>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

Some ideas...

Perhaps (i d't like this word but for discussion...) a wrapper I/O 100%  
trustworthy one i dont see how without kmod.

Multiple programs realizing I/O is hard,  because you need to know who 
read/write what and the buffer size of that operation. And it make things 
come more complex because i know you got look at programs stack, monitoring 
calls by I/O opetarions  (eg libc routines - GDB). That is for monitoring 
intentions. So a possible I/O reaction system based in logs it is another 
history.

There's a tool named fuser, look at the source for some ideas, gdb source code 
too.


> I'm working on a new logging system and came across the idea of using
> a program through a symbolic link instead of a file for a log.
>
> Basically I would write a program that logs to a variety of
> configurable sources, and would act as a file when it comes to I/O,
> doing whatever processing I want in between the "actual" file and the
> calling program.
>
> My only hang up so far is actually getting the program to emulate file
> I/O without writing to the program file itself.
>
>
> So in simple terms, I want a program to act like a file, and I'm stuck on
> How.
>
> A FIFO isn't quite what I need, but close, although I need a single
> point of reference to handle all I/O, exactly like a file.
>
> And I can't/don't want to rewrite every potential calling program to
> work with this.
>
> I've been thinking I'm going to have to do a kernel module, but I was
> hoping someone might know a way I can implement this w/o doing a kmod.
>
> I've always been a higher level programmer, interfaces, DB
> access/filtering, etc, so anything as low as throwing a hook into file
> I/O is a little beyond my existing knowledge level, but I'm willing to
> give it a shot.
>
> Any help would be greatly appreciated.
> -
> To unsubscribe from this list: send the line "unsubscribe
> linux-c-programming" in the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
