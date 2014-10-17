From: Daniel Hilst Selli <danielhilst@gmail.com>
Subject: Re: Show application performance/errors from pseudo file
Date: Fri, 17 Oct 2014 15:59:32 -0300
Message-ID: <54416714.6080100@gmail.com>
References: <5440216C.3010207@gmail.com> <CAMvDr+T54gR3APzCOyZczvCTZs=FvHhsCA0VkZAVJR3BQdeT+w@mail.gmail.com> <CAMvDr+Qum0dWSarjH1ECnofdP1Ec_EZDczYRFrwP-0Z71Mc5GQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:cc:subject:references
         :in-reply-to:content-type:content-transfer-encoding;
        bh=3M8hbqpS+JqeoS87ZHallyX/Fmp/hgANBmk2FpzDErw=;
        b=mppMgYZvY1ueHUyfUKWH4WX1db1V/N3rtrqc2MtwYXS1J/iXhK/i2E8VNbI8LOx7Xk
         zuX3+WdLSW4rTNgeFPg5hdP36rTbBghvYrVHqXGvEPNBRuVpedsNDSKbtmZJEohsfKfZ
         vCFi8Zem4ZPa5fZDQIhx6DUG9tjkuXF4iD9tN0x+OSXHjZAeT/dZdjnXa2tuJeas8bAr
         GKn0VAqbP7oG+qPm5wuym7MkjLH9jzjOj6XAgHPAUsZmWJm5JAT1QLN+vQhfZ1g5d4O7
         NEzPGeBXqhBp/YrzTAf37dI25sKpaMMfJWBY2aJD2Q6iNt7lN6xPmc93cIegqXSVqJJS
         VaGw==
In-Reply-To: <CAMvDr+Qum0dWSarjH1ECnofdP1Ec_EZDczYRFrwP-0Z71Mc5GQ@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: 
Cc: "linux-c-programming@vger.kernel.org" <linux-c-programming@vger.kernel.org>

On 10/16/2014 05:31 PM, Yichao Yu wrote:
> Resend as plain text.
>
> On Thu, Oct 16, 2014 at 4:01 PM, Yichao Yu <yyc1992@gmail.com> wrote:
>>
>>
>> On Thu, Oct 16, 2014 at 3:50 PM, Daniel Hilst Selli <danielhilst@gmail.com>
>> wrote:
>>>
>>> I'm writing a new application and would be nice to have a pseudo file
>>> showing its status, just the way that procfs does with kernel.
>>> I'm looking for sugestions, I want to `cat' files contents and have
>>> something similar to /proc/meminfo
>>>
>>> First I think using named pipes, but, AFAIK, pipes would retain data
>>> writed until someone read it, what I thought is a kind of read
>>> hook that only show data when asked for. Here are a few requisites,
>>>
>>> - Don't retain data
>>> - Don't generate disk I/O
>>> - Vanish when application stops
>>> - Work with a simple cat or something similar..
>>
>>
>> You should have a look at fuse[1].
>>
>> [1] http://fuse.sourceforge.net/
>>
>>>
>>>
>>> With that in mind I think about using unix domain sockets.. it seems to
>>> fit all requisites, for
>>> the fourth requisite I could use netcat, that is almost cat,
>>>
>>> Cheers
>>> --
>>> To unsubscribe from this list: send the line "unsubscribe
>>> linux-c-programming" in
>>> the body of a message to majordomo@vger.kernel.org
>>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>
>>

Seems god, a little overkill for so simple stuff but adds nice features, I'm taking
a look on further options..

Cheers
