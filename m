From: Stephen Satchell <list@fluent2.pyramid.net>
Subject: Re: value assignment
Date: Tue, 10 Sep 2002 08:39:33 -0700
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <5.1.0.14.0.20020910081139.0268ad90@fluent2.pyramid.net>
References: <20020910235856.25bd3fd3.codex@telkom.net>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20020910235856.25bd3fd3.codex@telkom.net>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Codex <codex@telkom.net>, Linux-C-Programming <linux-c-programming@vger.kernel.org>

At 11:58 PM 9/10/02 +0700, Codex wrote:
>hey i never know what kind assignment is this in C, kindof strange i
>don't get it at all, i somehow know this when doing <termios.h>
>
>pterm.iflag &= ~(IGNBRK | INLCR)
>
>what the hell is '&=' and '~(...)', what does '(...)' does anyway..?,
>wasn't '|' means OR..?

<left> &= <right>  is equivalent to <left> = <left> & <right>  K&R 2nd Ed. 
page 50

| is bit-wise inclusive or.  ibid at page 48

~ is ones complement.  ibid at page 48

(...) form a sub-expression, in which at execution time the stuff inside 
the parens are calculated first.  ibid at page 53.

So, reading the statement from innermost to outermost, it goes like this:
1)  Calculate the inclusive OR of symbols IGNBRK and INLCR.  (Because these 
symbols represent constants and not variables in this context, the compiler 
will perform this operation at compile time.)
2)  Take the ones-complement of the value calculated in (1).  Because the 
above calculation involves only constants, this operation will also be 
performed at compile time.
3)  Calculate the AND of the value calculated in (2) and pterm.iflag.
4)  Store the result of (3) into pterm.iflag.

For single-address stack-oriented machines, the approximate code generated 
would be:

      LoadConstant Compile-time-value-of-(2)
      AND pterm.iflag
      STORE pterm.iflag

If you don't have a copy of Kernighan and Ritchie's _The C Programming 
Language_ (Prentiss-Hall, ISBN 0-13-110362-8) then I suggest you run, not 
walk, to your nearest bookstore and pick up a copy.  Or Amazon if you 
prefer to shop online, at 
http://www.amazon.com/exec/obidos/ASIN/0131103628/qid=1031671821/sr=2-1/ref=sr_2_1/103-8245374-9473450.

There is no excuse for any student trying to pick up the C language lacking 
a copy of this relatively inexpensive textbook, as it still serves as the 
"standard" for practitioners.  (The ANSI standard is almost unreadable.)

Get it, and READ pages 1 through 190.  Several times.  DON'T skim.

Stephen Satchell

