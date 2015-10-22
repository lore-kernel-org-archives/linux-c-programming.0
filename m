From: "Daniel." <danielhilst@gmail.com>
Subject: Re: Does __attribute__((__packed__)) aplies to types or variables?
Date: Thu, 22 Oct 2015 14:18:47 -0200
Message-ID: <CAF3SDA4G2YGNOOOSeQE7JPow62M1NX34SiMv=5KykFb-oO1Exg@mail.gmail.com>
References: <CAF3SDA6FP6=uqs-37_iTH0Qf2hS5Eh5ONVUVcZqEtc3AQ69cfA@mail.gmail.com>
	<CAK7N6vrh05XDwa_nBTmid8QZUU8wgFhm0w=R+aMA9tOugL46Mg@mail.gmail.com>
	<CAF3SDA7pObzwzk-AzdO38-c45VggTJJpwdNzujAuyMV=eSCc=w@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:cc
         :content-type;
        bh=d0XZImrv0wBRXRs6iJuCRSp0tin7mrLWyCeiLDfDwbo=;
        b=b6l1L+P8kQtp9sQXiR2FM62Zg+f5uSssjASsEE0+Jyppnzo0Y13zObiv6W0PuS69UH
         i8f3ZihF5OiHm4gPuPzRdPaNlgT32lr3qnSZoFOt4nCXl40l3GeU+/MXehPReuA6ms97
         uZr4sLLPreErhAQxG0fCt03yblIiMc6NyC4a/iEOEuS1N2djlSa+9RJlmI746xL9pHkR
         UNCYUhYoXIcIWKxw9lU5sz+GhjPUrOJPuZ0NB/oQbMl/uWS/hAOltcrd+L/VdC/BdkdW
         6xrDVkwV7V0xvOH5nmdoqREBTZVtQKeQQbbe0XUIxVBEXzRN78hjs5zVtmNdtYQyGRgI
         zdxg==
In-Reply-To: <CAF3SDA7pObzwzk-AzdO38-c45VggTJJpwdNzujAuyMV=eSCc=w@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: 
Cc: "linux-c-programming@vger.kernel.org" <linux-c-programming@vger.kernel.org>

I mean that packed attribute is applied only when allocation is
implied or can I apply packed
attribute to struct definitions where no variables are declared?

struct __attribute__((__packed__)) foo { ... };
struct foo bar; <--- is this packed?

Regards,

2015-10-22 14:18 GMT-02:00 Daniel. <danielhilst@gmail.com>:
> I mean that packed attribute is applied only when allocation is implied or
> can I apply packed
> attribute to struct definitions where no variables are declared?
>
> struct __attribute__((__packed__)) foo { ... };
> struct foo bar; <--- is this packed?
>
> Regards,
>
> 2015-10-21 17:17 GMT-02:00 anish singh <anish198519851985@gmail.com>:
>>
>>
>>
>> On Wed, Oct 21, 2015 at 10:56 AM, Daniel. <danielhilst@gmail.com> wrote:
>>>
>>> Suppose that I have a declaration:
>>>
>>> struct __attribute__((__packed__)) foo {
>>>   char ch;
>>>   int number;
>>> };
>>>
>>> Will be any variable of this type be packed?
>>>
>>> The real world thing is: I have a code that come up from 8bit world,
>>> with a lot of lots of chained structures that are transferred throght
>>> some radio frequence module, I need be sure that all this structs have
>>> no padding so that they can be transferred as they are to radio. To
>>> achieve this I've
>>> putted __attribute__((__packed__)) to every struct and inner struct
>>> that are sended through RF,
>>> but I read at some StackOverflow post that packed attribute aplies to
>>> variables not to types,
>>
>>
>> Can you elaborate? AFAIK you can safely use packed attribute to pack
>> your structures and send it over the network as long as you take care of
>> endianess.
>>
>> What do you mean by packed attribute applies to variables not to types?
>>>
>>> so I came here ask to experts. Is that true?
>>>
>>> At gcc manual I found Type Attributes and Variable attributes, so I'm
>>> assuming both exists how differentiate from one to another?
>>>
>>> Regards,
>>>
>>> --
>>> "Do or do not. There is no try"
>>>   Yoda Master
>>> --
>>> To unsubscribe from this list: send the line "unsubscribe
>>> linux-c-programming" in
>>> the body of a message to majordomo@vger.kernel.org
>>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>
>>
>
>
>
> --
> "Do or do not. There is no try"
>   Yoda Master



-- 
"Do or do not. There is no try"
  Yoda Master
