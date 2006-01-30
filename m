From: James Colannino <james@colannino.org>
Subject: Re: Debugging
Date: Mon, 30 Jan 2006 11:21:10 -0800
Message-ID: <43DE6726.9030407@colannino.org>
References: <43DC5EFA.7010001@colannino.org> <20060129105131.6813f695.leslie.polzer@gmx.net> <43DE6555.7010806@colannino.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <43DE6555.7010806@colannino.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-c-programming@vger.kernel.org

James Colannino wrote:

>> Then go about finding the offending line(s) of code.
>> Watch out for obscure tricks, side-effects, wild pointers and illegal 
>> casts.
>> Compile with -Wall and, to enforce your discipline, treat every 
>> warning as
>> -Werror.
>
> Without -Wall, I get no errors (I always do my best to get rid of 
> warnings.)  I'll try it with -Wall though and see what happens.


*embarrased* using -Wall gave me the following error:

database.c:68: warning: implicit declaration of function `close'

That made me realize that I was trying to use the system call open 
instead of the standard library function fclose.  Once I fixed that, the 
code worked both when it was optimized and when it was not.  I think 
from now on I'll be using -Wall ;)  Thanks to everyone who responded.  
I'm glad I don't have to run this through a debugger....yet :)

James

-- 
My blog: http://www.crazydrclaw.com/
My homepage: http://james.colannino.org/

"If Carpenters made houses the way programmers design programs, the first woodpecker to come along would destroy all of civilization." --Computer Proverb

