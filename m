From: Luciano Moreira - igLnx <lucianolnx@ig.com.br>
Subject: Re: Efficient UDP Programming
Date: Mon, 23 Aug 2004 10:10:47 -0300
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <4129ECD7.9040305@ig.com.br>
References: <1093057706.5080.28.camel@nicodemus>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <1093057706.5080.28.camel@nicodemus>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Chuck Winters <chuckw@ieee.org>
Cc: linux-c-programming@vger.kernel.org

I suggest you to have a fixed size for your header, then you can read 
the header that ll say you about the rest of data following the header.

Luciano

Chuck Winters escreveu:

>Is there anyway of reading some data from a UDP socket without removing
>it from the received queue?  What I need to do is read in the header
>from a packet to determine how large of a memory chunk I need to
>allocate.
>
>Thanks,
>Chuck
>
>-
>To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
>the body of a message to majordomo@vger.kernel.org
>More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>
>  
>
