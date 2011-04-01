From: "Michal Nazarewicz" <mina86@mina86.com>
Subject: Re: duplicated modulo
Date: Fri, 01 Apr 2011 11:50:35 +0200
Message-ID: <op.vs86ylxn3l0zgt@mnazarewicz-glaptop>
References: <20110401114113.6e2e91af@absol.kitzblitz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:sender:content-type:to:subject:references:date
         :mime-version:content-transfer-encoding:from:organization:message-id
         :in-reply-to:user-agent;
        bh=HJ52lC5pad0JPx+M/aOOa7ohtd1u1c4TA8TF9jBlEG0=;
        b=MaHzQ/4uEJEVAuLbQ4z8Eq/WiCTbNazcTSsNoTVxAA1YKTWd5i8h9Y3rl1yyU8ia2k
         dLvgA0yiLKk6qQ3xx7t98v5/lbxqTaCRVHxu185tPY0dUtNg/4Mi/SWKueYCeYVQo/2A
         IYGEfu1wmrz/bCMkoKu8oXZZGHs5iJkIGi6PM=
In-Reply-To: <20110401114113.6e2e91af@absol.kitzblitz>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"; delsp="yes"
To: linux-c-programming@vger.kernel.org, Nicolas Kaiser <nikai@nikai.net>

On Fri, 01 Apr 2011 11:41:13 +0200, Nicolas Kaiser wrote:
> I'm curious: a duplicated modulo operation can't possibly make
> any difference, can it?
>
> diff -u -p ./arch/powerpc/platforms/powermac/nvram.c  
> /tmp/nothing/arch/powerpc/platforms/powermac/nvram.c
> --- ./arch/powerpc/platforms/powermac/nvram.c	2011-03-31  
> 09:52:41.674292401 +0200
> +++ /tmp/nothing/arch/powerpc/platforms/powermac/nvram.c
> @@ -246,7 +246,6 @@ static u32 core99_calc_adler(u8 *buffer)
>  	high = 0;
>  	for (cnt=0; cnt<(NVRAM_SIZE-CORE99_ADLER_START); cnt++) {
>  		if ((cnt % 5000) == 0) {
> -			high  %= 65521UL;
>  			high %= 65521UL;
>  		}
>  		low += buffer[cnt];

It's not just a module.  It's also an assignment.

-- 
Best regards,                                         _     _
.o. | Liege of Serenely Enlightened Majesty of      o' \,=./ `o
..o | Computer Science,  Michal "mina86" Nazarewicz    (o o)
ooo +-----<email/xmpp: mnazarewicz@google.com>-----ooO--(_)--Ooo--
