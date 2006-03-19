From: Shriramana Sharma <samjnaa@gmail.com>
Subject: Re: const int f() and int f() const
Date: Mon, 20 Mar 2006 05:29:47 +0530
Message-ID: <200603200529.47782.samjnaa@gmail.com>
References: <200603192048.08780.samjnaa@gmail.com> <6a00c8d50603190945u2c66339agbdb43c023a725097@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <6a00c8d50603190945u2c66339agbdb43c023a725097@mail.gmail.com>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linux C Programming List <linux-c-programming@vger.kernel.org>

Thanks to all who replied.

> By declaring a const return type you are promising that the original
> variable (inside the function's stack frame) will not be modified.

But then this function would have to return the exact same value for each and 
every time it is called, no?

> Marks a function as const allowing it to be called by const objects
> (btw, const objects can only call const member functions).  This
> construct is usually found as part of member functions declarations,
> which are known to be immutable.

OK so int f() const means function f() does not change any members of the 
class foo of which it is a member, and therefore it is safe for constant 
instances of the class foo to call this function f().

OTOH, just putting const *before* the function name only means that the 
*output* of the function is a constant value, say for example the function

const int one() { return 1; }

and it does not assure the compiler that it is okay for a *non-const* instance 
of class foo to call this function.

In this case, the compiler will *not* accept calls to the function one() as a 
member of a *non-const* instance of foo, even though the function does not 
change any member of foo, right?

Is that right?

-- 

Tux #395953 resides at http://samvit.org
playing with KDE 3.51 on SUSE Linux 10.0
$ date [] CCE +2006-03-20 W12-1 UTC+0530
