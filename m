From: "mail-lists" <mail-lists@stev.org>
Subject: RE: malloc with size 0
Date: Fri, 30 Dec 2005 14:16:35 -0000
Message-ID: <200512301423.jBUENrJ12120@stev.org>
References: <1f5f62170512212043w17e1c8e7v3781e0dc72845efc@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <1f5f62170512212043w17e1c8e7v3781e0dc72845efc@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 'Suma C' <gsumac@gmail.com>, 'C programming list' <linux-c-programming@vger.kernel.org>

Hi,

This was  a strange problem I came across about 2 years ago.
Some systems return NULL some return a valid result.
I would treat it as a case where you would not try to alloc a size of 0 its
kind of unpredictable depending on lib version and which system your on.

	James

> -----Original Message-----
> From: linux-c-programming-owner@vger.kernel.org [mailto:linux-c-
> programming-owner@vger.kernel.org] On Behalf Of Suma C
> Sent: 22 December 2005 04:44
> To: C programming list
> Subject: malloc with size 0
> 
> Hi all
> 
> When  a 0 is passed to malloc, I get a valid pointer instead of a NULL
> .What does this mean?
> 
> thanks  in advance
> 
> regards
> suma
> 
> PS:
> code:
> #include <stdio.h>
> #include <stdlib.h>
> 
> int main()
> {
>         char  *ptr = NULL;
>         ptr = malloc(0);
>         printf("ptr :%u \n",ptr);
>         strcpy(ptr,"abcdefghijkl");
>         printf("%s\n",ptr);  //no seg fault here????
>         return 0;
> }
> -
> To unsubscribe from this list: send the line "unsubscribe linux-c-
> programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html


