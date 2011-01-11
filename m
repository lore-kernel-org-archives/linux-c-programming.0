From: Thomas Weber <thomas.weber.linux@googlemail.com>
Subject: Re: float
Date: Tue, 11 Jan 2011 09:57:15 +0100
Message-ID: <4D2C1B6B.8000504@gmail.com>
References: <AANLkTikyOX3yeh4Xo5vrax651djd_rkQuPy_vm30AZhM@mail.gmail.com>	<AANLkTi=7Qg7LMats1A3p-c_-pzYsxyeqc8=gj6soEaUM@mail.gmail.com>	<4D2C0E69.8050800@gmail.com> <AANLkTimqjBgQXRq0+sm1FXfU3QEaDeo+ZR88Wxs8U3r5@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=+CDD2WQszys/8P7z3C07zmb77ZZ1buOUnI1jomQKLOk=;
        b=Harhf6/63bn4NTjNa8fcDB6rchfJAUwFRzeaeaiIpYOGbR1IRyYVdAXcze30cUhqhQ
         vwDfvo8hJyiCkavjynKU5YfDKv/RtmjQ+pHc46r5tKJUGZ2hsmizzFizf78vT2eF8G+u
         ECcggttZ/K4iD65OdJCmDN9z9dNPvInrNt4pY=
In-Reply-To: <AANLkTimqjBgQXRq0+sm1FXfU3QEaDeo+ZR88Wxs8U3r5@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ratheesh k <ratheesh.ksz@gmail.com>
Cc: Thomas Weber <thomas.weber.linux@googlemail.com>, Uriel Corfa <uriel@corfa.fr>, linux-c-programming@vger.kernel.org

Am 11.01.2011 09:34, schrieb ratheesh k:
> On Tue, Jan 11, 2011 at 1:31 PM, Thomas Weber
> <thomas.weber.linux@googlemail.com> wrote:
>> Okay, now I got it.
>>
>> Look for IEEE754.
>>
>> 0.1 is in double precision 0.10000000149011612
>>
>> Thomas
>>
> 
> Is it possible to print the correct "printf" statement by typecasting
> some of operations or  data types. I tried with no success.
> 
> -Ratheesh

Try something with precision and typecast float to double

printf("f:%.10f is 1.0 \n",(double) f);


Thomas

> 
> 
>> Am 11.01.2011 08:55, schrieb Uriel Corfa:
>>> I'd say : rounding errors. Floating point goes in mysterious ways.
>>>
>>> On Tue, Jan 11, 2011 at 8:38 AM, ratheesh k <ratheesh.ksz@gmail.com> wrote:
>>>> I could not understand  why it getting printed like this. Could any
>>>> body tell me.
>>>>
>>>> #include <stdio.h>
>>>>
>>>> int main()
>>>> {
>>>>        float f=0.0f;
>>>>        int i;
>>>>
>>>>        for(i=0;i<10;i++)
>>>>                f = f + 0.1f;
>>>>
>>>>        if(f == 1.0f)
>>>>                printf("f is 1.0 \n");
>>>>        else
>>>>                printf("f is NOT 1.0\n");
>>>>
>>>>        return 0;
>>>> }
>>>
>>

