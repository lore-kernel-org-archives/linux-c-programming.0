From: Shriramana Sharma <samjnaa@gmail.com>
Subject: Re: Need for const in function argument list
Date: Sun, 26 Mar 2006 19:08:36 +0530
Message-ID: <200603261908.36723.samjnaa@gmail.com>
References: <200603261614.39708.samjnaa@gmail.com> <6a00c8d50603260257u18642532l7b88ae11c86e46cb@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <6a00c8d50603260257u18642532l7b88ae11c86e46cb@mail.gmail.com>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linux C Programming List <linux-c-programming@vger.kernel.org>

Sunday, 26 March 2006 16:27 samaye, Steve Graegert alekhiit:

> Because the format (the string to display) is provided as a constant
> expression and it is not being modified:
> 	printf("%s\n", "abc");
> 	printf("%s\n", mystring);
> In both cases the format argument is a constant string.

Why, the following works as well:

#include "stdio.h"
void main(void)
{
	char s[10] = "\n%s\n\n";
	printf(s, "hello");
}

Here s is not a const char *. It is a variable char *. That actually compiled 
and executed. So probably it's only because the printf *function* does not 
change the value (and *should* not change the value during parsing, I 
presume).

-- 

Tux #395953 resides at http://samvit.org
playing with KDE 3.51 on SUSE Linux 10.0
$ date [] CCE +2006-03-26 W12-7 UTC+0530
