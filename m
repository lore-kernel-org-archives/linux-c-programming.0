From: "Sandro Dangui" <sdangui@nortelnetworks.com>
Subject: RE: function pointers in C++
Date: Mon, 15 Mar 2004 11:21:18 -0300
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <31E38B53D182D51195FA00508BE3A334036497A1@zwnbc004.cala.nortel.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: elathan@phys.uoa.gr
Cc: linux-c-programming@vger.kernel.org


I think this sample code will help you... Verify if it looks brilliant
enough. :-))

----------------------------------------------------------------------------
--------------------
#include <stdio.h>
#include <stdlib.h>
#include <stdarg.h>

// definitions for portability
#ifdef _WIN32
#define STDCALL __cdecl
#else
#define STDCALL
#endif

class Foo
{
public:
	Foo(int id)
	{
		Id = id;
	}

	int STDCALL bar(int value)
	{
		printf("Method Foo::bar with param value=%i, Foo Id=%i\n",
value, Id);

		return (value * 2 + Id);
	}

protected:
	int Id;
};

class CallFooMethod
{
public:
	CallFooMethod(void* pInstance, ...)
	{
		va_list argList;

		va_start(argList, pInstance);

		pObject = pInstance;

		pMethod = va_arg(argList, void *);

		va_end(argList);
	}

	int CallIt(int value)
	{
		typedef int (*F)(void *, int);
		F f = (F) pMethod;

		/* The trick here is that the compiler pass the "this" value
as a hidden parameter... Then,
		   let's do the same thing explicitly */
		return f(pObject, value);
	}

protected:
	void* pObject;
	void* pMethod;
};

int main(int /*argc*/, char** /*argv*/)
{
	Foo foo1(1);
	Foo foo2(2);

	CallFooMethod callFooMethod1(&foo1, &Foo::bar);
	CallFooMethod callFooMethod2(&foo2, &Foo::bar);

	int retValue1 = callFooMethod1.CallIt(50);
	int retValue2 = callFooMethod2.CallIt(100);

	printf("retValue1=%i, retValue2=%i\n", retValue1, retValue2);

	return 0;
}
----------------------------------------------------------------------------
--------------------

-----Original Message-----
From: linux-c-programming-owner@vger.kernel.org
[mailto:linux-c-programming-owner@vger.kernel.org] On Behalf Of
elathan@phys.uoa.gr
Sent: Monday, March 15, 2004 7:40 AM
To: Jan-Benedict Glaw
Cc: linux-c-programming@vger.kernel.org
Subject: Re: function pointers in C++


 
Jan-Benedict Glaw <jbglaw@lug-owl.de>: 
> On Mon, 2004-03-15 11:28:19 +0200, elathan@phys.uoa.gr 
> <elathan@phys.uoa.gr>
> > void taz(int (*f)(int));
>  
> You're looking for "static"ally declared member functions.
 
And in that case I can't use 'this' inside the function. Brilliant... :-( 
 
Thanx for the reply. 
 
Regards, 
--  

-
To unsubscribe from this list: send the line "unsubscribe
linux-c-programming" in the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
