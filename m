From: Holger Kiehl <Holger.Kiehl@dwd.de>
Subject: Re: Where am I using so much memory?
Date: Fri, 27 Jul 2007 13:38:42 +0000 (GMT)
Message-ID: <Pine.LNX.4.64.0707271333090.17504@praktifix.dwd.de>
References: <Pine.LNX.4.64.0707221046430.18612@praktifix.dwd.de>
 <18083.36234.878243.211828@cerise.gclements.plus.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <18083.36234.878243.211828@cerise.gclements.plus.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Glynn Clements <glynn@gclements.plus.com>
Cc: linux-c-programming@vger.kernel.org

On Sun, 22 Jul 2007, Glynn Clements wrote:

>
> Holger Kiehl wrote:
>
>> I am trying to find out why one of my process (written in C) is suddenly
>> using so much memory. Under normal conditions VSZ is 5132 and RSS is 2020.
>> Now after running a view days VSZ is 280896 and RSS is 13700. And it stays
>> at that level, so I assume it must have been in some code pass that is
>> hardly used. The program is large so I am looking for a way to locate
>> the variable that uses the memory with the help of gdb. The process
>> is compiled with debug information (-ggdb3).
>
>> Is there a way that I can find with the help of gdb the variable name that
>> had or still has this 270MB allocated?
>>
>> Or is there some other way to find at which place in the code I am using
>> so much memory?
>
> Try mtrace():
>
Thanks! That helped me find the place. It took a long time, but that
was because the code path that triggered it was hardly taken. But
once it happened it was very easy to find it with mtrace().

Many thanks for the advice!

Holger

