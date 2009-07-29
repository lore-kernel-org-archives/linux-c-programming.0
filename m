From: Aneesh Bhasin <contact.aneesh@gmail.com>
Subject: Fwd: What compiler is doing when we pass unnecessary parameters in 
	scanf
Date: Wed, 29 Jul 2009 22:02:42 +0530
Message-ID: <f662f0210907290932t1e8f7a66xd3ac82e0c41e00b2@mail.gmail.com>
References: <24719839.post@talk.nabble.com> <f662f0210907290855m57c191e2pb8ba28dc3d87f780@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :from:date:message-id:subject:to:content-type
         :content-transfer-encoding;
        bh=SV/LNRz0oDASxluSOYdzdLlZ/YcXd3envaCQUrPrM2Q=;
        b=tvmRI0tcnOLnCIGT2O92LtLWOjaC9dMJE9rcbjoypTK67/ZMpuNmA6paoSD4Ern3yM
         25l72M+nbMpNrN0TKTqtAitcUvbK7nDPj/tQeFKAZn0kvObYanxS4zhtALCufU9ctAe+
         yUUR97XmN3FRT95aupbrRsj63s5gGyADgXFiU=
In-Reply-To: <f662f0210907290855m57c191e2pb8ba28dc3d87f780@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-c-programming@vger.kernel.org

----forgot to add list as cc------

Hi Kaushik,

any extra non-whitespace, non "%" characters are matched against the
input given from stdin - if they match, it is ignored and if it
doesn't match, no further input is taken.

In case of your second scenario, when you specify "p:%d" as string,
the program expects the input to be of the format "p:<some number>"
but since you give 100 as the input, no value is assigned to the
variable p (you can check the return value of scanf - its zero) and
hence, whatever junk value is in variable p, it is used for further
calculation.

With the second scenario, try giving the input as "p:100" and then p
should get value 100 as expected...

Hope that helps.
Aneesh

On Wed, Jul 29, 2009 at 7:48 PM, RAM_LOCK <Kaushik.Sarkar@netapp.com> w=
rote:
>
> Hi,
> In the second scenario what value is it printing when i have given ex=
tra
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
> =A0 =A0 =A0 =A0int p;
> =A0 =A0 =A0 =A0float i=3D0;
> =A0 =A0 =A0 =A0printf ("enter the principal amount\n");
> =A0 =A0 =A0 =A0scanf ("%d",&p);
> =A0 =A0 =A0 =A0i =3D (p*5*5)/100;
> =A0 =A0 =A0 =A0printf ("Interterest is : %f\n",i);
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
> =A0 =A0 =A0 =A0int p;
> =A0 =A0 =A0 =A0float i=3D0;
> =A0 =A0 =A0 =A0printf ("enter the principal amount\n");
> =A0 =A0 =A0 =A0scanf ("p:%d",&p);
> =A0 =A0 =A0 =A0i =3D (p*5*5)/100;
> =A0 =A0 =A0 =A0printf ("Interterest is : %f\n",i);
> }
> root@kaushik_Fedora11 ~/C/LET_US_C/ch-1> ./a.out
> enter the principal amount
> 100
> Interterest is : -9321198.000000
>
> --
> View this message in context: http://www.nabble.com/What-compiler-is-=
doing-when-we-pass-unnecessary-parameters-in-scanf-tp24719839p24719839.=
html
> Sent from the linux-c-programming mailing list archive at Nabble.com.
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-c-pro=
gramming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
