From: "Steve Graegert" <graegerts@gmail.com>
Subject: Re: Need for const in function argument list
Date: Sun, 26 Mar 2006 15:38:43 +0000
Message-ID: <6a00c8d50603260738u2a0b35eau90fb22d93b16e289@mail.gmail.com>
References: <200603261614.39708.samjnaa@gmail.com>
	 <6a00c8d50603260257u18642532l7b88ae11c86e46cb@mail.gmail.com>
	 <200603261908.36723.samjnaa@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <200603261908.36723.samjnaa@gmail.com>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

On 3/26/06, Shriramana Sharma <samjnaa@gmail.com> wrote:
> Sunday, 26 March 2006 16:27 samaye, Steve Graegert alekhiit:
> 
> > Because the format (the string to display) is provided as a constant
> > expression and it is not being modified:
> > 	printf("%s\n", "abc");
> > 	printf("%s\n", mystring);
> > In both cases the format argument is a constant string.
> 
> Why, the following works as well:
> 
> #include "stdio.h"
> void main(void)
> {
> 	char s[10] = "\n%s\n\n";
> 	printf(s, "hello");
> }
> 
> Here s is not a const char *. It is a variable char *. That actually
> compiled  and executed. 

Yes, it compiles and why should it not do so?  It's a __string constant__, since it cannot be changed in any way.  It's effectively the same as the statement

	char *s = "\n%s\n\n"

The situation is different with malloc(2).  It allows for dynamic allocation of memory, thus turning string constants into dynamic data structures:

	char * s;
	s = (char *) malloc(100);

Every string inside double quotes (" ") is a character constant.
 
	\Steve

