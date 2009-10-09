From: shiva kumar <shiva@serc.iisc.ernet.in>
Subject: Re: What compiler is doing when we pass unnecessary parameters in
 scanf
Date: Fri, 9 Oct 2009 05:45:04 -0700 (PDT)
Message-ID: <25820534.post@talk.nabble.com>
References: <24719839.post@talk.nabble.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <24719839.post@talk.nabble.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org


behavior of this is undefined just do man scanf

RAM_LOCK wrote:
> 
> Hi,
> In the second scenario what value is it printing when i have given extra
> parameter in scanf?
> Does it vary from compiler to compiler?
> 
> Scenario : I
> -------------
> root@kaushik_Fedora11 ~/C/LET_US_C/ch-1> cat simple-interest.c
> #include <stdio.h>
> 
> void main ()
> {
>         int p;
>         float i=0;
>         printf ("enter the principal amount\n");
>         scanf ("%d",&p);
>         i = (p*5*5)/100;
>         printf ("Interterest is : %f\n",i);
> }
> root@kaushik_Fedora11 ~/C/LET_US_C/ch-1> ./a.out
> enter the principal amount
> 100
> Interterest is : 25.000000
> 
> 
> Scenario : II
> -------------
>> cat simple-interest.c
> #include <stdio.h>
> 
> void main ()
> {
>         int p;
>         float i=0;
>         printf ("enter the principal amount\n");
>         scanf ("p:%d",&p);
>         i = (p*5*5)/100;
>         printf ("Interterest is : %f\n",i);
> }
> root@kaushik_Fedora11 ~/C/LET_US_C/ch-1> ./a.out
> enter the principal amount
> 100
> Interterest is : -9321198.000000
> 
> 

-- 
View this message in context: http://www.nabble.com/What-compiler-is-doing-when-we-pass-unnecessary-parameters-in-scanf-tp24719839p25820534.html
Sent from the linux-c-programming mailing list archive at Nabble.com.

