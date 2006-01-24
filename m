From: James Colannino <james@colannino.org>
Subject: Re: Code critique: checking for syntax errors
Date: Mon, 23 Jan 2006 18:06:56 -0800
Message-ID: <43D58BC0.5000106@colannino.org>
References: <43D2870C.3030505@colannino.org> <43D35194.4050206@ajp-services.net> <43D532D6.9050204@colannino.org> <43D55A90.7030501@ajp-services.net> <43D55FEB.2070909@colannino.org> <43D57873.10005@ajp-services.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <43D57873.10005@ajp-services.net>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-c-programming@vger.kernel.org

Jesse Ruffin wrote:

> If you want to see gcc do ANSI c, try:
>
> gcc -Wall -ansi -pedantic
>
> The pedantic is necessary to get some extra warnings about ANSI issues.


Interesting.  I've modified my code so that it compiles with no errors 
or warnings using the options you've mentioned above.  Thanks for the 
info  :)

James

-- 
My blog: http://www.crazydrclaw.com/
My homepage: http://james.colannino.org/

"If Carpenters made houses the way programmers design programs, the first woodpecker to come along would destroy all of civilization." --Computer Proverb

