From: Francois Grieu <fgrieu@gmail.com>
Subject: Finding how much data is available for read from a SOCK_SEQPACKET
Date: Wed, 25 Mar 2009 10:39:01 +0100
Message-ID: <C5EFBA45.17C2D%fgrieu@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:user-agent:date:subject:from
         :to:message-id:mime-version:content-type:content-transfer-encoding;
        bh=MBHRJ/xK1IeWAvHTBne1oBkuoLiNI+OrM1uyhyK//bI=;
        b=XO5DAY0nqtO6gSYSEkCnHuIuLkOJ6uvbMkGFbhdyDGEE1OuT4cbnFlPsfpQZRqtc8D
         0F4AQXq17V2nVJhvACdJxD2vFNTimxU2t3p/g6wh6y1HOVKmiOfRGjrRRPwom2Is1mtO
         kXOhh1d3Em2W5PdWkrb4MCYBUDc5zQfUmdKyo=
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

Hello,

I have a working program that receives blocks of data from a
SOCK_SEQPACKET using a blocking read(). So far I use a
fixed-size buffer of the maximum size.

I would like to query for the size available, malloc a block
of the appropriate size, then read. Is that feasible?

Note: I think that I can not put the size at the head of the
packet since 
" SOCK_SEQPACKET
   Provides a sequenced, reliable, two-way connection-based
   data transmission path for datagrams of fixed maximum length;
   a consumer is required to read an entire packet with each
   read system call."

TIA,
  Francois Grieu

