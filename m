From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: Copying a class copies the member functions?
Date: Fri, 13 Apr 2007 18:21:04 +0100
Message-ID: <17951.48128.297654.240395@cerise.gclements.plus.com>
References: <46190856.1010207@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <46190856.1010207@gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Shriramana Sharma <samjnaa@gmail.com>
Cc: linux-c-programming@vger.kernel.org


Shriramana Sharma wrote:

> Apropos my recent questions regarding passing by reference etc the 
> following question comes to mind:
> 
> When a class instance is created, does this also create a copy in memory 
> (from the class prototype) of the member functions or only of the data 
> members?
> 
> Regarding static member functions I realize there is no meaning to have 
> an instance of the member function for each instance since the function 
> does not relate to an instance of the class.
> 
> But even regarding non-static functions, I don't see any meaning in 
> having an instance of the function for each member of the class, since 
> all such functions would do basically the same thing, though with their 
> parent instance only.
> 
> So what's the fact here? Is there any need for new copies of member 
> functions with each new instance of a class being created? *Are* such 
> new copies created by good compilers like GCC?

Virtual methods are normally implemented via a table of function
pointers which is shared by all instances of a given class.

So a C++ virtual method call such as e.g. obj.foo(arg) results in code
equivalent to the C expression (*obj.vtable->foo)(&obj, arg).

Non-virtual methods are effectively just like C functions; the actual
function is determined at compile time.

-- 
Glynn Clements <glynn@gclements.plus.com>
