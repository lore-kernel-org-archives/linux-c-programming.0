From: "Huber, George K RDECOM CERDEC STCD SRI" <George.K.Huber@us.army.mil>
Subject: RE: Into the Void
Date: Thu, 27 Jan 2005 12:58:07 -0500
Message-ID: <D2AA47A6FB2C1A48AF0526440C0F245CAA3633@monm207.nae.ds.army.mil>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: 'Scott' <drmemory@3rivers.net>, "'linux-c-programming@vger.kernel.org'" <linux-c-programming@vger.kernel.org>

Scott wrote:

>Thanks for your help; I actually managed to get the program to compile
>with no errors, but now am getting a segmentation fault which I can't
>track down, so I'll probably be back to plague you folks some more!

Even without seeing your code, I probably can guess what is happening.
Consider the following sample program (with no error checking)

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

    ((char*)memcpy((void*)in_buf, out_buf, 4))[4] = '\0';
  
    printf("%s\n", in_buf);
   
    return 0;
}
======================================================================

The above program compiles cleanly and produces the expected output.

However, if the above program is changed to this:

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
  
    printf("%s\n", in_buf);
   
    return 0;
}
======================================================================

we get a single warning (warning: cast to pointer from integer of 
different size) and the program segfaults when it is run.  

Make sure you are not dereferencing the the first parametere to memcpy.

Also, if the above does not help, try compiling with debugging support 
turned on (i.e. gcc -g ...) and then run the program under gdb.  Using the 
gdb `where' command will show you what line you are seg-faulting on.

Finally, I find it useful to alway compile using the flags "-ansi -pedantic 
-Wall" (or "-std=c99 -pedantic -Wall) and treat any warning as errors.  I 
know it can be a pain-in-the-arse, but I find that it does minimize run-time
errors.

George
