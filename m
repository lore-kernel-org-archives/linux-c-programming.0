From: Yichao Yu <yyc1992@gmail.com>
Subject: Re: Show application performance/errors from pseudo file
Date: Thu, 16 Oct 2014 16:31:29 -0400
Message-ID: <CAMvDr+Qum0dWSarjH1ECnofdP1Ec_EZDczYRFrwP-0Z71Mc5GQ@mail.gmail.com>
References: <5440216C.3010207@gmail.com> <CAMvDr+T54gR3APzCOyZczvCTZs=FvHhsCA0VkZAVJR3BQdeT+w@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type;
        bh=Y26t3x9KgQGOUabO6OedZzNqHFb69/sGS8Hb86XOFf0=;
        b=A0Mc5k26KGKL0I5JLdwzDKVN37VaXSOBRFCPVT3OV/0DRwtis4enF5P8d2fRkoNxSS
         QWf3+GtMRPBUGa3GkQGJ3qqlns2xk99BG3fKegFlBo+WgMKPd3du6SafgJdbd24vXtWK
         nOirhYFBAI6G3lqHK/+H7S3twmC7y38/bpldFmdiVvjXb01yZwSb7Prbgy/jwjUjwbrJ
         7olbwShalEp/om8aTiHfnF7yN0jTWrOUHkGEBaVbIW5R1nbeubLd3U4tHPxSIDIZjQ4B
         nBzyNlpyZaAwaIyPqlKCfDb1Ts3BcufiDEZwdQGrueVNxG/sLVWqs7dC5Q656MYrKKaY
         nbkQ==
In-Reply-To: <CAMvDr+T54gR3APzCOyZczvCTZs=FvHhsCA0VkZAVJR3BQdeT+w@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Daniel Hilst Selli <danielhilst@gmail.com>
Cc: "linux-c-programming@vger.kernel.org" <linux-c-programming@vger.kernel.org>

Resend as plain text.

On Thu, Oct 16, 2014 at 4:01 PM, Yichao Yu <yyc1992@gmail.com> wrote:
>
>
> On Thu, Oct 16, 2014 at 3:50 PM, Daniel Hilst Selli <danielhilst@gmail.com>
> wrote:
>>
>> I'm writing a new application and would be nice to have a pseudo file
>> showing its status, just the way that procfs does with kernel.
>> I'm looking for sugestions, I want to `cat' files contents and have
>> something similar to /proc/meminfo
>>
>> First I think using named pipes, but, AFAIK, pipes would retain data
>> writed until someone read it, what I thought is a kind of read
>> hook that only show data when asked for. Here are a few requisites,
>>
>> - Don't retain data
>> - Don't generate disk I/O
>> - Vanish when application stops
>> - Work with a simple cat or something similar..
>
>
> You should have a look at fuse[1].
>
> [1] http://fuse.sourceforge.net/
>
>>
>>
>> With that in mind I think about using unix domain sockets.. it seems to
>> fit all requisites, for
>> the fourth requisite I could use netcat, that is almost cat,
>>
>> Cheers
>> --
>> To unsubscribe from this list: send the line "unsubscribe
>> linux-c-programming" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>
