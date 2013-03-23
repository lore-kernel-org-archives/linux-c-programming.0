From: Randi Botse <nightdecoder@gmail.com>
Subject: Sending and receiving packets from multiple lines
Date: Sat, 23 Mar 2013 09:52:41 +0700
Message-ID: <CAA6iF_6gtyZb12X7rfm2ckZ08Ff=oRT4_=s86ZFTT-1mzNp3AA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:date:message-id:subject:from:to
         :content-type;
        bh=ngJrrKuUuYir3yj/MLGrqBQxI2iJjpX8KBioeEmUX2Y=;
        b=Oz2vSmVvqhgZsSKhDIXQIIZRM6cOKeW93UdeIEHF55TGrUCLkGDjIWVOn9wS2tI2Bb
         fPqM2aBkN4NwsTUJkQIvfIrnERKv17ROZSQ+HKeQ8rbkjX+v1pGSZSejRXIlUYTadTNw
         sAOGNgjYkVPJsEHGGsrmqthxic2is9qx0ZpB4CzlXrmCNbK8K2sfk/zOV6hDzF9yIsWD
         24eSMkzEDLLulM7FUHjMVneirtD6Dl+0s65uglb443k600Iog/EAxpuHU7ic0t/Czned
         Sqnqu3xI9sfApzLTFqEZi3Ubpc0VwS0wJZGOUenfydDmglwkPEnJl3egWHChm4caEWZ6
         VdQQ==
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

Hi All,

My network implements interface bonding, aggregate several lines into
one logical line to achieve higher connection throughput and
redundancy.
I'm writing a network application in Linux that basically send packets
to another host outside. I got problem with packet ordering on
destination host, for example. packet1 from line1 should arrived
earlier than packet3 from line3, etc. I want them to be delivered in
correct order. Is this possible? if yes, what is the better way for
doing this?.

Thanks
