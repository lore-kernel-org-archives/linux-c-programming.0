From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: Something interesting with multi-subscript arrays.
Date: Wed, 26 May 2004 21:00:37 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <16564.63333.27932.493872@cerise.nosuchdomain.co.uk>
References: <002c01c44336$5d420800$0200a8c0@LAPTOP>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <002c01c44336$5d420800$0200a8c0@LAPTOP>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Chao <teanau@singnet.com.sg>
Cc: linux-c-programming@vger.kernel.org


David Chao wrote:

> I happen to learn something interesting abt multiple-subscript arrays at
> work today. I am hoping if someone can confirm what I discovered. Having
> done a fair amt of C programming, I always thought that arrays like:
> 
> unsigned char a[2][3];
> 
> can be accessed using like that:
> 
> unsigned char **b;
> 
> b=a;

They aren't the same thing. a is an array of 2 arrays of 3 characters;
b is a pointer to (one or more) pointers to (one or more) characters.

Arrays are passed by reference, so when "a" is used as an expression,
it is a pointer to (one or more) arrays of characters.

Both can be accessed using the same notation, i.e. a[i][j] and
b[i][j], but they aren't the same thing.

> Then using *(*(b+1)+1) (for eg.) to access the array. Since, isn't this
> equivalent to a[1][1]?

No. a[i] is an array of 3 characters, while b[i] is a pointer to (one
or more) characters. E.g. sizeof(a[i]) is 3, while sizeof(b[i]) will
typically be either 4 or 8 (depending upon whether pointers are 32 or
64 bits).

The following would work:

	unsigned char (*b)[3] = a;

So would:

	unsigned char *b[2];
	b[0] = a[0];
	b[1] = a[1];

So would:

	unsigned char **b = malloc(2 * sizeof(char *));
	b[0] = a[0];
	b[1] = a[1];

In all cases, a[i][j] and b[i][j] would refer to the same memory
locations.

> However, I am totally wrong! b=a generates a surprise compiler error.

Yep. Pointer type mismatch. In this context, a has type "pointer to
array(s) of 3 characters" while b has type "pointer to pointer(s) to
character(s)".

> I
> spent quite sometime to resolve this error. To cut a long story short, I
> found another interesting fact. This code:
> 
> #include <stdio.h>
> 
> int main(void)
> {
>     unsigned char a[2][3] = {{'a','b','c'},
>                              {'d','e','f'}};
>     unsigned char (*b)[3];

That's OK.

>     b = a;
> 
>     printf("%d\n", b);
>     printf("%d\n", *b);
>     printf("%d\n", **b);
>     printf("%c\n", **b);
>     system("PAUSE");
>     return 0;
> }
> 
> gives the result:
> 
> 2293592
> 2293592
> 97
> a
> Press any key to continue . . .
> 
> This means that *b does nothing at all in this case.

In this case, "b" is an alias for "&a[0]" (or just "a"), while "*b" is
an alias for "&a[0][0]". IOW, "b" points to the first array, while
"*b" points to the first element of the first array. Both of these are
at the same place in memory (the address of the first element of an
array is, obviously, equal to the address of the array itself), but
the first is larger (sizeof(*b) is 3, sizeof(**b) is 1).

> Surprise!

Not to anybody who actually understands pointers and arrays.

> Learn something new everyday.

If this is new to you, I suggest getting hold of a copy of:

	The C Programming Language (Second Edition)
	Brian W Kernighan & Dennis M Ritchie
	Prentice Hall

and reading chapter 5 (entitled "Pointers and Arrays").

-- 
Glynn Clements <glynn.clements@virgin.net>
