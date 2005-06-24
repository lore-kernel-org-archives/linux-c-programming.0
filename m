From: James Colannino <james@colannino.org>
Subject: Re: How to prototype functions that return pointers
Date: Fri, 24 Jun 2005 14:50:59 -0700
Message-ID: <42BC8043.9030904@colannino.org>
References: <42BC7A4F.60304@colannino.org> <op.ssv8s2eyizdgzp@mail.nairnconsulting.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <op.ssv8s2eyizdgzp@mail.nairnconsulting.ca>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

Richard Nairn wrote:
> Believe the correct decleration is (char *) readline();
> 
> Order of ops.

That was the next one I tried.  That yielded a syntax error.  I found
out though that the "two or more data types" error was the result of a
more difficult bug to find that had to do with something in another
header file.  Once I fixed that, the declaration char * readline();
worked.  Needless to say I'm very embarassed now... :-P

James
-- 
My blog: http://www.crazydrclaw.com/
My homepage: http://james.colannino.org/

" Those who would give up essential Liberty, to purchase a little
temporary Safety, deserve neither Liberty nor Safety." --Benjamin Franklin
