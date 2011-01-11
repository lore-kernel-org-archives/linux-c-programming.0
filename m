From: ratheesh k <ratheesh.ksz@gmail.com>
Subject: Re: float
Date: Tue, 11 Jan 2011 14:04:26 +0530
Message-ID: <AANLkTimqjBgQXRq0+sm1FXfU3QEaDeo+ZR88Wxs8U3r5@mail.gmail.com>
References: <AANLkTikyOX3yeh4Xo5vrax651djd_rkQuPy_vm30AZhM@mail.gmail.com>
	<AANLkTi=7Qg7LMats1A3p-c_-pzYsxyeqc8=gj6soEaUM@mail.gmail.com>
	<4D2C0E69.8050800@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=Yqtt4hp5oqL1w47lBedqFiXK7NW/1Jm1K+NI8z5uQIU=;
        b=dT+oolGbIqLkUZ+Sn4Q2z13mGltjNaGx0uVP5J9vtXE27FNZTBo0DyFbXOor5oQ9Y9
         6XvTHQ+qIxNDZr/6Q63Bdm6OF/jCpEZKi5KAxApp+pjWWB4HQjMWvb8qCBssmk/JFleu
         siOzzPDu5+cFwtqDlZ9/KxN5GoRYpny1kJpu4=
In-Reply-To: <4D2C0E69.8050800@gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Thomas Weber <thomas.weber.linux@googlemail.com>
Cc: Uriel Corfa <uriel@corfa.fr>, linux-c-programming@vger.kernel.org

On Tue, Jan 11, 2011 at 1:31 PM, Thomas Weber
<thomas.weber.linux@googlemail.com> wrote:
> Okay, now I got it.
>
> Look for IEEE754.
>
> 0.1 is in double precision 0.10000000149011612
>
> Thomas
>

Is it possible to print the correct "printf" statement by typecasting
some of operations or  data types. I tried with no success.

-Ratheesh


> Am 11.01.2011 08:55, schrieb Uriel Corfa:
>> I'd say : rounding errors. Floating point goes in mysterious ways.
>>
>> On Tue, Jan 11, 2011 at 8:38 AM, ratheesh k <ratheesh.ksz@gmail.com>=
 wrote:
>>> I could not understand =A0why it getting printed like this. Could a=
ny
>>> body tell me.
>>>
>>> #include <stdio.h>
>>>
>>> int main()
>>> {
>>> =A0 =A0 =A0 =A0float f=3D0.0f;
>>> =A0 =A0 =A0 =A0int i;
>>>
>>> =A0 =A0 =A0 =A0for(i=3D0;i<10;i++)
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0f =3D f + 0.1f;
>>>
>>> =A0 =A0 =A0 =A0if(f =3D=3D 1.0f)
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0printf("f is 1.0 \n");
>>> =A0 =A0 =A0 =A0else
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0printf("f is NOT 1.0\n");
>>>
>>> =A0 =A0 =A0 =A0return 0;
>>> }
>>
>
--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
