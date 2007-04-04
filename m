From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: Function pointers to inline functions
Date: Wed, 4 Apr 2007 19:23:55 +0100
Message-ID: <17939.60731.269679.612012@cerise.gclements.plus.com>
References: <4613DBC2.8060708@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <4613DBC2.8060708@gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Shriramana Sharma <samjnaa@gmail.com>
Cc: linux-c-programming@vger.kernel.org


Shriramana Sharma wrote:

> As per my understanding, an inline function is replaced in place by the 
> compiler with the body of the function, so it does not have a separate 
> location in memory in contrast with a regular function. This being so, 
> how is it possible to extract a pointer to an inline function and 
> effectively use it?
> 
> See the attached two examples. They work and though it's a good thing 
> for my project that I can extract a pointer to an inline function I do 
> not understand how it is possible.

If you declare a function as "inline", the compiler will typically add
a normal definition as well as inlining it. If you declare a function
as "static inline", the compiler may omit the normal definition.

Also, inlining is only performed if the corresponding optimisations
are enabled. Note the following gcc options:

`-fno-inline'
     Don't pay attention to the `inline' keyword.  Normally this option
     is used to keep the compiler from expanding any functions inline.
     Note that if you are not optimizing, no functions can be expanded
     inline.

`-finline-functions'
     Integrate all simple functions into their callers.  The compiler
     heuristically decides which functions are simple enough to be worth
     integrating in this way.

     If all calls to a given function are integrated, and the function
     is declared `static', then the function is normally not output as
     assembler code in its own right.

     Enabled at level `-O3'.

`-finline-limit=N'
     By default, GCC limits the size of functions that can be inlined.
     This flag allows the control of this limit for functions that are
     explicitly marked as inline (i.e., marked with the inline keyword
     or defined within the class definition in c++).  N is the size of
     functions that can be inlined in number of pseudo instructions
     (not counting parameter handling).  The default value of N is 600.
     Increasing this value can result in more inlined code at the cost
     of compilation time and memory consumption.  Decreasing usually
     makes the compilation faster and less code will be inlined (which
     presumably means slower programs).  This option is particularly
     useful for programs that use inlining heavily such as those based
     on recursive templates with C++.

     Inlining is actually controlled by a number of parameters, which
     may be specified individually by using `--param NAME=VALUE'.  The
     `-finline-limit=N' option sets some of these parameters as follows:

    `max-inline-insns-single'
          is set to N/2.

    `max-inline-insns-auto'
          is set to N/2.

    `min-inline-insns'
          is set to 130 or N/4, whichever is smaller.

    `max-inline-insns-rtl'
          is set to N.

     See below for a documentation of the individual parameters
     controlling inlining.

     _Note:_ pseudo instruction represents, in this particular context,
     an abstract measurement of function's size.  In no way, it
     represents a count of assembly instructions and as such its exact
     meaning might change from one release to an another.

`-fkeep-inline-functions'
     Even if all calls to a given function are integrated, and the
     function is declared `static', nevertheless output a separate
     run-time callable version of the function.  This switch does not
     affect `extern inline' functions.

-- 
Glynn Clements <glynn@gclements.plus.com>
