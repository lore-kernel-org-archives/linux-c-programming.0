From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: need non-classwide sticky variable for a member function of a class
Date: Sat, 23 Jun 2007 16:59:25 +0100
Message-ID: <18045.17245.320061.620178@cerise.gclements.plus.com>
References: <467B813F.4060408@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <467B813F.4060408@gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Shriramana Sharma <samjnaa@gmail.com>
Cc: Linux C Programming List <linux-c-programming@vger.kernel.org>


Shriramana Sharma wrote:

> * Different instances of the class of course have different 
> startingPoint values. So it will require that there is a separate store 
> variable for the startingPoint property of each instance.
> 
> I first thought I could use a static variable inside the function 
> startingPoint() which would act as the store. But the compiler outputs 
> only one block of machine code for the function, which means there is 
> actually only one static store created. This means that there are no 
> separate stores for each class instance.
> 
> Of course the workaround is obvious -- declare a private variable 
> directly as a member of the class instead of a static variable in the 
> member function.
> 
> What I really want to ask is, aren't the two meanings of the keyword 
> static mixed up here?

No. All of the other different meanings are mixed up, but both of
these are (historically) correct usage.

> When a class has a static member, it means that that member belongs to 
> the whole class. Different instances of a class can use this to pass 
> information amongst themselves, for example.
> 
> But here there is a variable which is a static "member"

No it isn't. It's a static local variable, not a member.

> of a non-static member function of a class, and it is also acting as
> a classwide object.

For member functions, "static" means that the function doesn't require
an instance. This is a "mixed up" use of the term. In the historical
sense of the term, all functions are static, in that they reside at a
fixed address.

> To my mind, there are three meanings to the keyword static:
> 
> 1. local visibility (vars and funcs)

This is compatible with C's misuse of "static" to mean "not exported".

> 2. classwide commonness (vars and funcs)

Static member variables are static variables in the traditional sense
of the term. They're only member variables insofar as the name is
local to the class (i.e. has to be prefixed with "classname::" if
referenced from outside a member function).

Static methods (member functions) only differ from non-static methods
insofar as they don't require an instance.

> 3. sticky nature (vars only) to hold values between function calls

This is the traditional use of "static", i.e. a single occurrence
residing at a static address, as opposed to an automatic variable
which resides within the function's stack frame, and has a separate
instance for each invocation (in the case of recursion or
multi-threading), or a dynamic variable which is allocated on the heap
(by malloc(), "new", etc).

> Here the second and third meanings are mixed up -- that makes the static 
> keyword quite ambiguous, don't you think?

All three are mixed up. #3 (and #2 when referring to variables) is the
historical usage, but re-using the "static" keyword for other purposes
is a C tradition which has been expanded upon in C++.

There are three completely separate issues here: storage (where the
variable is stored), scope (what a specific name refers to in a
specific context) and linkage (what a specific name refers to from the
linker's perspectvie).

Historically, the term "static" referred to storage. C functions,
global variables, "static" top-level variables and "static" local
variables, and C++ methods and "static" member variables are all
static in terms of storage.

OTOH, C local variables are automatic by default; you can explicitly
declare them as "auto" but, as that's the default, no-one ever does (I
don't think I've ever seen the "auto" keyword used in real code).

Finally, C++ member variables are essentially structure fields. 
Whether their storage is static, automatic or dynamic depends upon
whether the instance is static, automatic or dynamic.

-- 
Glynn Clements <glynn@gclements.plus.com>
