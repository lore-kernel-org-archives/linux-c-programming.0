From: Glynn Clements <glynn.clements@virgin.net>
Subject: RE: const char * vs char[]
Date: Tue, 23 Mar 2004 20:37:25 +0000
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <16480.40965.341202.697242@cerise.nosuchdomain.co.uk>
References: <20040323151902.000048da.cialdi@firenze.net>
	<000f01c410e6$6d7197e0$0c81640a@aca.org.ar>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <000f01c410e6$6d7197e0$0c81640a@aca.org.ar>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: mariano_moreyra@aca.org.ar
Cc: 'Massimiliano Cialdi' <cialdi@firenze.net>, 'linux-c-programming' <linux-c-programming@vger.kernel.org>


Mariano Moreyra wrote:

> No... "char*" and "char []" are synonyms.

They aren't equivalent in the general case, only when declaring
function arguments.

> But in this case, you were having a warning because you were passing a
> "const char *" to a function that expected a "char *" so the warning was
> about the "const" qualifier.
> If you have a code like this you wont have any warning at all
> 
> #include <stdio.h>
> char *str = "pippo";    <---- Note there is no "const" quailfier anymore

Whilst this may be legitimate from the perspective of the language
specification, it's less than ideal, as "str" is being initialised to
pointing at immutable storage.

With the above definition, the code:

	*str = '\0';

won't generate a type error at compile time, but it will probably
segfault at run time (unless you used gcc's -fwritable-strings switch
(or the equivalent for whichever compiler you are using).

> void stampa(char s[])
> {
>  printf("%s\n", s);
> }

Given that the array isn't being modified, the argument should be
declared with the "const" qualifier. Doing so would allow you to pass
a "const char *" or "const char []" to it without the need for an
explicit type cast.

More generally, the "const" qualifier should only be omitted when the
function can actually modify the data to which the argument points.

-- 
Glynn Clements <glynn.clements@virgin.net>
