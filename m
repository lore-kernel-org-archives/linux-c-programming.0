From: Ron Michael Khu <ronkhu@ntsp.nec.co.jp>
Subject: Re: 64 bits int on ia32
Date: Mon, 11 Oct 2004 11:00:25 +0800
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <4169F749.8010409@hq.ntsp.nec.co.jp>
References: <20041009141739.GA2134@jehuty.server01.org> <20041009201615.GB5033@lug-owl.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20041009201615.GB5033@lug-owl.de>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Cc: linux-c-programming@vger.kernel.org

He already solved it =)

he was using the wrong formatting symbol...


Jan-Benedict Glaw wrote:

>On Sat, 2004-10-09 16:17:39 +0200, Ricardo Catalinas Jimenez <th1nk3r@server01.org>
>wrote in message <20041009141739.GA2134@jehuty.server01.org>:
>  
>
>>Hi everybody,
>>
>>I know the 'long long' type, I also try 'sizeof(long long)' and it returns 8.
>>But when I use it, the max number it can store is 0xffffffff.
>>    
>>
>
>How did you check that this is the largest number? I guess you either
>used a wrong format specifier for a printf call (that'd clamp the value
>to it's low-order long value). Also note that you should probably add a
>type suffix of "LL" or "ULL" to that value, cf. 6.4.4.1 of the C99
>standard.
>
>So how did you use the long long typed variable?
>
>MfG, JBG
>
>  
>

