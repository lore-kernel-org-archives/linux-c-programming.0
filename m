From: Benjamin Sobotta <mayday@gmx.net>
Subject: Re: const int f() and int f() const
Date: Wed, 22 Mar 2006 23:44:50 +0100
Message-ID: <200603222344.50947.mayday@gmx.net>
References: <200603192048.08780.samjnaa@gmail.com> <6a00c8d50603190945u2c66339agbdb43c023a725097@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <6a00c8d50603190945u2c66339agbdb43c023a725097@mail.gmail.com>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Steve Graegert <graegerts@gmail.com>
Cc: linux-c-programming@vger.kernel.org

On Sunday 19 March 2006 18:45, Steve Graegert wrote:
> On 3/19/06, Shriramana Sharma <samjnaa@gmail.com> wrote:
> > Suppose there is a function f() which returns an integer and does not
> > change any value of the class it belongs to, should I declare it as:
>
> I don't understand what you mean here.
>
> > const int f();
>
> By declaring a const return type you are promising that the original
> variable (inside the function's stack frame) will not be modified.
> Because you're returning it by value, it's copied so the original
> value could never be modified via the return value.  This qualifier
> has not meaning for primitive builtin types.  This is different for
> user-defined types: if a function returns a class object by value as
> const, the return value of that function cannot be an lvalue (that is,
> it cannot be assigned to or otherwise modified).

It can have a meaning for built in types, too. For example you could do 
something like this:

int& f(...) {....}

Through this you could actually change a value inside the class. Or cause a 
segfault - depending on what you return, a member or a temp variable :)
Constructs of this kind are only usable of you pass back a reference to a 
member that lives beyond the function call, of course. If you use const you 
make sure that your reference is read-only.

>
> > or
> >
> > int f() const;
>
> Marks a function as const allowing it to be called by const objects
> (btw, const objects can only call const member functions).  This
> construct is usually found as part of member functions declarations,
> which are known to be immutable.
>
> You probably want to choose the latter one.
>
> 	\Steve
> -
> To unsubscribe from this list: send the line "unsubscribe
> linux-c-programming" in the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
