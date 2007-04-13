From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: efficiency in passing a value to a function
Date: Fri, 13 Apr 2007 18:51:09 +0100
Message-ID: <17951.49933.243950.132691@cerise.gclements.plus.com>
References: <4613DCB8.8030007@gmail.com>
	<6a00c8d50704041138l278f34d2t9c97ba551f7ad5c3@mail.gmail.com>
	<46190016.2000402@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <46190016.2000402@gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Shriramana Sharma <samjnaa@gmail.com>
Cc: linux-c-programming@vger.kernel.org


Shriramana Sharma wrote:

> > I have seen many programs making use const reference parameters in
> > order to inform the compiler that the parameter is read-only, and
> > hence should be better optimized.
> 
> I thought the usage of const before & in function definitions was to 
> prevent the value from being modified. I never knew there is an 
> optimization aspect.

There is, but it's usually secondary. Also, it's more likely that it
will enable optimisation in the caller than in the callee.

> > Unfortunately, this intent is at odds with the C++ language
> > definition. The const keyword says that the storage may not be
> > modified through the given name. What it does not say is that the
> > storage cannot be modified through some other name.
> 
> I observe that this is true for C too, not just C++. Anyway, how is it 
> exactly "at odds" with the language definition?

The fact that a const-qualified object may change eliminates many
possibilities for optimisation.

This is why the ANSI C standard includes certain rules regarding
"aliasing" (where several different expressions may actually refer to
the same region of memory).

These rules permit a compiler to assume that:

1. A value or array referenced by a pointer doesn't overlap a global
variable.

2. Primitive (non-struct/union) objects of different types don't
overlap.

E.g. consider the following code:

	int foo(int *p)
	{
		int x = globalvar++;
		int y = *p;
		return x * y;
	}

If it wishes, the compiler can swap the order in which x and y are
evaluated. Rule #1 above means that it doesn't have to consider the
possibility of being called as foo(&globalvar), where the globalvar++
would change the value of *p.

Without aliasing rules, many potential optimisations would have to be
foregone in case what appear to be distinct objects share the same
memory.

However, the aliasing rules state that the compiler cannot assume that
objects which are of the same type and which are both referenced
through pointers cannot overlap. So in the case of:

	int foo(int *p, int *q)
	{
		int x = (*p)++;
		int y = *q;
	}

the compiler cannot re-order the assignments because *p++ might modify
*q (if p == q).

If you write "clean" code, you don't need to worry about aliasing. 

Problems normally arise through the use of "type punning", where you
treat a specific area of memory as having two different types. E.g.

	union int_bytes {
		int i;
		unsigned char b[4];
	};

	...

	union int_bytes tmp;
	unsigned char lo_byte;

	tmp.i = 12345;
	lo_byte = tmp.b[0];

The above code may work fine when optimisation is disabled, but fail
when it is enabled.

This type of code is inevitably non-portable, as you are making
assumptions about the way in which specific types are stored in
memory.

This kind of "trick" is most common in low-level code which sacrifices
portability (and legibility) for performance. A good example is the
Linux kernel. This the main reason why it used to be quite common that
you had to use an older version of gcc to compile the kernel: because
newer versions optimised more aggressively, and thus were more likely
to break code which ignored the aliasing rules.

> [BTW gcc is intelligent enough to give me a compile-time warning:
> 
> const.c:7: warning: initialization discards qualifiers from pointer 
> target type
> 
> when I write const int i = 2 ; int * iptr = & i ; and I don't even have 
> to give -Wall !]
> 
> > you can only initialize them, const is basically ineffective a
> > improving run-time performance. It does, however, catch errors in the
> > programming process.
> 
> const is also useful for preventing a function writing to a variable 
> passed to it as reference, which is what this thread was originally about.
> 
> Just for the record, are there any other uses for const?

It enables certain optimisations, mostly in the caller. E.g. the code:

	y = x * 2;
	foo(&x);
	return y;

can be re-arranged as:

	foo(&x);
	y = x * 2;
	return y;

if foo is declared "void foo(const int *)" but not if it is declared
as "void foo(int *)", as the former is guaranteed not to modify x, but
the latter isn't.

Conversely, the "volatile" qualifier disables certain optimisations.

Neither "const" nor "volatile" were present in the original K&R C
language. They were added to the ANSI C standard specifically to deal
with issues related to optimisation.

-- 
Glynn Clements <glynn@gclements.plus.com>
