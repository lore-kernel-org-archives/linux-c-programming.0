From: "Charlie Gordon" <gmane@chqrlie.org>
Subject: Re: Some question about one method.
Date: Tue, 25 May 2004 01:24:49 +0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <c8u049$b00$1@sea.gmane.org>
References: <1085135081.21344.21.camel@relay.localnet> <20040521211714.GP1912@lug-owl.de> <c8sab1$biq$1@sea.gmane.org> <20040524173017.GW1912@lug-owl.de>
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

Hi JBG,

> There are sane uses of sprintf()...

There is almost no overhead to using snprintf.  And it is so difficult to
prove that a given sprintf format cannot overflow...  Just try this one:
what if ints are 64 bits now, is the buffer large enough to accomodate all
these digits ?
Yet there is much worse function : strncpy.  This sucker does NOT do what
you think it does. Pull the man page, read it, read it again... unbelievable
isn't it ? Test it, grep any source files for this buddy, I bet you'll find
subtle bugs stuck to it like fly paper.

> C is (and always was) by experts for experts.
> C's syntax is quite simple, but only people who really
> understand C's pointer and allocation concepts should use it.

I agree completely on this, programming in C is like riding down
the guardrail, except it's more like a razor blade.
It's just so hard to always keep a sharp eye for all the pitfalls one
comes across in even the simplest one liners.

I urge you to get a look at http://www.joelonsoftware.com/
I especially like his "Guerrilla Guide to Interviewing"
(http://www.joelonsoftware.com/articles/fog0000000073.html) :
"I've discovered that understanding pointers in C is not a skill, it's an
aptitude. For some reason most people seem to be born without the part of
the brain that understands pointers. This is an aptitude thing, not a skill
thing - it requires a complex form of doubly-indirected thinking that some
people just can't do."

>> - what is wrong with : enum BOOL { FALSE=0, TRUE=1 };
> (I don't think there's something technically wrong with the enum
> BOOL, but you shouldn't use it except with other enum BOOL
> xxx variables ...)

Well you are going to love this one!
defining BOOLeans TRUE and FALSE as an enum makes them available for
symbolic debugging, but you should still #define them to avoid nasty
surprises with the preprocessor:

#if TRUE
// if you don't, this code will never compile
#endif

> char *a;
> short *b;
> int *c;
> long *d;
> long long *e;
>
> --> What's the difference between a++ and e++?
it makes them point to the next element in the arrays of respective types,
and as such increments the binary value by a different amount.

More interestingly what is the difference between e[5] and 5[e] ?

> struct {
>  char first;
>  char second;
> } s1;
> struct {
>  char both[2];
> } s2;
> what's the difference ?
On most architectures, not much.  But C makes no guaranties as to the actual
layout of structures.
In particular (&s1.second - &s1.first) may be different than 1.
Similarly sizeof(s1) can be different from sizeof(s2).

Glad you found my quiz useful.

Chqrlie.

PS:) did you know about this new C library extension : imprecations
you can pass extra information to some of the C runtime APIs, thus
preventing some of the most annoying problems in C.
for example, memory allocation issues are finally solved :

p = malloc(n), "nofail";
free(p), "pack";
p = realloc(p, newsize), "nomove";

best of all, your compiler most likely already supports imprecations ;-)





