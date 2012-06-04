From: Srinivasa T N <seenutn@linux.vnet.ibm.com>
Subject: Re: Is it helpful for a compiler to optimize?
Date: Mon, 04 Jun 2012 19:39:07 +0530
Message-ID: <4FCCC183.1030005@linux.vnet.ibm.com>
References: <jqf0o8$cj4$1@dough.gmane.org> <jqf201$j23$1@dough.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <jqf201$j23$1@dough.gmane.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Krzysztof <kj@limes.com.pl>
Cc: linux-c-programming@vger.kernel.org

Why don't you generate the assembly code for both the versions with -s 
and -O<lvl>?

Regards,
Seenu.

On 06/03/2012 12:29 PM, Krzysztof wrote:
> On 06/03/2012 08:38 AM, Krzysztof wrote:
>>
>> void afun(struct st *stp)
>> {
>>     int liv=stp->iv++;
>>
>>     printf("%d\n",liv);
>> }
>>
> Should be: int liv=++stp->iv; of course for equivalence.
>

