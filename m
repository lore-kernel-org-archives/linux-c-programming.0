From: Holger Kiehl <Holger.Kiehl@dwd.de>
Subject: Re: Question about core files
Date: Wed, 7 Oct 2009 13:43:20 +0000 (GMT)
Message-ID: <Pine.LNX.4.64.0910071331030.29237@diagnostix.dwd.de>
References: <Pine.LNX.4.64.0910061349060.9660@praktifix.dwd.de>
 <19148.7405.580856.157196@cerise.gclements.plus.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <19148.7405.580856.157196@cerise.gclements.plus.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Glynn Clements <glynn@gclements.plus.com>
Cc: linux-c-programming@vger.kernel.org

On Wed, 7 Oct 2009, Glynn Clements wrote:

>
> Holger Kiehl wrote:
>
>> Most the time I compile my application without the -g option due to
>> performance reasons.
>
> The -g switch has absolutely no effect upon performance. It simply
> causes and additional section to be added to the resulting binary.
> When the program is run normally (i.e. not under gdb), that section
> won't be mapped. The only downside to -g is that it increases the size
> of the file.
>
But when executing the program will it not read the whole binary which
is much larger with debug information and so will take longer (just the
first reading of the binary)?

Holger
