From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: Multiple declaration problem
Date: Wed, 7 Mar 2007 16:36:22 +0000
Message-ID: <17902.59910.484568.696304@cerise.gclements.plus.com>
References: <45E05E83.5010005@gmail.com>
	<45E5A06B.8050300@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <45E5A06B.8050300@gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Shriramana Sharma <samjnaa@gmail.com>
Cc: linux-c-programming@vger.kernel.org


Shriramana Sharma wrote:

> I found a different solution, which is by declaring the variables 
> static. Find attached solutions.
> 
> But still the C parser (or what is it?) did throw up an error with the
> const variable, which C++ did not.

In C, "const" is only valid for pointer and array targets, not for
primitive types or structures.

> @Andre: Is there any I should not declare a variable in a header file if
> I want that variable to be visible to many cpp files? I can avoid
> writing many "extern" lines by using static.

Presumably, you mean "define a variable"; a declaration (e.g.
"extern int foo") merely tells the compiler that the variable exists,
and its type, while a definition actually creates the variable.

If you define a variable in a header file, each object file will get a
separate copy of the variable. All of the variables will have the same
name, but they will be different variables; modifying one won't affect
any of the others.

This is fine for a constant (unless it occupies a lot of memory, in
which case you don't want to include a separate copy in each object
file), but not for a variable.

-- 
Glynn Clements <glynn@gclements.plus.com>
