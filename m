From: James Colannino <james@colannino.org>
Subject: Re: Code critique: checking for syntax errors
Date: Mon, 23 Jan 2006 11:47:34 -0800
Message-ID: <43D532D6.9050204@colannino.org>
References: <43D2870C.3030505@colannino.org> <43D35194.4050206@ajp-services.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <43D35194.4050206@ajp-services.net>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-c-programming@vger.kernel.org

Jesse Ruffin wrote:

> If you can at all manage it, and most times you can, put all of your
> variable declarations right at the beginning of the function. This also
> implies moving your debug statements below them as they will be compiled
> in sometime. Doing so will aid in portability to older, or more strict,
> compilers.


Do stricter and older compilers complain if variables aren't declared at 
the beginning of the function?

> And try extra hard to avoid variable declarations in the loop
> definition, as this is often seen as an error by compilers unless you
> are using the C99 standard.


Actually, I was banking on the C99 standard (I guess perhaps it would 
have been wise for me to say so when I posted the code.)

>
> Multiple locations:
> | if (ungetc(character, input) == NULL) {
>
> ungetc() returns an EOF on error[...]


You're right.  I changed that :)

> C defines two values, EXIT_SUCCESS and EXIT_FAILURE, that should be used
> for the exit() value. These will pass the proper value to the host
> environment. As that value may differ, you should use them to make your
> code as portable as possible.


I can understand EXIT_FAILURE, but why do all the C books tell you to 
return 0 instead of EXIT_SUCCESS?  I always thought that both return() 
and exit() did the same basic thing, so I'm confused as to why a book 
teaching how to write portable code would say to simply use 0 (that's 
with return() and not exit().)  I have implemented exit(EXIT_FAILURE) 
instead of exit(1).

>
> Once again, I think that this is good code overall. It's good to see
> people being careful and using extra parenthesis and braces, rather than
> hunting down logic bugs caused by a lack of them.


Thanks.  I do try hard to be explicit and to comment when necessary.  I 
still have a lot of work to do, but hopefully I'm getting there.

James

-- 
My blog: http://www.crazydrclaw.com/
My homepage: http://james.colannino.org/

"If Carpenters made houses the way programmers design programs, the first woodpecker to come along would destroy all of civilization." --Computer Proverb

