From: Ron Michael Khu <ronkhu@ntsp.nec.co.jp>
Subject: Re: 64 bits int on ia32
Date: Sat, 09 Oct 2004 22:57:07 +0800
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <4167FC43.4000005@hq.ntsp.nec.co.jp>
References: <20041009141739.GA2134@jehuty.server01.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20041009141739.GA2134@jehuty.server01.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ricardo Catalinas Jimenez <th1nk3r@server01.org>
Cc: linux-c-programming@vger.kernel.org

how about using "unsigned"??

Ricardo Catalinas Jimenez wrote:

>Hi everybody,
>
>I know the 'long long' type, I also try 'sizeof(long long)' and it returns 8.
>But when I use it, the max number it can store is 0xffffffff.
>
>So, is there any way to get 64bits ints on a ia32? (of course I am talking
>only about the gcc compiler, I know that I can't manage those amounts of bits
>and store them on a general porpouse register)
>
>
>Thanks in advance.
>  
>

