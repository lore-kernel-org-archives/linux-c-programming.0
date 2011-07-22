From: Vadiraj <vadiraj.cs@gmail.com>
Subject: Re: time system call expensive?
Date: Fri, 22 Jul 2011 10:27:18 +0530
Message-ID: <CA+NBAy6Lyt-mP05En9kOaUkcUbFoQog1NyHR15bxtyxK4uTc0Q@mail.gmail.com>
References: <CA+NBAy6499cgdzwGuPk6h+Y3D-DxEHP2HEKjtNAgis7K4RTKig@mail.gmail.com>
	<op.vyyu34nf3l0zgt@mnazarewicz-glaptop>
	<4E281189.8010904@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :content-type:content-transfer-encoding;
        bh=hqafqaj7LpVsQqdXhBMgmf2rfz42+MfflXDf1Nn+dx0=;
        b=EfbUX+/CWfi+Z0kyaJVt8p2KS5x5v5XlRoe5yIzxpQdh+pVyJljb8AGoIVTbeHkRMN
         6NDUWBXF+fF0puX7ER19U/b4WIjRC8PPbIeYkv3WJ1odoNlYlIehXsPN/GTupU5hPwtQ
         PGzkUulpZ9mK7Qt7DsTTmJJ8JPye+uahFSFmg=
In-Reply-To: <4E281189.8010904@gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-c-programming <linux-c-programming@vger.kernel.org>

Great!! thanks for the tar.

I'm not sure if we can time() sys call is quite expensive all time.

Simple code I tried

#include <stdio.h>
#include <time.h>


int main()
{
    int i,k =3D 0;
    time_t t,j;
    for(i =3D0 ; i < 100; i++)
    {
        usleep(100);
        //t =3D time(NULL);
        k++;
        //j =3D time(NULL);
    }
}

Time without the time() calls.


time ./time_performance

real	0m2.091s
user	0m0.000s
sys	0m0.001s


output with time calls.

time ./time_performance

real	0m2.007s
user	0m0.000s
sys	0m0.001s


Almost same.

timing k++ is not the righ thing but the point is, time as such is not
so expensive IMHO. I did notice considerable difference when I loop to
a 100000 times without the usleep().

just k++ in the loop.
time ./time_performance

real	0m0.003s
user	0m0.000s
sys	0m0.003s


with time() sys call before and after k++ in the loop.
time ./time_performance

real	0m0.168s
user	0m0.026s
sys	0m0.139s




Cheers,
Vadi


On Thu, Jul 21, 2011 at 5:16 PM, Akos Marton <makos999@gmail.com> wrote=
:
> I advice you `man 3 clock`.
> If you want to get much more precision the attached project can help =
you.
> Does it help?
>
> Regards,
> mAkos
>
>
> Michal Nazarewicz wrote:
>> On Thu, 21 Jul 2011 06:41:14 +0200, Vadiraj <vadiraj.cs@gmail.com> w=
rote:
>>> I'm evaluating time consumed by method. I'm using time(NULL) system
>>> call to capture time before and after the call to the function.
>>> Just wanted to know if this has a considerable performance hit? For
>>> all I believe time syscall is quite optimized and should not really=
 be
>>> matter of concern.
>>>
>>> Please let me know if someone have evaluated time(NULL) system over=
 head..
>>>
>>> Assuming the method I'm evaluating is a frequently called method.
>>
>> Why do you worry about it? =A0What do you need the time for? =A0If a=
re
>> really using time(2) it means that the function you're calling run t=
ime
>> is counted in seconds. =A0If that's the case, two call to time(2) ar=
e
>> by all means negligible.
>>
>> If you need in for benchmark, you would probably do something like:
>>
>> start =3D time(NULL)
>> for (vary big number)
>> =A0 =A0 call function you benchmark
>> end =3D time(NULL)
>>
>> In either case, you should check gettimeofday(2).
>>
>
>
--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
