From: soraberri <421246@posta.unizar.es>
Subject: Re: anything to do with pointer to functions maybe?
Date: Thu, 23 Dec 2004 15:19:36 +0100
Message-ID: <cqek6r$mng$1@sea.gmane.org>
References: <cqe6ed$ldf$1@sea.gmane.org> <20041223114718.GX2460@lug-owl.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20041223114718.GX2460@lug-owl.de>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-c-programming@vger.kernel.org

Jan-Benedict Glaw wrote:
> On Thu, 2004-12-23 11:24:39 +0100, soraberri <421246@posta.unizar.es>
> wrote in message <cqe6ed$ldf$1@sea.gmane.org>:
> 
>>Hi all!
>>I'm having troubles understanding code:
>>
>>what type is __sighandler_t if it is defined this way:?
>>typedef void (*__sighandler_t) (int);
> 
> 
> We define that any signal handling function doesn't return anything
> useful (void, that is), and all these functions get a single argument
> (of type int) supplied.
> 
> 
>>and then, what does this definition  mean:
>> #define SIG_IGN  ((__sighandler_t) 1)	
> 
> 
> Also, we don't want *all* signals to actually be handled. Some are to be
> ignored. Since we can only use function pointers (now of type
> __sighandler_t), we need to have a special magic value (1 in this case)
> that we can use.
> 
> However, "1" alone doesn't make a good function pointer, nor is it a
> function at all or does accept arguments. To "look" like a function
> pointer of correct type, "1" is casted to be of __sighandler_t.
> 
> There would have been another approach: we could have written a small
> function that does nothing and could be used instead. However, it's
> address could change, so it doesn't work well as an API. This is why
> instead a distenct value (1) is used instead.
> 
> MfG, JBG
> 

Thanks Jan, I think I have understood...

regards and have happy days

