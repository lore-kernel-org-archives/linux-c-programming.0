From: Celelibi <celelibi@gmail.com>
Subject: Re: Sending and receiving packets from multiple lines
Date: Sat, 23 Mar 2013 17:42:40 +0100
Message-ID: <CAJR2zJ9JTLp3w3amqhRpC7dVZDDszWF7pVTmu1AWaK4TmqzwxQ@mail.gmail.com>
References: <CAA6iF_6gtyZb12X7rfm2ckZ08Ff=oRT4_=s86ZFTT-1mzNp3AA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:in-reply-to:references:date:message-id
         :subject:from:to:cc:content-type;
        bh=1/pJPnoYOG+FRo7L0NBpJvqYWmyeTZjOh/WAlXZvlZY=;
        b=kOH3ngdkPky3oHapTCY+7nmNyqayDHwI+5u8giHd6+LoyE59bBvwiMT5btInaz0a6P
         i0VVCmvXzM/+O/6hVuWUAqobXO1fyYcI1oOnbFm6OwyR/SKjDQVfCjkIBMfrjLj5e+DB
         GH4BHe3cJyRCbB+OiNXo70JP3ygXA9Q5fFrjyghirOHAv97BNr/oYz31nWAEzIjIgzZH
         gHDjRSTDfnOxRDWfGcn7+DVD9dzFWNybRMXeO6CpDLAQwXM1WWzynZnF5RHzw6sXty7p
         sG53KUT21dLa+yWRdhxpegl8p4G7nB+R8oyJBfZeVePRQSUWme7iA6Gl1d/YDUjRvwJy
         I/Cg==
In-Reply-To: <CAA6iF_6gtyZb12X7rfm2ckZ08Ff=oRT4_=s86ZFTT-1mzNp3AA@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Randi Botse <nightdecoder@gmail.com>
Cc: linux-c-programming@vger.kernel.org

Hello,

TCP should reorder packet fragments.
If you're using UDP or a custom protocol over IP, you have absolutemy
no guarantee about the delivery of packets.

2013/3/23, Randi Botse <nightdecoder@gmail.com>:
> Hi All,
>
> My network implements interface bonding, aggregate several lines into
> one logical line to achieve higher connection throughput and
> redundancy.
> I'm writing a network application in Linux that basically send packets
> to another host outside. I got problem with packet ordering on
> destination host, for example. packet1 from line1 should arrived
> earlier than packet3 from line3, etc. I want them to be delivered in
> correct order. Is this possible? if yes, what is the better way for
> doing this?.
>
> Thanks
> --
> To unsubscribe from this list: send the line "unsubscribe
> linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
