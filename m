From: "Daniel." <danielhilst@gmail.com>
Subject: Re: How to check if char pointer is a constant!?
Date: Fri, 8 Jul 2016 11:01:02 -0300
Message-ID: <CAF3SDA55SWjDTU7ugw5eREirooR1VisrqSFx5mAejpeg1tpXGQ@mail.gmail.com>
References: <CAF3SDA6G32Kub4rK5BSmx7TkWoXnGWW2ESyHnM_+3t-naVPDww@mail.gmail.com>
 <20160707202621.GP620@orbyte.nwl.cc> <CAF3SDA5-L--FOXe-AzaRf7QE0Qx+XAuLeWNnFN-96smSEYJ7GA@mail.gmail.com>
 <20160708125931.GQ620@orbyte.nwl.cc>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to;
        bh=yHXT9D1nfVRleCz9gYNCGJH5G2VFoV7X8XYjipRrzrw=;
        b=mhSJ8Tv3tYoRYS5wT9x838yPZiFtCTchVBmzKpG7Q3ZNF16VKMlyseu6hEzwtHIBCO
         imM7XSj+rYWVLrJ43wpS1MxP5+HKjHBmrqOdKQJ/6pMUv9BwOzqKiwEgcvI1sTl4t/NL
         a70hx4263Ld/iDDiykSICwnTVaOIUrrf9m3re0kCDNdyWhTDr0yFHPVIogk7uWQhTkId
         vjLXeTAoQIB/yc2OnR8I2sphj6vQ5+LGwSV+hy5GUXpVE5+zr/MnQgz8cPIYXjbNtXmH
         aPlMhWf2McnEqY9tJ25sI1jL4ntId/H0ZSxU3eMbNeD4WcXISGlDDthZk9DloKho+MGm
         afvQ==
In-Reply-To: <20160708125931.GQ620@orbyte.nwl.cc>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Phil Sutter <phil@nwl.cc>, "Daniel." <danielhilst@gmail.com>, "linux-c-programming@vger.kernel.org" <linux-c-programming@vger.kernel.org>

Hi Phil,

Yes I could use strduped strings to avoid this case but at this point
I just want to
have sure that if I do that mistake in future (trying to change a
const str *) the compiler at
last warns me about it :). In the real case this function is called
with a buffer from a readed
file so that it's first parameter aways point to valid lvalue data,
but I (or other) may change the code
in future and try to call it with string constants, I would like to
prevent my self from doing
that and if it happen have a better clue of what happen. Your anwser
apply just as I expected.

Cheers,

2016-07-08 9:59 GMT-03:00 Phil Sutter <phil@nwl.cc>:
> On Fri, Jul 08, 2016 at 09:33:03AM -0300, Daniel. wrote:
>> Hi all thanks for the reply.
>>
>> I think I wasn't clear. Here is a working example: http://codepad.org/0SUG6IcQ
>>
>> The function get_pair_from_string() should I) remove trailing spcaes, II) return
>> the address for key and value using it's last parameters. The problem is that
>> since I modify the first parameter calling with strings constants generates a
>> segmentation fault. This is because strings constans aren't modifiable. I wan't
>> to have better hints when this happen than just "SEGSEGV". I think that the
>> -Wwrite-strings is what I was looking for :D, thanks Phil!!!
>
> Glad I could help.
>
>> John, I'll be in production, but not at this time. Luckly, that
>> function is file scoped
>> so I don't have to bother that much. Still I like to avoid the crypt
>> "SEGSEGV" error
>> message as much as possible. Usually I assert for NULL pointers and give a nice
>> error message but this case is trickier. I'll take Phil advice and use
>> -Wwrite-strings
>
> Calling 'SIGSEGV' an error message is a slight underestimation. Actually
> your program simply crashes. The gcc warning to activate will just help
> to keep your code sane, not improve run-time behaviour.
>
> If you want to modify strings no matter whether they are constant or
> not, strdup() them into a local variable and work with that. Especially
> since it's just for parsing as your example shows. Just keep in mind
> that you will have to free the duplicated string at some point,
> otherwise you will have a memory leak (which at some point will lead to
> an equally cryptic message as your segfault did).
>
> Cheers, Phil



-- 
"Do or do not. There is no try"
  Yoda Master
