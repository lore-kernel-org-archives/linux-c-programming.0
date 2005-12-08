From: "Nate Jenkins" <nate@uniwest.com>
Subject: Re: type qualifiers on function return types?
Date: Thu, 8 Dec 2005 09:43:04 -0800
Message-ID: <001401c5fc1e$d7963110$8e01a8c0@Nate>
References: <Pine.LNX.4.63.0512080728490.10304@localhost.localdomain> <6a00c8d50512080858n70ef1937n8ccc2c96b9eb799c@mail.gmail.com>
Reply-To: "Nate Jenkins" <nate@uniwest.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: C programming list <linux-c-programming@vger.kernel.org>

I am sure I am not the only one here wondering what "type qualifiers" are.
Could someone expound on what they are and why one would use them?

Thanks,
Nate


----- Original Message ----- 
From: "Steve Graegert" <graegerts@gmail.com>
To: "C programming list" <linux-c-programming@vger.kernel.org>
Sent: Thursday, December 08, 2005 8:58 AM
Subject: Re: type qualifiers on function return types?


> On 12/8/05, Robert P. J. Day <rpjday@mindspring.com> wrote:
>>
>>   i was just handed a pile of source code that, upon first build,
>> complains thusly:
>>
>> header.h:20: warning: type qualifiers ignored on function return type
>> header.h:22: warning: type qualifiers ignored on function return type
>>
>>   at those lines, we read:
>>
>>   typedef struct blah {
>>     volatile void           (**start_address)(void);    <--
>>     volatile char*          stack;
>>     volatile void           (**manual_start_address)(void); <--
>>     ...
>>
>> which seems to explain the warnings since i never thought you could
>> add type qualifiers to function return types.  or is there something
>> incredibly clever happening here that i've never seen before?  just
>> wondering why someone would have coded it that way in the first place.
>
> Since functions can only return rvalues and the type qualifiers apply
> only to lvalues, it is meaningless and therefore ignored.
>
> \Steve
>
> --
>
> Steve Graegert <graegerts@gmail.com>
> Software Consultant {C/C++ && Java && .NET}
> Office: +49 9131 7123988
> Mobile: +49 1520 9289212
> -
> To unsubscribe from this list: send the line "unsubscribe 
> linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

