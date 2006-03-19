From: "Steve Graegert" <graegerts@gmail.com>
Subject: Re: Virtual functions and destructors
Date: Sun, 19 Mar 2006 17:38:52 +0000
Message-ID: <6a00c8d50603190938v5852f31bhd1a6dfa7262ef83@mail.gmail.com>
References: <200603192050.22014.samjnaa@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <200603192050.22014.samjnaa@gmail.com>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

On 3/19/06, Shriramana Sharma <samjnaa@gmail.com> wrote:
> I did not get what is intended to be conveyed by:
>
> http://charm.cs.uiuc.edu/users/olawlor/ref/examples/cpp/virtual.cpp
> http://charm.cs.uiuc.edu/users/olawlor/ref/examples/cpp/virtual_destructor.cpp

1. In C++ the virtual keyword identifies to the compiler that a class
function may be overridden in a derived class.  That is, the derived
class may supply a function of the same name and argument list, but
with different functionality defined in the function body.  In the
example you linked to the child class has overriden the virtual
function hello and allows itself to be overridden by declaring its
function virtual as well.  A pointer to a derived class object may be
assigned to a base class pointer, and a virtual function called
through the pointer. If the function is virtual and occurs both in the
base class and in derived classes, then the right function will be
picked up based on what the base class pointer "really" points at.

2. Virtual destructors are needed to allow for the destructors for the
actual object types derived from the base class to be called.  Non
virtual destructors in base classes can result in memory leaks.

	\Steve
