From: Suciu Flavius <suciuflavius@tiscali.de>
Subject: Re: Unix Time
Date: Sun, 26 Sep 2004 20:01:04 -0700
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <cj6vk0$c3i$1@sea.gmane.org>
References: <20040926140210.43741.qmail@web52903.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20040926140210.43741.qmail@web52903.mail.yahoo.com>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-c-programming@vger.kernel.org


  struct timeval start,stop;
  int elapsed;

  gettimeofday(&start,NULL);

  computeWhatIWant();

  gettimeofday(&stop,NULL);
 
elapsed=(stop.tv_sec-start.tv_sec)*1000000+(stop.tv_usec-start.tv_usec);
printf("sprintf:  elapsed=%5d miliseconds\n",elapsed);













Ankit Jain wrote:
> well i dont know hot to interpret unix time
> 
> gettimeofday returns time in unix format
> 
> if i am want to subtract one time from another how to
> do that?
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
> 

