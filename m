From: James Colannino <james@colannino.org>
Subject: Re: Code critique: checking for syntax errors
Date: Mon, 23 Jan 2006 14:59:55 -0800
Message-ID: <43D55FEB.2070909@colannino.org>
References: <43D2870C.3030505@colannino.org> <43D35194.4050206@ajp-services.net> <43D532D6.9050204@colannino.org> <43D55A90.7030501@ajp-services.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <43D55A90.7030501@ajp-services.net>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-c-programming@vger.kernel.org

Jesse Ruffin wrote:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> James Colannino wrote:
> | Do stricter and older compilers complain if variables aren't 
> declared at
> | the beginning of the function?
> | Actually, I was banking on the C99 standard (I guess perhaps it would
> | have been wise for me to say so when I posted the code.)
>
> If you are using a C99 compiler it won't, but older C specifications do
> not allow variable definition anywhere but the beginning or between the
> function declaration and definition (K&R style). Although C99 is gaining
> a lot of ground, I believe that there still are some compilers that
> don't support it at all, and many that don't by default.


What's weird about that is that in order to do variable declarations 
within the definition of a for loop, I need to pass -std=c99 to GCC.  
However, I don't need to do that in order to simply declare variables 
later in the function.  That would lead me to believe that C99 is not 
required to do so.  Could it possibly be a C89 thing?  How far back is 
considered ANSI C?

James

-- 
My blog: http://www.crazydrclaw.com/
My homepage: http://james.colannino.org/

"If Carpenters made houses the way programmers design programs, the first woodpecker to come along would destroy all of civilization." --Computer Proverb

