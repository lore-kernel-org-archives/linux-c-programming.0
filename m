From: "IVAN DE JESUS DERAS TABORA" <i.deras@unitec.edu>
Subject: Re: *w[1]++ = *[k[1]++; does not work .. ?
Date: Mon, 24 Feb 2003 08:02:18 -0800
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <3E5A420A.5060203@unitec.edu>
References: <Pine.LNX.4.21.0302231825450.10716-100000@hestia>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.21.0302231825450.10716-100000@hestia>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "J." <mailing-lists@xs4all.nl>
Cc: linux-c-programming@vger.kernel.org

I think this is a common problem when you use arrays in C.  When you 
declare an array in C, using the following code:

int x[n];

The array will contain indexes from 0 to n-1, then when you declare an 
array char *k[1], it contain indexes from 0..0, when you try to access 
index 1, is an error because it isn't part of the array!!!!

I hope that this may be helpful.

J. wrote:

>Hello...
>
>I am trying to copy a string into the first element of an array of char
>pointers.
>
>I can print char by char like this: printf("%c", *w[1]++);
>but I can not copy char by char like this: *w[1]++ = *k[1]++;
>
>I dont understand ? If I can print it, it should also copy ..
>
>Strangly enough the compiler does not complain.
>
>I have inserted a small illustrative example in this e-mail.
>
>/* To illustrate the difference: This works */
>#include <stdio.h>
>#include <string.h>
>
>int main(void) {
> char *w[1];
> char str[] = "jehova";
>
> w[1] = strdup(str);
>
> while(*w[1] != '\0')
>  printf("%c", *w[1]++);
>
> printf("\n");
> return 0;
>}
>
>/* But this does not work */
>#include <stdio.h>
>#include <stdlib.h>
>#include <string.h>
>
>int main(void) {
> char *w[1];
> char *k[1];
> char str[] = "jehova";
>
> w[1] = strdup(str);
> k[1] = calloc(strlen(str) + 1, sizeof(char));
>
> while(*w[1] != '\0')
>  *k[1]++ = *w[1]++; 
>
> printf("%s\n", w[1]);
> return 0;
>}
>
>Can someone explain what I am doing wrong ?
>
>Thankx a lot,...
>
>J.
>
>-
>To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
>the body of a message to majordomo@vger.kernel.org
>More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>
>  
>

