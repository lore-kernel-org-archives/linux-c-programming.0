From: "Trevor Woollacott" <trevorw@pharos-avantgard.com>
Subject: RE: What compiler is doing when we pass unnecessary parameters in scanf
Date: Wed, 29 Jul 2009 18:02:22 +0200
Message-ID: <009701ca1065$f784d760$706bd90a@mtn.co.za>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: linux-c-programming@vger.kernel.org, Kaushik.Sarkar@netapp.com

> -----Original Message-----
> From: linux-c-programming-owner@vger.kernel.org [mailto:linux-c-
> programming-owner@vger.kernel.org] On Behalf Of RAM_LOCK
> Sent: Wednesday, 29 July 2009 04:19 PM
> To: linux-c-programming@vger.kernel.org
> Subject: What compiler is doing when we pass unnecessary parameters in
> scanf
>
>
> Hi,
> In the second scenario what value is it printing when i have given
> extra
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
> > cat simple-interest.c
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
> --
> View this message in context: http://www.nabble.com/What-compiler-is-
> doing-when-we-pass-unnecessary-parameters-in-scanf-
> tp24719839p24719839.html
> Sent from the linux-c-programming mailing list archive at Nabble.com.
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-c-
> programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

Hi

With scenario II your input of 100 is not matching, so you end up with 
whatever value was stored at &p before the scanf.
i.e.

(gdb) r
Starting program: ./a.out

Breakpoint 1, main () at test.c:6
6             float i=0;
(gdb) p p
$4 = -37284792
(gdb) s
7             printf ("enter the principal amount\n");
(gdb) s
enter the principal amount
8             scanf ("p:%d",&p);
(gdb) s
100
9             i = (p*5*5)/100;
(gdb) p p
$6 = -37284792
(gdb) s
10            printf ("Interterest is  : %f\n",i); }
(gdb) s
Interterest is : -9321198.000000

Here you can see p = -37284792 before and after your scanf
Then i = (-37284792*5*5)/100 = -9321198.000000

If you check the value returned by scanf, you can determine how many input 
values were successfully matched. In the case where you entered 100 in 
scenario I, scanf would have returned 1, and in scenario II it would have 
returned 0.

Regards,
Trevor 

