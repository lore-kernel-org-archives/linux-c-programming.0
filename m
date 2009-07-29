From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: What compiler is doing when we pass unnecessary parameters in scanf
Date: Wed, 29 Jul 2009 18:01:58 +0100
Message-ID: <19056.32902.297068.70718@cerise.gclements.plus.com>
References: <24719839.post@talk.nabble.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <24719839.post@talk.nabble.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: RAM_LOCK <Kaushik.Sarkar@netapp.com>
Cc: linux-c-programming@vger.kernel.org


RAM_LOCK wrote:

> In the second scenario what value is it printing when i have given extra
> parameter in scanf?
> Does it vary from compiler to compiler?

>         scanf ("p:%d",&p);
>         i = (p*5*5)/100;
>         printf ("Interterest is : %f\n",i);
> }
> root@kaushik_Fedora11 ~/C/LET_US_C/ch-1> ./a.out
> enter the principal amount
> 100
> Interterest is : -9321198.000000

The p: isn't matched in the input, so scanf() skips the following %d
conversion, leaving p unchanged. So p will contain garbage (i.e. 
whatever value happened to be stored in that memory location already).

-- 
Glynn Clements <glynn@gclements.plus.com>
