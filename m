From: "J." <mailing-lists@xs4all.nl>
Subject: Re: *w[1]++ = *[k[1]++; does not work .. ?
Date: Mon, 24 Feb 2003 08:55:16 +0100 (CET)
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.21.0302232200530.10835-100000@hestia>
References: <20030223213034.B21636@neutrino.particles.org>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20030223213034.B21636@neutrino.particles.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

I am sorry, maybe I am not being to bright about this problem. But I still
do not see the clue.

On Sun, 23 Feb 2003, Elias Athanasopoulos wrote:

> On Sun, Feb 23, 2003 at 06:37:08PM +0100, J. wrote:
> > I can print char by char like this: printf("%c", *w[1]++);
> > but I can not copy char by char like this: *w[1]++ = *k[1]++;
> 
> It works.
> 
> >  while(*w[1] != '\0')
> >   *k[1]++ = *w[1]++; 
> 
> You move the pointer while doing the copy, so after the loop it points to
> the terminated null character.

Yes and then everything is copy'd, including the '\0' terminator just like
strcpy(). So k[1] should point to the character string and *k[1] points
to the first charater of the string ... ? 

> You should keep the original address of k[1] before the loop and use it 
> instead. I.e.:

The original address of *k[1] is preserved, only the memory segment
address it points to is incremented. I think...

> 	char *s;
> 	...
> 	s = k[1];
> 
> 	while (...) { ... }
> 	
> 	printf ("%s\n", s);
> 
> You can do the copy more efficiantly using other ways. Check how strcpy()
> works (it exists in K&R, glibc or even inside the kernel).
>
> Elias

Unfortunatly I can't use strcpy(), because I have to tokenze a string into
several sub-slices. One milion text lines (which is nothing), is prox. 14
milion words, is prox. 49 milion tokens. That is 49 milion strcpy's! So
this part could be classifyd as time-critical. I have a strcpy() version
and `gprof'd it. But the results were not very optimal. I was hoping by
just using pointers I could speed it up a little more.

But this is how my brain percieves this issue... Where do I go wrong ?

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(void) {
             //  ___
 char *k[1]; // | 0 | -> 
             // |___|
             // | 1 | ->
             // |___|
             //  ___
 char *w[1]; // | 0 | ->
             // |___|
             // | 1 | ->
             // |___|

 char str[] = "jehova";
 /*
 --- --- --- --- --- --- ---
| j | e | h | o | v | a |\0|
 --- --- --- --- --- --- ---
 */

 w[1] = strdup(str);
 /*
  ___      --- --- --- --- --- --- ---
 | 0 | -> | j | e | h | o | v | a |\0|
 |___|     --- --- --- --- --- --- ---
 | 1 | -> NULL;
 |___|
 */

 k[1] = calloc(strlen(str) + 1, sizeof(char));
 /*
  ___      --- --- --- --- --- --- ---
 | 0 | -> |\0 |\0 |\0 |\0 |\0 |\0 |\0|
 |___|     --- --- --- --- --- --- ---
 | 1 | -> NULL;
 |___|
 */

 // Now for the copy part...
 // Eh.. ?
 while(*w[1] != '\0')
  *k[1]++ = *w[1]++; 

 // now k[1] should be:
 /*
  ___      --- --- --- --- --- --- ---
 | 0 | -> | j | e | h | o | v | a |\0|
 |___|     --- --- --- --- --- --- ---
 | 1 | -> NULL;
 |___|
 */

 // prints nothing....
 printf("%s\n", w[1]);
 printf("%s\n", k[1]);

 return 0;
}

Thank you for your patience...

J.

