From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: "static const" attribute in C++ (How to ?)
Date: Thu, 1 Jul 2004 05:27:27 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <16611.37551.259074.929826@cerise.nosuchdomain.co.uk>
References: <40E09FC4.50800@ig.com.br>
	<16608.44836.384260.844173@cerise.nosuchdomain.co.uk>
	<20040629143238.GD6335@luna.mooo.com>
	<16609.43579.336662.194984@cerise.nosuchdomain.co.uk>
	<20040630013316.GF9412@luna.mooo.com>
	<40E32513.1090502@comcast.net>
	<16611.16213.876963.610967@cerise.nosuchdomain.co.uk>
	<20040701032226.GB3419@luna.mooo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20040701032226.GB3419@luna.mooo.com>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Micha Feigin <michf@post.tau.ac.il>
Cc: linux-c-programming <linux-c-programming@vger.kernel.org>


Micha Feigin wrote:

> > The key point is that C++ appears to treat initialised "static const"
> > members as compile-time constants, not as lvalues. Thus, they don't
> > exist in any object file, and so the problem of them existing in
> > multiple object files doesn't arise.
> 
> That can't be true; What happens if the static int value is defined in
> another file? it's value won't be known at compile time, only at link
> time.

By "initialised", I'm referring to the situation where they are
initialised in the class declaration. See my previous example.

> What g++ may be doing is ignoring the problem of multiple
> definitions if they have the same value.

No.

The class declaration doesn't cause any lvalues to be created. There
are no definitions in the object file. Try it.

> It does allow initializing array size using static const, unlike gcc, I
> don't know the mechanism, but I believe it also requires linker
> support, not only compiler.

No.

In most situations, the size of an array has to be known at compile
time. If the array is a local variable, its size will affect the the
frame offsets of any local variables which are below it in the stack
frame. If the array is a structure field, its size will affect the
size of the structure. If you multiply by sizeof(array), the compiler
will often generate different code depending upon whether
sizeof(array) is a power of two. And so on.

The only exceptions are in declarations where you don't need to
specify the size, e.g.:

	extern int array[];
and:
	void foo(int array[]);

Anywhere that you have to specify a size, the size needs to be known
at compile time (variable-sized automatic arrays are permitted in C99,
but not in C89 or C++, although gcc will allow them unless you use
-pedantic; variable-sized global arrays and structure fields aren't
allowed anywhere and aren't supported by gcc).

> I compiled a sample program with a static const int val = 10; and then
> ran nm on it and in the output:
> 
> a.out:080484c4 r val
> 
> so the value is in the object, read only data if I recall the section
> symbols correctly.

That's a variable definition, not a class declaration.

Here's a concrete example:

	$ cat foo.cc
	#include <stdio.h>
	
	class Foo
	{
	public:
		static const int DEFSIZE = 100;
	};
	
	int main(void) {
		printf("%d\n", Foo::DEFSIZE);
		return 0;
	}

	$ g++ -c -ansi -pedantic -Wall foo.cc
	$ nm foo.o
	00000000 T main
	         U printf
	$ g++ foo.o
	$ ./a.out 
	100

If you try to use Foo::DEFSIZE as an lvalue (e.g. taking its address),
you will get a link error unless you actually add a definition for it. 
But you can use it as a value without supplying a definition, and
nothing will appear in the object file. Also, if it's initialised in
the declaration, you can omit the initialiser from any subsequent
definition, i.e.:

	$ cat foo.cc
	#include <stdio.h>
	
	class Foo
	{
	public:
		static const int DEFSIZE = 100;
	};
	
	const int Foo::DEFSIZE;
	const int *ptr = &Foo::DEFSIZE;
	
	int main(void) {
		printf("%d\n", *ptr);
		return 0;
	}

	$ g++ -ansi -pedantic -Wall foo.cc
	$ ./a.out
	100

-- 
Glynn Clements <glynn.clements@virgin.net>
