From: "Adam Kropelin" <akropel1@rochester.rr.com>
Subject: Re: using 'int char' with #define's variables.
Date: Sun, 1 Sep 2002 18:28:04 -0400
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <0b8901c25206$d71b09b0$02c8a8c0@kroptech.com>
References: <20020901153529.A16903@namodn.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

----- Original Message -----
From: "Nick Jennings" <nkj@namodn.com>
To: <linux-c-programming@vger.kernel.org>
Sent: Sunday, September 01, 2002 6:35 PM
Subject: using 'int char' with #define's variables.


> Hi All,
>
>   A function that has a prototype of:
>
> char * strrchr( char * str, int ch );
>
>   It takes a character as an int in that second param.
>
>   I am having trouble using it with a #define's VAR.
>
> ---
> #define DIRMARK "/"

That's a string (i.e., a char*), not a char.
Double quotes give you a string, single quotes give you a char.

/* This is a pointer to a null-terminated string of characters */
#define DIRMARK "/"

/* This is a single char */
#define DIRMARK '/'

> gcc complains:
> warning: passing arg 2 of `strrchr' makes integer from pointer without a cast

...which is exactly what's happening. You're passing a char* where it expects an
int.

--Adam


