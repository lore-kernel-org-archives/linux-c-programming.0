From: Alvarez Alberto-AALVARB1 <AALVARB1@motorola.com>
Subject: RE: [jason@txt.com: Re: Problem with "chars"]
Date: Thu, 18 Jul 2002 09:11:33 +0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <75B979779CA1D311808400508B6F40FF05B9BE62@zes06exm01.madrid.ecid.cig.mot.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

Hi all,
	i've always been a "malloc caster", so this had been good news for me.
	But i made a program and compiled it with gcc and g++, just for checking...

	My question raises after compiling a C program with g++ (g++ -v: gcc version 2.95.2 19991024 (release)) for Solaris, as i got this result:

	% g++ probo3.c
	probo3.c: In function `int main()':
	probo3.c:7: ANSI C++ forbids implicit conversion from `void *' in assignment

	while my program is this:

		#include <stdio.h>
		#include <stdlib.h>
	
		int main()
		{
		  char *aux;
		  aux=calloc(2, sizeof(char));
		}

	?Does anyone know the reason for this behaviour? I've always thought that C++ and C were almost the same at this kind of stuff.

Regards,

Alberto Alvarez Besada

Tlf.:        +34 914002155
e-mail.:   aalvarb1@motorola.com
            


> -----Original Message-----
> From: Glynn Clements [mailto:glynn.clements@virgin.net]
> Sent: miercoles, 17 de julio de 2002 20:54
> To: Jason P. Winters; eathan@otenet.gr; xlp@emtel.net.co;
> linux-c-programming@vger.kernel.org
> Subject: Re: [jason@txt.com: Re: Problem with "chars"]
> 
> 
> 
> Glynn Clements wrote:
> 
> > > If you don't cast it, you get a warning message:
> > > 
> > > tst.c: In function `foo':
> > > tst.c:17: warning: assignment makes pointer from integer 
> without a cast
> > 
> > Which should provide a clue that you forgot the prototype, which is
> > normally obtained using:
> > 
> > 	#include <stdlib.h>
> > 
> > An implicit cast between an *integer* (undeclared functions are
> > assumed to return "int") and any pointer *will* generate a warning
> > (unless the integer is a literal zero).
> > 
> > This is exactly *why* you *shouldn't cast* the result of malloc(),
> > because it will hide this problem.
> 
> In retrospect, it's worth mentioning that a more reliable approach is,
> where possible, to explictly enable warnings for undeclared 
> functions. 
> For gcc, this is controlled by the options:
> 
> `-Wimplicit-int'
>      Warn when a declaration does not specify a type.
> 
> `-Wimplicit-function-declaration'
> `-Werror-implicit-function-declaration'
>      Give a warning (or error) whenever a function is used 
> before being
>      declared.
> 
> `-Wimplicit'
>      Same as `-Wimplicit-int' and `-Wimplicit-function-'
>      `declaration'.
> 
> [Note that -Wimplicit is enabled by -Wall.]
> 
> While the "don't cast return types" rule is still useful (it shouldn't
> normally be necessary to cast return types, and may hide problems), it
> won't catch other cases (e.g. if the return value was assigned to an
> "int" variable, no warning would be generated, regardless of what the
> function actually returned).
> 
> -- 
> Glynn Clements <glynn.clements@virgin.net>
> -
> To unsubscribe from this list: send the line "unsubscribe 
> linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
