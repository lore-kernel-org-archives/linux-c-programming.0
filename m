From: "Michal Nazarewicz" <mina86@mina86.com>
Subject: Re: duplicated modulo
Date: Fri, 01 Apr 2011 13:20:28 +0200
Message-ID: <op.vs9a4ecl3l0zgt@mnazarewicz-glaptop>
References: <20110401114113.6e2e91af@absol.kitzblitz>
 <op.vs86ylxn3l0zgt@mnazarewicz-glaptop>
 <20110401121916.34a567da@absol.kitzblitz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:sender:content-type:to:cc:subject:references
         :date:mime-version:content-transfer-encoding:from:organization
         :message-id:in-reply-to:user-agent;
        bh=6RuinXffxrWOu1VrhBCrECHcFDoeSG3sFUlJM4zTJuQ=;
        b=J/ONKJR3YXnpAk/U5WveSmZdiSYAXEDALEvxSM5OzwNhVYmhrQCqm5qa61uf4k7Lio
         2kqq92JsTV6Z3NF3O+vZRgROnbrNSv8Sm0SVKOOtCU2EShAmt//9DXoLPqsDPNI/Ld03
         qymQargWwLvAthOYiE+keZqnTM8OzdYSUSRAU=
In-Reply-To: <20110401121916.34a567da@absol.kitzblitz>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"; delsp="yes"
To: Nicolas Kaiser <nikai@nikai.net>
Cc: linux-c-programming@vger.kernel.org

On Fri, 01 Apr 2011 12:19:16 +0200, Nicolas Kaiser <nikai@nikai.net> wrote:

> * "Michal Nazarewicz" <mina86@mina86.com>:
>> On Fri, 01 Apr 2011 11:41:13 +0200, Nicolas Kaiser wrote:
>> > I'm curious: a duplicated modulo operation can't possibly make
>> > any difference, can it?
>> >
>> > diff -u -p ./arch/powerpc/platforms/powermac/nvram.c
>> > /tmp/nothing/arch/powerpc/platforms/powermac/nvram.c
>> > --- ./arch/powerpc/platforms/powermac/nvram.c	2011-03-31
>> > 09:52:41.674292401 +0200
>> > +++ /tmp/nothing/arch/powerpc/platforms/powermac/nvram.c
>> > @@ -246,7 +246,6 @@ static u32 core99_calc_adler(u8 *buffer)
>> >  	high = 0;
>> >  	for (cnt=0; cnt<(NVRAM_SIZE-CORE99_ADLER_START); cnt++) {
>> >  		if ((cnt % 5000) == 0) {
>> > -			high  %= 65521UL;
>> >  			high %= 65521UL;
>> >  		}
>> >  		low += buffer[cnt];
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

Ah, sorry, you are right.  I should stop responding to mail just
after waking up.

-- 
Best regards,                                         _     _
.o. | Liege of Serenely Enlightened Majesty of      o' \,=./ `o
..o | Computer Science,  Michal "mina86" Nazarewicz    (o o)
ooo +-----<email/xmpp: mnazarewicz@google.com>-----ooO--(_)--Ooo--
