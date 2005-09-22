From: Hagen Paul Pfeifer <hagen@jauu.net>
Subject: Re: How to use /dev/random
Date: Thu, 22 Sep 2005 11:42:28 +0200
Message-ID: <20050922094228.GB22985@0xdef.net>
References: <200509221111.07711.hitoc_mail@yahoo.it>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <200509221111.07711.hitoc_mail@yahoo.it>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

* HIToC | 2005-09-22 11:11:07 [+0200]:

>Hello list!
>	Is there anyone who can explain how to use /dev/random in
>order to obtain random numbers?

One of the best source out there is gnupg - especially
cipher/rndlinux.c.

There you will find everything you wan't! ;-)

>I don't know if this is the best manner whitin the Linux Kernel to
>generate random numbers, but if someone has better ideas, they
>will be greatly appreciated.

It is, except you own a cryptographic rnd device ...

>HIToC

HGN

-- 
A computer is like an Old Testament god, with a lot of rules  and
no mercy. - Joseph Campbell
