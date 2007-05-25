From: Mariusz Kozlowski <m.kozlowski@tuxland.pl>
Subject: Re: why right-to-left evaluation in printf argument list?
Date: Fri, 25 May 2007 18:43:23 +0200
Message-ID: <200705251843.28432.m.kozlowski@tuxland.pl>
References: <46551469.4080103@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <46551469.4080103@gmail.com>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Shriramana Sharma <jamadagni@gmail.com>
Cc: Linux C Programming List <linux-c-programming@vger.kernel.org>

Hello,

> For you people this is probably old hat but none of my book sources 
> explain the C / C++ idiosyncrasy of evaluating arguments of printf (and 
> maybe other functions too, I don't know) from right-to-left. For 
> instance, the following code:
> 
> # include <stdio.h>
> void main ( void )
> {
> 	int i = 0 ;
> 	printf ( "%d %d\n", i ++, i ++ ) ;
> }
> 
> prints out:
> 
> 1 0
> 
> instead of:
> 
> 0 1
> 
> as expected. I remember having heard of this years ago and got around to 
> testing it today, but I don't get the logic behind this behaviour. Is 
> there one? If yes, what is it?

Take a look here -> http://www.c-faq.com/expr/comma.html

Regards,

	Mariusz
