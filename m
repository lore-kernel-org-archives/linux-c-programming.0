From: James Colannino <james@colannino.org>
Subject: Re: comparing char to other known char's
Date: Thu, 23 Jun 2005 13:40:05 -0700
Message-ID: <42BB1E25.1050500@colannino.org>
References: <42B9F2C7.2030205@colannino.org> <200506231610.55260.adix@vendio.ro>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <200506231610.55260.adix@vendio.ro>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

Adrian Popescu wrote:
> On Thursday 23 June 2005 02:22, James Colannino wrote:
> 
>>Hey everyone.  I hope this isn't a stupid question.  I've been googling
>>around trying to find a function that I can use but haven't been
>>successful.  Here's what I want to be able to do:
>>
>>let's say I have a char called 'character.'  I want to compare
>>'character' to see if it's any one of the characters in a list.  For
>>example, maybe I would want to test character to see if it's either 'e',
>>'r', '*', etc.
>>
>>Is this easy enough to implement?  I could do if (character == 'e' ||
>>character == [...] and so on and so forth, but this seems much to
>>tedious and unreadable to be my only solution.  If anyone has any ideas
>>I'd be extremely grateful :)  Thanks very much in advance.
>>
>>James
> 
> 
> the way you put it ( if (character == 'e' || ....) ; it is TRUE if 
> any (or only one) from those chars exists ; 

I know.  That's what I wanted.  Basically, I want to check to see if
each character in a string matches any one of an illegal set of
characters.  Thus, the function would fail if it encountered an illegal
character in the string.

James
-- 
My blog: http://www.crazydrclaw.com/
My homepage: http://james.colannino.org/

" Those who would give up essential Liberty, to purchase a little
temporary Safety, deserve neither Liberty nor Safety." --Benjamin Franklin
