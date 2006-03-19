From: "Steve Graegert" <graegerts@gmail.com>
Subject: Re: const int f() and int f() const
Date: Sun, 19 Mar 2006 17:45:29 +0000
Message-ID: <6a00c8d50603190945u2c66339agbdb43c023a725097@mail.gmail.com>
References: <200603192048.08780.samjnaa@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <200603192048.08780.samjnaa@gmail.com>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

On 3/19/06, Shriramana Sharma <samjnaa@gmail.com> wrote:
> Suppose there is a function f() which returns an integer and does not change
> any value of the class it belongs to, should I declare it as:

I don't understand what you mean here.

> const int f();

By declaring a const return type you are promising that the original
variable (inside the function's stack frame) will not be modified.
Because you're returning it by value, it's copied so the original
value could never be modified via the return value.  This qualifier
has not meaning for primitive builtin types.  This is different for
user-defined types: if a function returns a class object by value as
const, the return value of that function cannot be an lvalue (that is,
it cannot be assigned to or otherwise modified).

> or
>
> int f() const;

Marks a function as const allowing it to be called by const objects
(btw, const objects can only call const member functions).  This
construct is usually found as part of member functions declarations,
which are known to be immutable.

You probably want to choose the latter one.

	\Steve
