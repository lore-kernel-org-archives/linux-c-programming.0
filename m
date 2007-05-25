From: Shriramana Sharma <samjnaa@gmail.com>
Subject: Re: Function pointers to inline functions
Date: Fri, 25 May 2007 10:27:41 +0530
Message-ID: <46566CC5.6080904@gmail.com>
References: <4613DBC2.8060708@gmail.com> <17939.60731.269679.612012@cerise.gclements.plus.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <17939.60731.269679.612012@cerise.gclements.plus.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Glynn Clements <glynn@gclements.plus.com>
Cc: linux-c-programming@vger.kernel.org

Glynn Clements wrote:
> If you declare a function as "inline", the compiler will typically add
> a normal definition as well as inlining it. If you declare a function
> as "static inline", the compiler may omit the normal definition.

Would the static keyword in such a case also restrict the visibility of 
that inline function to that file only?

I mean, if I use -fkeep-inline-functions to get the function output in 
the object file, and if the static keyword also meant that the function 
is visible only in the translation unit in which it appears, then 
-fkeep-inline-functions would be rendered useless, since the only 
conceivable (to me) purpose of outputting a run-time callable version of 
an inline function is to make it available to callers from *outside the 
translation unit*, such as a programmer using a library.

(In fact, I think the *only* conceivable use-case would be someone using 
a library since another translation unit in the same project as the one 
containing the inline function can very well use the definition of the 
inline function to directly inline the code into the caller -- why would 
they want a separate runtime callable version in that case? So the only 
valid case is a programmer using a library but not having access to the 
actual definition of an inline function via the API.)

So I presume that when static is used with inline, it does not retain 
its meaning of "local to this translation unit". Am I right?

Shriramana Sharma.

