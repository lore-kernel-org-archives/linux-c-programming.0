From: "Michal Nazarewicz" <mina86@mina86.com>
Subject: Re: dynamic shared library .
Date: Thu, 03 Feb 2011 15:59:44 +0100
Message-ID: <op.vqb09uit3l0zgt@mnazarewicz.zrh.corp.google.com>
References: <AANLkTimck7ar6JPzSnNZo_baTz1usHLeUFxkL8GaqriV@mail.gmail.com>
 <AANLkTi=VisvB732h_jzXcDj5_t7b96QAvJuXYiuOvEj8@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:sender:content-type:to:subject:references:date
         :mime-version:content-transfer-encoding:from:organization:message-id
         :in-reply-to:user-agent;
        bh=KYZJTvXT23Or6p8NYTBtT+LJ0ncDf8kqjDA1Ju8cW2Y=;
        b=gB/cb9qIkg1XYl7TUqeqr163nNhrTlec5aqxyQEY8DMKG7DouNa53ay7X8mvtCQP7R
         I1CYT+53Y4b0B9TKJ1dG4LypSboZlbtgGtFj62YIZexQhM2rx8R0llNK6+YSJxTb88PJ
         AsRX3aPqSt77bDNqtPQgQXzioemHc25gxGBJ0=
In-Reply-To: <AANLkTi=VisvB732h_jzXcDj5_t7b96QAvJuXYiuOvEj8@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"; delsp="yes"
To: linux-c-programming@vger.kernel.org, ratheesh k <ratheesh.ksz@gmail.com>

On Thu, 03 Feb 2011 15:50:27 +0100, ratheesh k <ratheesh.ksz@gmail.com>  
wrote:

> when  dll is loaded  .
>
>  at the start of execution of elf ?
>
>      OR
>
>  when the  reference is made into library function or data ?

Depends what you mean by "loaded".  At start of execution, dynamic loader
reads shared object's header files, maps the library to memory accordingly
and probably does some more magic with symbol resolution, etc. (I'm not
an expert and what dynamic loader does is not that trivial).

However, the whole file is not read into memory and instead, needed
portions are read as code references them.

-- 
Best regards,                                       _     _
.o. | Liege of Serenly Enlightened Majesty of     o' \,=./ `o
..o | Computer Science,  Michal "mina86" Nazarewicz  (o o)
ooo +-<email/jid: mnazarewicz@google.com>--------ooO--(_)--Ooo--
