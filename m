From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: const int f() and int f() const
Date: Mon, 20 Mar 2006 13:01:01 +0000
Message-ID: <17438.42893.739210.819722@cerise.gclements.plus.com>
References: <200603192048.08780.samjnaa@gmail.com>
	<6a00c8d50603190945u2c66339agbdb43c023a725097@mail.gmail.com>
	<200603200529.47782.samjnaa@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <200603200529.47782.samjnaa@gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Shriramana Sharma <samjnaa@gmail.com>
Cc: Linux C Programming List <linux-c-programming@vger.kernel.org>


Shriramana Sharma wrote:

> > By declaring a const return type you are promising that the original
> > variable (inside the function's stack frame) will not be modified.
> 
> But then this function would have to return the exact same value for each and 
> every time it is called, no?
> 
> > Marks a function as const allowing it to be called by const objects
> > (btw, const objects can only call const member functions).  This
> > construct is usually found as part of member functions declarations,
> > which are known to be immutable.
> 
> OK so int f() const means function f() does not change any members of the 
> class foo of which it is a member, and therefore it is safe for constant 
> instances of the class foo to call this function f().
> 
> OTOH, just putting const *before* the function name only means that the 
> *output* of the function is a constant value, say for example the function

Putting "const" before the *return type* means that the return value
is a constant.

In that situation, "const" is just a normal type qualifier, with the
same meaning as when used in variable and parameter declarations.

> const int one() { return 1; }
> 
> and it does not assure the compiler that it is okay for a *non-const* instance 
> of class foo to call this function.

You can use *any* method on a mutable (non-const) instance.

The above indicates that one() returns a "const int", that's all.

> In this case, the compiler will *not* accept calls to the function one() as a 
> member of a *non-const* instance of foo, even though the function does not 
> change any member of foo, right?

Wrong. It will not allow the method to be used on *const* instances,
as the method itself isn't declared as "const".

If a method doesn't modify the instance, you *should* declare it as
"const". There is no reason not to; const methods can be used on both
const and mutable instances, while methods which aren't declared const
can only be used on mutable instances.

-- 
Glynn Clements <glynn@gclements.plus.com>
