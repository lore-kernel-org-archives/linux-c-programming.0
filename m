From: "Michal Nazarewicz" <mina86@mina86.com>
Subject: Re: macro to print filename
Date: Wed, 01 Jun 2011 21:27:33 +0200
Message-ID: <op.vwewb7lm3l0zgt@mnazarewicz-glaptop>
References: <BANLkTi=TrKOcaQ4QcEHKOsqLaAPxL9f9Kw@mail.gmail.com>
 <BANLkTinbg1RRpGFFYhge6D5YxRyGnxmT6w@mail.gmail.com>
 <op.vwevk4xc3l0zgt@mnazarewicz-glaptop>
 <BANLkTimHdt6psdjPjKAPskBxaycF=-BECw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:sender:content-type:to:cc:subject:references
         :date:mime-version:content-transfer-encoding:from:message-id
         :in-reply-to:user-agent;
        bh=lpgRmTMA+N3AvDKxdTPX/V8l0heTCYIcjdNEMhGjCqU=;
        b=KPPluwk39c65Ft34eZksbgp0OpgAbybrRr0ZcTlAoZzcY/xht4I8hiyyH6D52vU9yV
         vbsJGW60FxTK+Pox6NXHBSBzn0uZVffpDLLndWf1h3WW+FoSs5buC2u9dgDoCCpCsktS
         yxmBMzmpAqWAoqEEBbofdzgqm4rdxosrXMEuw=
In-Reply-To: <BANLkTimHdt6psdjPjKAPskBxaycF=-BECw@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"; delsp="yes"
To: Aniruddha Bhattacharyya <aniruddha.aot@gmail.com>
Cc: ratheesh kannoth <ratheesh.ksz@gmail.com>, Zhongye Jia <jia.zhongye@gmail.com>, linux-c-programming@vger.kernel.org

On Wed, 01 Jun 2011 21:24:59 +0200, Aniruddha Bhattacharyya  
<aniruddha.aot@gmail.com> wrote:
> From what I understood, Ratheesh wanted a compile time solution.
>
> My workaround will be to go for  a Makefile based compilation.
> 1)  "gcc -E yourfile.c"  will preprocess only. so __FILE__ will be  
> expanded .
>
> output file will be yourfile.c (with macro expanded)
>
> 2) then run your custom tool/bash script to trim the filepath to  
> filename.
> use awk tool maybe.
>
> 3) Do the final compile using Gcc

That sounds too complicated.  How about:

foo.o: foo.c
	gcc -DMY_FILE=$(basename $<) -o $@ $<

(Syntax might be wrong.)

-- 
Best regards,                                         _     _
.o. | Liege of Serenely Enlightened Majesty of      o' \,=./ `o
..o | Computer Science,  Michal "mina86" Nazarewicz    (o o)
ooo +-----<email/xmpp: mnazarewicz@google.com>-----ooO--(_)--Ooo--
