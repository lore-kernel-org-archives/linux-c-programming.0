From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: function pointers in C++
Date: Tue, 16 Mar 2004 07:50:11 +0000
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <16470.45491.927067.620232@cerise.nosuchdomain.co.uk>
References: <31E38B53D182D51195FA00508BE3A334036497A1@zwnbc004.cala.nortel.com>
	<20040315112849.GA774@velka.phys.uoa.gr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20040315112849.GA774@velka.phys.uoa.gr>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Elias Athanasopoulos <elathan@phys.uoa.gr>
Cc: Sandro Dangui <sdangui@nortelnetworks.com>, linux-c-programming@vger.kernel.org, Dar?o Mariani <dmarian@fi.uba.ar>


Elias Athanasopoulos wrote:

> > I think this sample code will help you... Verify if it looks brilliant
> > enough. :-))
> 
> Thanks for the detailed reply. 
> 
> Actually, what I want to do is to pass a pointer to a member function in
> a function that expects a pointer to function;

You can't. Member functions have an implicit "this" argument.

E.g. in your original example:

	class Foo 
	{ 
	public: 
		Foo(); 
		~Foo(); 
		int bar(int); 
	}; 

Foo::bar actually looks like this:

	int bar(Foo *this, int);

so you can't pass it to something which wants "int (*func)(int)".

> I don't want to call the
> member function, but just pass its address.
> 
> Following Stroustrup (pages 156..158), I did something like this:
> 
>     Foo *f = new Foo(id);
>     double (Foo::*pfunc)(double *, double *) = &Foo::func;
>     Bar *res = new Bar((double (*)(double *, double *))(func->*pfunc));
> 
> And:
> 
> class Foo {
> public:
>     Foo(int id);
>     ~Foo();
>     double func(double *, double *);
> };
> 
> Also Bar's constructor (I can't change it --third party implementation) is:
> 
>     Bar(double (*)(double *, double *));
> 
> Amazingly I get the error:
> 
> test.cxx:107: error: converting from `double (Foo::*)(double*, double*)' to 
>    `double (*)(double*, double*)'

No surprise there. Pointers to functions and pointers to members
aren't the same thing.

> which is *at least* annoying. It is another BIG suprise from C++. I mean,
> there is, most probably, a good reason why this is not supported, but it is
> a *broken design*.
> 
> Foo::func()'s prototype is (double) (double *, double *),

No it isn't. If you ignore the fact that it's a member of class Foo,
it looks like that. But you *can't* ignore the fact that it's a member
of class Foo.

From a C perspective, Foo::func()s prototype looks more like:

	double func(struct Foo *, double *, double *);

which isn't compatible with Bar's constructor.

If Bar's constructor takes a function pointer, chances are that
something within Bar is going to call that function at some point. And
it will call it with two pointers to doubles; it won't be passing
anything else, i.e. the "this" parameter which object methods require.

If you don't need a "this" pointer (even implictly; bear in mind that
a reference to a member variable "foo" is just shorthand for
"this->foo"), you can use a static method.

OTOH, if you do need a "this" pointer, then tough luck. Bar's
definition doesn't allow for that. A more useful definition of Bar
would use:

	Bar(double (*)(void *, double *, double *), void *);

If Bar's implementors had done that, you would be able to write:

	class Foo {
		...
		static double wrapper(void *, double *, double *);
	};

	double Foo::wrapper(void *p, double *a, double *b)
	{
		return ((Foo *)p)->func(a, b);
	}

	...

	Foo *foo = new Foo();
	Bar *bar = new Bar(&Foo::wrapper, (void *) foo);

However, they didn't, so you can't.

And there isn't any clean solution. Bar's constructor requires a
pointer to a function; a function which will be passed two pointers to
doubles, and *nothing else*. No "this" pointer. So the function's
return value can't depend on anything other than the two pointers
which it is passed, plus any global variables which it may return.

The closest you can get is to use a static variable or member, e.g.:

	class Foo {
	public:
		static Foo *the_foo;
		static double wrapper(double *a, double *b);
	}

	double Foo::wrapper(double *a, double *b)
	{
		return the_foo->func(a, b);
	}

	Foo *foo = new Foo();
	Foo::the_foo = foo;
	Bar *bar = new Bar(&Foo::wrapper);

If you want a fixed number of Foo's, you need one wrapper and one
static variable for each. If you want an arbitrary number of Foo's,
you're out of luck.

-- 
Glynn Clements <glynn.clements@virgin.net>
