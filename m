From: Micha Feigin <michf@post.tau.ac.il>
Subject: Re: exit(42)
Date: Sat, 25 Sep 2004 03:13:23 +0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20040925011323.GD3825@luna.mooo.com>
References: <20040924115759.6133.qmail@web52908.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20040924115759.6133.qmail@web52908.mail.yahoo.com>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux prg <linux-c-programming@vger.kernel.org>

On Fri, Sep 24, 2004 at 12:57:59PM +0100, Ankit Jain wrote:
> well do any body know what does this mean?
> 
> exit(42)
> 

It means return value 42 as the exit value for the program. Every
program returns an exit value (integer) when it exits. 0 means not
error, anything else is an error value and the specific number can mean
the type of error if its documented and the caller knows what to expect.

> and also when we say exit(0) or exit(1) then there is
> anyway to catch these values
> 

From the caller you can catch this value, read the documentation for
your shell about the return value. I think its $? under bash.

> also when we return from main fn then what is the
> benfit?
> 
> does it have any utilisation?
> 

main is just another function almost like any other in your
program. The system doesn't look for the function main to run, its just
a convention used by c (in windows the main function is called winmain
for example, don't remember what its called in pascal, but IIRC
something different also).

when you compile your program its linked with some assembler code that
handles setting up you environment. The system looks for a symbol in
your program called _start and start the execution from there. This
function is responsible for setting everything up, including argc and
argv (the command line arguments and environment variables) and possibly
handling calling constructors of global classes in c++ (not sure about
that though). It then calls your main function with the proper values
of argc and argv.

When you main function returns, or when you call exit, a function called
exit is called which handles all the cleaning up of your program and
then the function _exit is called to finish exiting the program. You
are not supposed to call _exit directly since it bypasses cleaning up,
calling it directly is only useful if you use vfork where you don't
want any cleaning up done since it messes things up (you shouldn't use
vfork for most things nowadays since fork has almost no more
overhead. If you don't know you need it, then you don't).

> thanks
> 
> ankit
> 
> ________________________________________________________________________
> Yahoo! Messenger - Communicate instantly..."Ping" 
> your friends today! Download Messenger Now 
> http://uk.messenger.yahoo.com/download/index.html
> -
> To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>  
>  +++++++++++++++++++++++++++++++++++++++++++
>  This Mail Was Scanned By Mail-seCure System
>  at the Tel-Aviv University CC.
> 
