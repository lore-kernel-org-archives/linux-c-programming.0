From: Bastian Bloessl <bastianbloessl@googlemail.com>
Subject: Re: duplicated modulo
Date: Fri, 01 Apr 2011 12:28:09 +0200
Message-ID: <4D95A8B9.3070308@googlemail.com>
References: <20110401114113.6e2e91af@absol.kitzblitz>	<op.vs86ylxn3l0zgt@mnazarewicz-glaptop> <20110401121916.34a567da@absol.kitzblitz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
         :cc:subject:references:in-reply-to:content-type
         :content-transfer-encoding;
        bh=ZXMbNbd3Z+4yXkr0xx2JCHsPkTOOtvR5LLpyY1ZOI+Y=;
        b=ABLuvG4Ahgj/jJwtPhxEbR042lNbd58XsCV8c5AUsVLELtx+dN+SHfE1Y61xgQzf7A
         XOjceGpHoxlpvnU1LXVu8RhyOvxKgWwgVL2uyc6DEMK/uXAdTZjsBrREd8MBNqSxnVt0
         CEOVuranDPPPlL+W5C7uOy0xx1IcFT4ZwGp0w=
In-Reply-To: <20110401121916.34a567da@absol.kitzblitz>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Nicolas Kaiser <nikai@nikai.net>
Cc: Michal Nazarewicz <mina86@mina86.com>, linux-c-programming@vger.kernel.org

Am 01.04.2011 12:19, schrieb Nicolas Kaiser:
> * "Michal Nazarewicz"<mina86@mina86.com>:
>> On Fri, 01 Apr 2011 11:41:13 +0200, Nicolas Kaiser wrote:
>>> I'm curious: a duplicated modulo operation can't possibly make
>>> any difference, can it?
>>>
>>> diff -u -p ./arch/powerpc/platforms/powermac/nvram.c
>>> /tmp/nothing/arch/powerpc/platforms/powermac/nvram.c
>>> --- ./arch/powerpc/platforms/powermac/nvram.c	2011-03-31
>>> 09:52:41.674292401 +0200
>>> +++ /tmp/nothing/arch/powerpc/platforms/powermac/nvram.c
>>> @@ -246,7 +246,6 @@ static u32 core99_calc_adler(u8 *buffer)
>>>   	high = 0;
>>>   	for (cnt=0; cnt<(NVRAM_SIZE-CORE99_ADLER_START); cnt++) {
>>>   		if ((cnt % 5000) == 0) {
>>> -			high  %= 65521UL;
>>>   			high %= 65521UL;
>>>   		}
>>>   		low += buffer[cnt];
>>
>> It's not just a module.  It's also an assignment.
>
> Sure. But I fail to see where between
>
> a %= b;
> a %= b;
>
> and
>
> a = (a % b) % b;
>
> and
>
> a %= b;
>
> would be a difference?
Perhaps an issue with signed / unsigned, or long vs. int?

