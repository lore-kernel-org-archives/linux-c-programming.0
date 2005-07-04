From: Ron Michael Khu <ronkhu@ntsp.nec.co.jp>
Subject: Re: fork: why to copy process to run new program?
Date: Mon, 04 Jul 2005 10:01:01 +0800
Message-ID: <42C8985D.4000503@hq.ntsp.nec.co.jp>
References: <daa27s$1kr$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <daa27s$1kr$1@sea.gmane.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Tom <tom.lobato@terra.com.br>
Cc: linux-c-programming@vger.kernel.org

u can :D
if u dont need the original program's functionality... then call exec 
right away :D

calling exec will replace the calling process's program space... so it's 
really up to you

Tom wrote:

>        Hello!
>
>        Why, when a program needs to open another, have fork to copy all the
>initial program just for 'exec' the another? Could'nt initial program just
>to "tell" the kernel for open the second program?
>
>
>
>        Thank you
>        Tom
>
>-
>To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
>the body of a message to majordomo@vger.kernel.org
>More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>
>  
>


