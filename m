From: Steve Graegert <graegerts@gmail.com>
Subject: Re: proper declaration/definition of inline functions?
Date: Wed, 3 Aug 2005 08:08:51 +0200
Message-ID: <6a00c8d505080223085b689518@mail.gmail.com>
References: <Pine.LNX.4.63.0508021501100.29269@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.63.0508021501100.29269@localhost.localdomain>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Robert P. J. Day" <rpjday@mindspring.com>
Cc: C programming list <linux-c-programming@vger.kernel.org>

On 8/2/05, Robert P. J. Day <rpjday@mindspring.com> wrote:
> 
>  what is the proper usage of inline functions?  would you first
> declare it inline in a header file, and also define it inline in the
> corresponding source file?  (yes, i know the compiler is under no
> obligation to inline them ... i just want to know the canonical way to
> use them.)
Robert,

Inline functions always have internal linkage, that is they cannot be
seen outside of their translation unit.  So you cannot prototype them
in a header file and put the code in a .cpp file someplace.  Put the
code in the header file, so it will be included into every translation
unit where it is needed.

In C++ a general approach to using inline functions is to declare and
define them as usual:

	class C {
	public:
		inline void func();
	};
	
	inline void C::func() {
		// Do some work here
	}

Please not that member functions don't need to be inlined explicitly. 
The code above is practically the same as:

	class C {
	public:
		void func() {
			// Do some work here
		}
	};

A C++ compiler usually tries to inline member functions automatically
and decides on its own whether inlining is feasible or not.

When inlining C functions there are two major techniques known to me. 
One way is to adhere to the C99 recommendation and use the inline
keyword in conjunction with extern:

	/* myheader.h */
	inline int add(int a, int b) {
		return (a + b);
	}
	
	/* translation unit */
	#include "myheader.h"
	extern int add(int a, int b);


The other approach is known as the "GNU C inlining model" that simply
defines the inline function in a common header via extern and includes
it in only _one_ source file

	/* myheader.h */
	#ifndef INLINE_DECL
	#  define INLINE_DECL extern inline
	#endif
	INLINE_DECL int add(int a, int b) {
		return (a + b);
	}
	
	/* translation unit */
	#define INLINE_DECL
	#include "myheader.h"

Finally, you can easily inline functions as static in a common header file

	static inline int add(int a, int b) {
		return (a + b);
	}

but to support legacy compilers you will have to provide the
preprocessor directive -DINLINE="" to remove the inline keyword wich
is not part of ANSI C.

Regards

	\Steve
