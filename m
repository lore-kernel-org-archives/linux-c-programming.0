From: Andrei Bunghez <andrei.bunghez@gmail.com>
Subject: Re: constant in C
Date: Fri, 24 Sep 2004 10:18:31 +0300
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <a7ed6e3304092400187377b2d6@mail.gmail.com>
References: <20040924033646.62233.qmail@web52901.mail.yahoo.com>
Reply-To: Andrei Bunghez <andrei.bunghez@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20040924033646.62233.qmail@web52901.mail.yahoo.com>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ankit Jain <ankitjain1580@yahoo.com>
Cc: linux prg <linux-c-programming@vger.kernel.org>

Hmm.. actually you can use sizeof(const), and it returns 4, as
123456789 is a unsigned int constant.

Andrei


On Fri, 24 Sep 2004 04:36:46 +0100 (BST), Ankit Jain
<ankitjain1580@yahoo.com> wrote:
> what is the size of the constant
> 
> i.e #define const 123456789
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
