From: Steve Graegert <graegerts@gmail.com>
Subject: Re: Using realloc()
Date: Sat, 11 Jun 2005 10:08:04 +0200
Message-ID: <6a00c8d5050611010878a7cacb@mail.gmail.com>
References: <42AA7FA5.4040806@colannino.org>
Reply-To: Steve Graegert <graegerts@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <42AA7FA5.4040806@colannino.org>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: James Colannino <james@colannino.org>
Cc: linux-c-programming@vger.kernel.org

On 6/11/05, James Colannino <james@colannino.org> wrote:
> Hey everyone.  I have a question about realloc().  I was hoping to use
> realloc() to allocate more memory to an already existing string, but the
> problem was, I didn't know if the original information would stay intact
> or not after running realloc().  I wrote the following program to test this:
> 
> #include <stdio.h>
> 
> int main() {
> 
>     char *string;
>     size_t size = sizeof(char);
> 
>     string = (char *)malloc(size);
>     string[0] = 'a';
>     string[1] = '\0';
> 
>     printf ("Before realloc(): %p: %s\nsize: %d\n", string, string, size);
> 
>     size = size * 5;
>     string = (char *)realloc(string, size);
> 
>     printf ("After realloc(): %p: %s\nsize: %d\n", string, string, size);
> 
>     return 0;
> }
> 
> The string data stays the same after running realloc(), so at least in
> this circumstance it worked like I had hoped.  However, when printing
> the pointer to the screen, I saw that it didn't change, and I know that
> sometimes realloc() needs to start at a new address in memory which
> means the pointer changes, so my question is, will the original data
> stay intact if this happens?

James,

The data will stay the same.  realloc() takes care.  A new pointer is
returned only if there is not enough contiguous unused memory
available at the starting address given by the pointer to realloc(). 
Just increase the factor in line

        size = size * 5;

to something like 500000 and you will observe the scenario you just described.


Kind Regards

    \Steve

--

Steve Graegert <graegerts@gmail.com>
Independent Software Consultant {C/C++ && Java && .NET}
Mobile: +49 (176)  21 24 88 69
Office: +49 (9131) 71 26 40 9
