From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: const char * vs char[]
Date: Tue, 23 Mar 2004 12:19:38 +0000
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <16480.11098.887957.24972@cerise.nosuchdomain.co.uk>
References: <20040323130118.00005637.cialdi@firenze.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20040323130118.00005637.cialdi@firenze.net>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Massimiliano Cialdi <cialdi@firenze.net>
Cc: linux-c-programming <linux-c-programming@vger.kernel.org>


Massimiliano Cialdi wrote:

> #include <stdio.h>
> const char *str = "pippo";
> int main(void)
> {
>   void stampa(char s[]);
>   stampa(str);
>   return 0;
> }
> void stampa(char s[])
> {
>  printf("%s\n", s);
> }
> 
> and gcc gives me a warning:
> pippo.c:9: warning: passing arg 1 of `stampa' discards qualifiers from
> pointer target type
> 
> 
> what are the differences between char[] and const char *?

1. char[] is an array while char* is a pointer. There is actually a
difference, although it doesn't matter here: arrays are always passed
by reference, so a declaration of the form:

	void stampa(char s[])

is silently converted to:

	void stampa(char *s)

by the compiler.

2. The variable is declared as "const char *", i.e. a pointer to
constant (unmodifiable) characters, but is being passed to a function
which expects a pointer to (modifiable) characters.

If stampa() doesn't modify the text, declare it as:

	void stampa(const char *s)

If it does modify the text, then your program will segfault, because
string literals are normally stored in non-writable memory (regardless
of whether you include "const" in the variable's declaration).

-- 
Glynn Clements <glynn.clements@virgin.net>
