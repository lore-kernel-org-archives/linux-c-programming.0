From: James Colannino <james@colannino.org>
Subject: Re: glibc: realloc(): invalid next size
Date: Thu, 20 Jul 2006 23:10:40 -0700
Message-ID: <44C06FE0.9000300@colannino.org>
References: <44C01B7E.4070308@colannino.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <44C01B7E.4070308@colannino.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Linux C Programming List <linux-c-programming@vger.kernel.org>

James Colannino wrote:

> Hey everyone.  I'm having great difficulty debugging a function of mine 
> that adds more memory as needed when reading variable length lines.
> 
> When I run the code, it always fails after readline() calls addmemory() 
> for the second time (no matter how I change linebuf->buflen, or don't 
> change it...) If readline only has to call addmemory() once, no matter 
> what the size of memory being passed is, it works.[...]

I found the bug (for what it's worth.)  It was very subtle, but it 
caused catastrophic results at runtime.  Notice line 6 below (I numbered 
them.)  This is the while loop in readline().  It says that it should 
start counting down again from linebuf->buflen elements after the 
reallocation.  The problem is, half of those spaces are already filled, 
so when I start counting down again from such a high number, forgetting 
that half is already filled, I think I must blow away bookeeping 
information stored by the memory allocator, thus, while the first call 
to realloc() is successful, the second one isn't.

I changed that line of code to:
6: buflen = linebuf->buflen - bufcount;

That way, it makes sure to take into account those spaces which have 
already been used.  This code when compiled runs perfectly.  Sorry for 
the noise to the list.  I honestly have been banging my head over this 
one and really couldn't find a good solution (I was starting to suspect 
something was up with glibc, which probably wasn't very bright :-P), 
otherwise I wouldn'tve asked the question.


>1:    while ((c = getc(linebuf->fp)) != EOF) {
>2: 
>3:       if (buflen <= 2) {            /* need more memory */
>4:          bufcount = bufpos - start;
>5:          start = addmemory(linebuf);
>6:          buflen = linebuf->buflen;
>7:          bufpos = start + bufcount;
>8:       }
>9: 
>10:      *(bufpos++) = c;
>11:      buflen -= 1;
>12: 
>13:      if (c == '\n') {              /* we're done with one line */
>14:        *bufpos = '\0';
>15:         break;
>16:      }
>17:   }

James
-- 
My blog: http://www.crazydrclaw.com/
My homepage: http://james.colannino.org/

"Black holes are where God divided by zero." --Steven Wright
