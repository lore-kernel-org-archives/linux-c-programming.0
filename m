From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: Function pointers to inline functions
Date: Fri, 25 May 2007 23:41:23 +0100
Message-ID: <18007.26131.433749.106380@cerise.gclements.plus.com>
References: <4613DBC2.8060708@gmail.com>
	<17939.60731.269679.612012@cerise.gclements.plus.com>
	<46566CC5.6080904@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <46566CC5.6080904@gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Shriramana Sharma <samjnaa@gmail.com>
Cc: linux-c-programming@vger.kernel.org


Shriramana Sharma wrote:

> > If you declare a function as "inline", the compiler will typically add
> > a normal definition as well as inlining it. If you declare a function
> > as "static inline", the compiler may omit the normal definition.
> 
> Would the static keyword in such a case also restrict the visibility of 
> that inline function to that file only?

A function can only actually be inlined in the translation unit
(source file plus any #include'd files) in which it occurs.

That's why you need "static inline" to eliminate the normal
definition. A non-static inline function has to have an implementation
in the object file so that it can be called from other object files.

> I mean, if I use -fkeep-inline-functions to get the function output in 
> the object file, and if the static keyword also meant that the function 
> is visible only in the translation unit in which it appears, then 
> -fkeep-inline-functions would be rendered useless, since the only 
> conceivable (to me) purpose of outputting a run-time callable version of 
> an inline function is to make it available to callers from *outside the 
> translation unit*, such as a programmer using a library.
> 
> (In fact, I think the *only* conceivable use-case would be someone using 
> a library since another translation unit in the same project as the one 
> containing the inline function can very well use the definition of the 
> inline function to directly inline the code into the caller

No, the compiler can only inline functions which are defined in the
same translation unit. Inlining requires source code, and the compiler
only has access to the source code for the current translation unit.

> -- why would 
> they want a separate runtime callable version in that case? So the only 
> valid case is a programmer using a library but not having access to the 
> actual definition of an inline function via the API.)
> 
> So I presume that when static is used with inline, it does not retain 
> its meaning of "local to this translation unit". Am I right?

No, "static" retains its original meaning.

There aren't many uses for -fkeep-inline-functions; the only one I can
think of right now is if you want to be able to call the function from
within a debugger (you can't call an inline function from a debugger).

-- 
Glynn Clements <glynn@gclements.plus.com>
