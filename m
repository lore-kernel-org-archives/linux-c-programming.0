From: Mahavir Jain <mahavir.coep@gmail.com>
Subject: Re: Where to start C-programming open source?
Date: Wed, 15 Mar 2017 17:53:25 +0530
Message-ID: <CAA4mPKCUF_G5ChTAn2ytndBLxiv0R5TC9DcGoXxgMCNtf1b0vw@mail.gmail.com>
References: <ba6df9f8-661a-e935-2e81-c998fe4a4aa6@cprasmussen.dk>
 <CAHUNapQzbCtJySWco1R+2FUutuBPFO2i2h9BtYn9ktNgBrQ9OQ@mail.gmail.com> <0d56ba3f-3880-2793-28b5-70ac13920d29@cprasmussen.dk>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=021vIQp9hKE0UhMIBEyRcWz+ZlGU1myLgJkQDr0vXSQ=;
        b=SVUw30Bt0uzJKcDU44DzYFAE5G8HoqL4hux97XVdCogFzBf87GXzsJp1LZCOgA7xQO
         HmOaqV6dsWMNtHEx7tsLALnMaGy4XE3E/DMeoepjRiAriRKzgA08oRYjm5kvTV7ctdPy
         7dE4RVY3xcz1ae/ib1pQIhQAL9rI1y+F4vau2zxvJl86+d2iyI7uBDTP1uQJSv1vWyx+
         TlcgRF5UOiAZhpTA3t0A6gZAXMgjohKP/tvGFiXgZoBBzFfnr+I1M17kbp+OUd2SeeFw
         3MMZOwqfizw9iHlslqWDuB0qiGUmxrfle9/mUqSXpA7GIH45QAUm+gLgOvSXBIfUdmnh
         adsw==
In-Reply-To: <0d56ba3f-3880-2793-28b5-70ac13920d29@cprasmussen.dk>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Carsten Peter Rasmussen <mail@cprasmussen.dk>
Cc: "linux-c-programming@vger.kernel.org" <linux-c-programming@vger.kernel.org>

On Fri, Mar 10, 2017 at 3:00 PM, Carsten Peter Rasmussen
<mail@cprasmussen.dk> wrote:
>
> Den 10-03-2017 kl. 01:23 skrev Trevor Woerner:
>>
>> On Fri, Mar 3, 2017 at 11:05 AM, Carsten Peter Rasmussen
>> <mail@cprasmussen.dk> wrote:
>>>
>>> Any comments and advice on getting started in OS with C is greatly
>>> appreciated.
>>

[Resending in plain text mode]

I was looking for similar resources earlier, mostly for learning
purpose, I could gather following information,

For minimal and baremetal OS development on x86,
http://www.osdever.net/bkerndev/Docs/gettingstarted.htm

For little advanced OS development which includes paging and
multitasking support (but in crude way),
https://web.archive.org/web/20160311205056/http://www.jamesmolloy.co.uk/index.html

Above has some known issues (beware and good to chase),
http://wiki.osdev.org/James_Molloy's_Known_Bugs

Xv6 (as already suggested) is rather more comprehensive with very good
documentation,
https://pdos.csail.mit.edu/6.828/2016/xv6.html

>>
>> http://eudyptula-challenge.org/
>
> Looks interesting, is it still working? I just send a plain-text email, but
> no reply.
>

This is also good starting point, but requires good patience, I
dropped from 6th stage as responses were extremely slow.

I could get to below with above references (basic but functional),
https://github.com/mahavirj/tinyos

Best luck!

Thanks,
Mahavir
