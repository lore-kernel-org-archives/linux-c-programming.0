From: Krzysztof <kj@limes.com.pl>
Subject: Re: Is it helpful for a compiler to optimize?
Date: Sun, 03 Jun 2012 08:59:13 +0200
Message-ID: <jqf201$j23$1@dough.gmane.org>
References: <jqf0o8$cj4$1@dough.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <jqf0o8$cj4$1@dough.gmane.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-c-programming@vger.kernel.org

On 06/03/2012 08:38 AM, Krzysztof wrote:
>
> void afun(struct st *stp)
> {
>     int liv=stp->iv++;
>
>     printf("%d\n",liv);
> }
>
Should be: int liv=++stp->iv; of course for equivalence.

-- 
Regards
Krzysztof J.


