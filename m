From: Ron Michael Khu <ronkhu@ntsp.nec.co.jp>
Subject: Re: Antwort: Re: Antwort: Re: -EFAULT during freeing a pointer to
 a structure
Date: Fri, 08 Oct 2004 21:59:58 +0800
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <41669D5E.1050402@hq.ntsp.nec.co.jp>
References: <OF9FBCFEF1.D1EE727C-ONC1256F27.0043E708@bln.d-trust.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <OF9FBCFEF1.D1EE727C-ONC1256F27.0043E708@bln.d-trust.de>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: p.boehm@d-trust.net
Cc: Jan-Benedict Glaw <jbglaw@lug-owl.de>, linux-c-programming@vger.kernel.org

Err.. at least two individuals have already tried to explain it you...

for test two, maybe there's somesort of a glib technicality that made u 
get away
with writing outside out of the limits u have alloted for ur datastruct...

but it doesnt mean if u're getting no errors when using even values for 
MAXNUM(or factors of 4 for that matter),
that there's nothing wrong with ur loop...(and there is... almost 
everyone in this list will point it out to you..)

I may not know how u got away with it by using even values for maxnum,
but almost everbody knows that an array created with N elements/slots in 
C,C++ or in java
could only be safely accessed/manipulated via the indices 0...N-1 
(unless if u're an expert in memory manipulation)




p.boehm@d-trust.net wrote:

>sorry, but it isn't a problem of loop. check this while running the prog...
>
>test one:
>
>     #define MAXNUM 7
>     compile it and run ...
>     you'll see while freeing ptr->next[0] an -EFAULT occours.
>
>test two:
>
>     #define MAXMUM 8
>     compile it and run ...
>     you'll see freeing ptr->next[0] works fine.
>
>my question: why it is so.
>
>thanks
>pb
>
>-
>To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
>the body of a message to majordomo@vger.kernel.org
>More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>
>  
>

