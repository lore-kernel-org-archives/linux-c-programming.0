From: Chrysostomos Nanakos <nanakos@wired-net.gr>
Subject: Re: printf and long double
Date: Mon, 04 Oct 2010 14:54:46 +0300
Message-ID: <4CA9C086.1050401@wired-net.gr>
References: <20101003225652.GA3618@dinofilaria.home> <19625.11998.318578.160832@cerise.gclements.plus.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <19625.11998.318578.160832@cerise.gclements.plus.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Glynn Clements <glynn@gclements.plus.com>, linux-c-programming@vger.kernel.org

  On 4/10/2010 4:33 =CF=80=CE=BC, Glynn Clements wrote:
> Nanakos Chrysostomos wrote:
>
>> I have the above C code snippet. I am trying to get a resonable
>> result in a fixed form with printf for a long double value but with
>> no luck. What am I doing wrong?
>> 	long double c =3D powl(10.0L,30.0L);
>>
>> 	printf("%llf %lle\n",c,c);
> On x86, long double is 80 bits, which is roughly 24 decimal digits.


I wish I could get 24 decimal digits precision with the current long=20
double (80-bit). I can't get more than 15 digits even in a simple divis=
ion.
I think that the extended-precision can't give more than 19 decimal=20
digits of precision (log(10,2^64)=3D19.2). The quadruple precision can=20
give at most 34 decimal digits (log(10,2^113)=3D34).

Please consider the example below:
--------------------------------------------------
long double a =3D 1.0L/7.0L;
printf("%Lf\n",a);
--------------------------------------------------

Can't get more than 15 digits precision....-:(
Is this a compiler problem or libc's problem? In x86_64 machines the=20
long double values supposed to give at least 106-bit precision even whe=
n=20
implemented in software. Is gcc compliant with the quadruple notation?




> The -m128bit-long-double flag only changes the alignment, not the
> accuracy of the calculations.
>
> The only reason why you're getting different results for %f and %e is
> that the default precision of 6 refers to 6 decimal places for %f but
> to 6 significant digits for %e.
>

--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
