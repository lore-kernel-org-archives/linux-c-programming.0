From: Andrew Edmondson <inbox@andy.co.uk>
Subject: Re: malloc and free
Date: Mon, 20 May 2002 19:16:52 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <02052019165200.07993@localhost.localdomain>
References: <200205201126.QAA01696@ns1.dypatil.edu>
Reply-To: inbox@andy.co.uk
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <200205201126.QAA01696@ns1.dypatil.edu>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: smaggon@dypatil.edu
Cc: linux-c-programming@vger.kernel.org

On Mon, 20 May 2002, Sameer Maggon wrote:
> Hi,
>   In one function i have a definiton like
>
>   char *token;
>   token = (char *)malloc(256 * sizeof(char));

No real need to cast here and in fact it could mask a missing 
#include <stdlib.h>. 

man malloc 
---< snip
RETURN VALUES
       For calloc() and malloc(), the value returned is a pointer
       to the allocated memory, which is suitably aligned for any
       kind of variable, or NULL if the request fails.
---> snip


Also, char is always size 1 so there is no need for the sizeof(). If you did 
want to use sizeof() use it with the object not the type so that if you want 
to change the type of the object you don't need to also change the malloc:

token = malloc(256 * sizeof(*token));

Also, I assume you are checking the return value of the malloc is not NULL at 
some point.

if (  ( token = malloc(256) ) == NULL  )
{
	puts("Malloc: Memory allocation failed.");
	exit(1);
}


>
>   ...
>   ...
>   token = strtok(...,"\0");

Here's the problem, you are assigning another value to token and have lost 
track of your malloc'd memory.

>
>   ...
>   free(token);

Free may now be freeing the wrong memory. 


-- 
Andrew Edmondson
Test Development Engineer
<-------------------------->
The discerning heart seeks knowledge, 
but the mouth of a fool feeds on folly.
