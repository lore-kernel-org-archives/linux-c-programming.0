From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: Need for const in function argument list
Date: Sun, 26 Mar 2006 17:27:55 +0100
Message-ID: <17446.49419.665743.127524@cerise.gclements.plus.com>
References: <200603261614.39708.samjnaa@gmail.com>
	<6a00c8d50603260257u18642532l7b88ae11c86e46cb@mail.gmail.com>
	<200603261908.36723.samjnaa@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <200603261908.36723.samjnaa@gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Shriramana Sharma <samjnaa@gmail.com>
Cc: Linux C Programming List <linux-c-programming@vger.kernel.org>


Shriramana Sharma wrote:

> > Because the format (the string to display) is provided as a constant
> > expression and it is not being modified:
> > 	printf("%s\n", "abc");
> > 	printf("%s\n", mystring);
> > In both cases the format argument is a constant string.
> 
> Why, the following works as well:
> 
> #include "stdio.h"
> void main(void)
> {
> 	char s[10] = "\n%s\n\n";
> 	printf(s, "hello");
> }
> 
> Here s is not a const char *. It is a variable char *. That actually compiled 
> and executed. So probably it's only because the printf *function* does not 
> change the value (and *should* not change the value during parsing, I 
> presume).

If a pointer parameter is declared as const, you can pass either const
or non-const pointers. If it isn't declared as const, then you can
only pass non-const pointers, not const pointers.

When applied to function parameters, const indicates that the function
will not modify the data to which it points. The absence of const
indicates that the function may modify the data, and thus you cannot
pass a pointer to immutable data.

When applied to variables (lvalues), const indicates that the data
should not be modified by anything. Attempts to modify it (either
directly or by passing a pointer as a non-const parameter) will
generate a warning, and the data itself may be stored in a read-only
memory segment.

Pointer types should always be declared as const unless you actually
need to modify the data.

Similarly, if you aren't going to modify an array, it should be
declared as const (or static const for a local variable), e.g.:

	static const char s[] = "\n%s\n\n";

Doing so will cause the compiler to place the array in the rodata
section. The rodata section is mapped read-only, and one copy is
shared by all processes using the executable (or shared library),
rather than needing one copy for each process.

For local variables, using "static const" eliminates the need to copy
the string into the array at run-time. For a function which is called
frequently, this will improve performance.

-- 
Glynn Clements <glynn@gclements.plus.com>
