From: Chrysostomos Nanakos <nanakos@wired-net.gr>
Subject: Re: printf and long double
Date: Mon, 04 Oct 2010 15:12:35 +0300
Message-ID: <4CA9C4B3.6040906@wired-net.gr>
References: <20101003225652.GA3618@dinofilaria.home> <19625.11998.318578.160832@cerise.gclements.plus.com> <4CA9C086.1050401@wired-net.gr> <201010041503.27721.cristeab@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <201010041503.27721.cristeab@gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Bogdan Cristea <cristeab@gmail.com>
Cc: linux-c-programming@vger.kernel.org

  On 4/10/2010 3:03 =CE=BC=CE=BC, Bogdan Cristea wrote:
> On Monday 04 October 2010 14:54:46 you wrote:
>> I wish I could get 24 decimal digits precision with the current long
>> double (80-bit). I can't get more than 15 digits even in a simple di=
vision.
>> I think that the extended-precision can't give more than 19 decimal
>> digits of precision (log(10,2^64)=3D19.2). The quadruple precision c=
an
>> give at most 34 decimal digits (log(10,2^113)=3D34).
>>
>> Please consider the example below:
>> --------------------------------------------------
>> long double a =3D 1.0L/7.0L;
>> printf("%Lf\n",a);
>> --------------------------------------------------
>>
>> Can't get more than 15 digits precision....-:(
>> Is this a compiler problem or libc's problem? In x86_64 machines the
>> long double values supposed to give at least 106-bit precision even =
when
>> implemented in software. Is gcc compliant with the quadruple notatio=
n?
> Have you tried to specify manually the number of digits after the dec=
imal
> point ?
>
> 	long double a =3D 1.0L/7.0L;
> 	printf("%'.100Lf\n",a);
>
> On a 64 bits machine the output is:
>
> 0.1428571428571428571409210675491330277964152628555893898010253906250=
000000000000000000000000000000000
>
> regards
> Bogdan
Of course I did. But the result you get is the wrong one after the firs=
t=20
20 decimal point digits. The right result is given below with a high=20
precision arithmetic library or with Mathematica or Matlab. And the=20
three results are the same, but not the given one above which is the=20
same for my machine.

0.14285714285714285714285714285714285714285714285714285714285714285714\
28571428571428571428571428571429
--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
