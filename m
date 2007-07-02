From: Holger Kiehl <Holger.Kiehl@dwd.de>
Subject: Re: Question about ULLONG_MAX
Date: Mon, 2 Jul 2007 20:39:44 +0000 (GMT)
Message-ID: <Pine.LNX.4.64.0707022034110.21471@praktifix.dwd.de>
References: <Pine.LNX.4.64.0707020835520.6237@praktifix.dwd.de>
 <18057.18974.373870.405519@cerise.gclements.plus.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <18057.18974.373870.405519@cerise.gclements.plus.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Glynn Clements <glynn@gclements.plus.com>
Cc: linux-c-programming@vger.kernel.org

On Mon, 2 Jul 2007, Glynn Clements wrote:

>
> Holger Kiehl wrote:
>
>> Compiling the above on AIX compiles and runs without problems. Also
>> on an older Solaris 8 system using gcc (3.3.2) it compiles and runs
>> straight out of the box.
>>
>> If I want to use ULLONG_MAX how can I do this in a portable way so it
>> compiles on different systems?
>
> You need to explicitly enable C99 support; "long long" isn't in C89,
> so you shouldn't assume that it will be available when using the
> default compilation settings.
>
You are right. Enabling C99 support explicitly is the better solution.

Thanks,
Holger

