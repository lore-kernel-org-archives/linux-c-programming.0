From: Alphex Kaanoken <kaanoken@crew.org.ru>
Subject: Re: timer->result
Date: Tue, 28 Sep 2004 22:40:47 +0400
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20040928224047.34e5ffc4.kaanoken@crew.org.ru>
References: <20040928181236.52374.qmail@web52904.mail.yahoo.com>
Reply-To: kaanoken@crew.org.ru
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20040928181236.52374.qmail@web52904.mail.yahoo.com>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ankit Jain <ankitjain1580@yahoo.com>
Cc: linux-c-programming@vger.kernel.org

On Tue, 28 Sep 2004 19:12:36 +0100 (BST)
Ankit Jain <ankitjain1580@yahoo.com> wrote:

> hi
> 
>  #include<stdio.h>
>  #include<sys/time.h>
>  #include<time.h>
> 
>  int main(void)
>  {
>          struct timeval t1,t2,result;
>          gettimeofday(&t1,NULL);
>          usleep(500);
>          gettimeofday(&t2,NULL);
>          timersub(&t2,&t1,&result);
>          printf("%ld",result.tv_usec);
> }
> now technically i feel it should display 500
> microsecond even not accurate then also it should show
> near by 500 or less than 600 microsecond atleast.
> 
> on my system it shows 40000 microsecond....
> whats the reason? if i remove usleep then it shows 2
> or 1 microsecond.....
> 
> whats wonrg here?
Linux does not real time, and this calculation very approximetly...
> 
> thanks
> 
> ankit
> 
> ________________________________________________________________________
> Yahoo! Messenger - Communicate instantly..."Ping" 
> your friends today! Download Messenger Now 
> http://uk.messenger.yahoo.com/download/index.html
> -
> To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html


-- 
Alphex Kaanoken,
Senior Developer of
Crew IT research labs.
Web: http://crew.org.ru
Mail: kaanoken at crew.org.ru
