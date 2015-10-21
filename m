From: "Daniel." <danielhilst@gmail.com>
Subject: Does __attribute__((__packed__)) aplies to types or variables?
Date: Wed, 21 Oct 2015 15:56:29 -0200
Message-ID: <CAF3SDA6FP6=uqs-37_iTH0Qf2hS5Eh5ONVUVcZqEtc3AQ69cfA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=oDd1NRpFWSg6/O3a13M3Ogm3bwIlmj+IOXenaoJqo9I=;
        b=vUgCTX8Vs/3wnJDcsTdl8eZlBVkuJxpbMGkbFILiKEJ2UaVXOsYU7Nt1Fj1qV9uhpK
         r1mU7+gTThRcfAnffMgGFtK2GQ+gD+ryoYhQOYSlLJCqa4odiAhbF9LxdtHKDWyqlhCn
         g24VBl0X/xSC3eKtr83lW9fQkt9SBLcVb5Wus6PAWe9aJhTvyD1QnPY9kh+nZFCMjLXI
         xD9yzM4tpNn3DStC1QQY9eBvy6XF7X/mmZvM/psRusZiRg1wo5KKirxqUwLbCQ+b08mp
         cJvYNyIyIe+s8FNrq15x9TOjSJmZ30DkacZeYjUup41afLCmmD7fO0BLfsys3xk7ZM49
         Xg6A==
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "linux-c-programming@vger.kernel.org" <linux-c-programming@vger.kernel.org>

Suppose that I have a declaration:

struct __attribute__((__packed__)) foo {
  char ch;
  int number;
};

Will be any variable of this type be packed?

The real world thing is: I have a code that come up from 8bit world,
with a lot of lots of chained structures that are transferred throght
some radio frequence module, I need be sure that all this structs have
no padding so that they can be transferred as they are to radio. To
achieve this I've
putted __attribute__((__packed__)) to every struct and inner struct
that are sended through RF,
but I read at some StackOverflow post that packed attribute aplies to
variables not to types,
so I came here ask to experts. Is that true?

At gcc manual I found Type Attributes and Variable attributes, so I'm
assuming both exists how differentiate from one to another?

Regards,

-- 
"Do or do not. There is no try"
  Yoda Master
