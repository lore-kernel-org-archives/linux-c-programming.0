From: mohana sundaram <ksmoha@gmail.com>
Subject: Re: SIGSEGV
Date: Wed, 2 Mar 2005 19:18:23 +0530
Message-ID: <7fd0b9b40503020548ac32e24@mail.gmail.com>
References: <1109766028.5107.5.camel@localhost.localdomain>
Reply-To: mohana sundaram <ksmoha@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <1109766028.5107.5.camel@localhost.localdomain>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: kaushal@rocsys.com
Cc: linux-c <linux-c-programming@vger.kernel.org>

You should not handle SIGSEGV and continue the process execution. The
result is undefined.  Consider restarting the program afresh if your
program has to run all the time.

Thanks,
- Mohan.


On Wed, 02 Mar 2005 17:50:28 +0530, kaushal <kaushal@rocsys.com> wrote:
> Hello all,
>         I have big package which "must" run all the time irrespective of any
> errors.As a part of that Iam even handling the SIGSEGV.The problem is
> even if I handle the sigsegv,the handler gets called continuously in an
> infinite loop as if the signal is being recvd. continuously.How can I
> solve this issue and make my handle run only once?Does bash has such a
> mechanism internally?Any suggestions would be very helpful.
> Thanks in advance.
> 
> kaushal.
> 
> -
> To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 


-- 
The expert at anything was once a beginner.
