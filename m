From: Benjamin Sobotta <mayday@gmx.net>
Subject: Re: Virtual functions and destructors
Date: Wed, 22 Mar 2006 23:27:41 +0100
Message-ID: <200603222327.41672.mayday@gmx.net>
References: <200603192050.22014.samjnaa@gmail.com> <6a00c8d50603190938v5852f31bhd1a6dfa7262ef83@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <6a00c8d50603190938v5852f31bhd1a6dfa7262ef83@mail.gmail.com>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Steve Graegert <graegerts@gmail.com>
Cc: linux-c-programming@vger.kernel.org

On Sunday 19 March 2006 18:38, Steve Graegert wrote:
> On 3/19/06, Shriramana Sharma <samjnaa@gmail.com> wrote:
> > I did not get what is intended to be conveyed by:
> >
> > http://charm.cs.uiuc.edu/users/olawlor/ref/examples/cpp/virtual.cpp
> > http://charm.cs.uiuc.edu/users/olawlor/ref/examples/cpp/virtual_destructo
> >r.cpp
>
> 1. In C++ the virtual keyword identifies to the compiler that a class
> function may be overridden in a derived class.  That is, the derived
> class may supply a function of the same name and argument list, but
> with different functionality defined in the function body.  In the
> example you linked to the child class has overriden the virtual
> function hello and allows itself to be overridden by declaring its
> function virtual as well.  A pointer to a derived class object may be
> assigned to a base class pointer, and a virtual function called
> through the pointer. If the function is virtual and occurs both in the
> base class and in derived classes, then the right function will be
> picked up based on what the base class pointer "really" points at.
>
> 2. Virtual destructors are needed to allow for the destructors for the
> actual object types derived from the base class to be called.  Non
> virtual destructors in base classes can result in memory leaks.
>
> 	\Steve
> -
> To unsubscribe from this list: send the line "unsubscribe
> linux-c-programming" in the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

Hello!

to #1:
I'm not sure if this is right. Functions can always be overloaded. virtual 
merely indicates that you want to use dynamic binding. That means that it is 
determined at run time rather than compile time which function to run. The 
decision will be made based on the type of the actual object rather than the 
pointer. If you remove both virtual statements parent will show up twice. 
That's because in both cases the pointer is of type parent. In case of 
dynamic binding it doesn't matter anylonger, because the function belonging 
to the object is executed. 
Further I believe that once a function is declared virtual it always stays 
that way. Even if in subsequently derived classes it is not explicitly 
declared virtual any longer. 

Cheers,

Ben
