From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: Compiling the NIST Time Client
Date: Sat, 18 Feb 2006 10:20:41 +0000
Message-ID: <17398.62713.42549.573307@cerise.gclements.plus.com>
References: <200602170800.59429.samjnaa@gmail.com>
	<200602170803.17816.techlist@pathfinder.phys.utk.edu>
	<200602181040.20766.samjnaa@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <200602181040.20766.samjnaa@gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Shriramana Sharma <samjnaa@gmail.com>
Cc: Linux C Programming List <linux-c-programming@vger.kernel.org>


Shriramana Sharma wrote:

> > exit() takes one argument. exit() is not the same as return. 'man 3 exit'
> > for details.
> 
> All I can see is that exit mandatorily takes an argument whereas if return is 
> not given an argument the return status is that of the last command executed 
> in the function body.

If the function returns a value (i.e. not "void"), return should have
an argument. If it doesn't, and the compiler doesn't generate an
error, the function's return value is undefined. For Linux/x86/gcc, it
will be whatever happened to be in the EAX register at that point.

Linux/x86 uses the EAX register to return function results. If you do
"return <expr>", gcc will put the value of <expr> into EAX then
return. If you just do "return", it will return without storing
anything in EAX, so the return value will be whatever happened to be
in EAX at that point. If the EAX register hasn't been used since, it
will be the return value from the last function call.

> Further, exit is a function whereas return is a statement, not that that 
> really makes much of a difference (does it?).

Yes; return and exit() are only equivalent inside main(). return
returns from the current function, exit() terminates the program. If
you return from main(), the program will terminate, so the two are
equivalent in that particular case.

-- 
Glynn Clements <glynn@gclements.plus.com>
