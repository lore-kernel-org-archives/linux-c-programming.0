From: "Huber, George K RDECOM CERDEC STCD SRI" <George.K.Huber@us.army.mil>
Subject: RE: Into the Void
Date: Tue, 1 Feb 2005 10:32:55 -0500
Message-ID: <D2AA47A6FB2C1A48AF0526440C0F245CAA3634@monm207.nae.ds.army.mil>
Mime-Version: 1.0
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: 'Amit Dang' <amit_dang@intersolutions.stpn.soft.net>, linux-c-programming@vger.kernel.org

Amit wrote:

>Hi George, I was just going through the code. In second code, line
>((char*)memcpy((void*)*in_buf, out_buf, 4))[4] = '\0';
>why does (void *)*in_buf returns NULL. I tried typecasting different type of
>pointers and its always NULL.

Because it is NULL :-).

Seriously, lets forget about type-casting for a moment and just concentrate 
on the first term as written:

         *in_buf

Now consider what this means.  In english, we would read this as "dereference 
in_buf", or in other words "get the value in the memory address that is 
contained in the variable in_buf".  But what memory address does in_buf
contain, and more importaintly what is stored at the memory address?

In the code, I wrote this:

======================================================================
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define BUF_LEN 6

int main()
{
    char*   in_buf = malloc(BUF_LEN*sizeof(char));
    char*   out_buf = malloc(BUF_LEN*sizeof(char));
    strcpy(out_buf, "Test");
    ((char*)memcpy((void*)*in_buf, out_buf, 4))[4] = '\0';
...
=======================================================================

So we see that in_buf contains the address of a memory location that will
hold a character, pictorially (excuse the ASCII art, and assuming that the 
size of a character is one byte).

       2004   2005   2006   2007   2008   2009    <---- hypothetical addresses
      +------+------+------+------+------+------+
      |  1   |      |      |      |      |      |
      | byte |      |      |      |      |      |
      +------+------+------+------+------+------+
      ^
      |
      |
      in_buf

So from the picture, in_buf would contain the value of `2004' and *in_buf 
would be asking for the value currently in memory location 2004.  But what 
is in there?  Well we have not put anything in that memory location yet, and
as I recall, under Linux any memory is zero-out when returned by malloc to
help prevent information leakage from one application to another.  So while
we have not put anything in that memory address, malloc has initialized it
to 0 for us.  Thus *in_buf will return zero (and since NULL is 0, we can 
also think of getting NULL).

Now with this, lets think about the original line of code:

   ((char*)memcpy((void*)*in_buf, out_buf, 4))[4] = '\0';

and lets think about what happens when this line is executed.  First *in_buf
is evaluated and returns NULL (or 0).  This is then type-cast into a void 
pointer (remembering that NULL is a valid pointer value so the type cast 
works just fine).  Finally the contents of memory starting at out_buf is 
attempeted to be copied to the memory location starting at 0 - thus the 
segmentation fault.

Finally, consider the warning that compiling the code gives:

warning: cast to pointer from integer of different size

Lets see if we can understand where this is coming from.  First, under IA-32 Linux
pointers are 32-bit unsigned integer values.  Now when we do a dereference on in_buf
we get back a single byte (assuming characters a single byte quantities) or an 8-bit
vaule.  So the expression `(void*)*in_buf' is attempting to take an 8-bit value and
make it a 32-bit pointer.  The converion 8-bit integer to 32-bit integer is allowed and 
will happen transparently (in most cases) because there is not loss of data.  However 
the compiler is warning us that in this case a pointer is involved which is 
probably not what we want. 

Hope this helps,
George
