From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: malloc
Date: Mon, 17 Jun 2002 14:48:29 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <15629.59565.293090.791528@cerise.nosuchdomain.co.uk>
References: <LFEIJFMKHCJIHBFOGINPCEPJCBAA.elapus@ntsp.nec.co.jp>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <LFEIJFMKHCJIHBFOGINPCEPJCBAA.elapus@ntsp.nec.co.jp>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Earl R. Lapus" <elapus@ntsp.nec.co.jp>
Cc: linux-c-prog <linux-c-programming@vger.kernel.org>


Earl R. Lapus wrote:

>    I tried doing this:
>        ucp = (unsigned char *) malloc(0);
>    it was successful and returned a valid address. I was kinda hoping
>    it would do something weird...When I looked at the man page It said 
>    something like.. "If your application needs to generate empty objects, 
>    you may use malloc(0) for this purpose..."
> 
>    So my questions are:
>        What do you mean when you say EMPTY OBJECT?

A block of memory which is zero bytes long. You can't store anything
in the block, but the returned pointer is guaranteed to be unique, in
that it differs from any other valid pointer.

>        Does it ocuppy any memory storage?

Every block of memory returned from malloc() has a header, which
occupies memory.

-- 
Glynn Clements <glynn.clements@virgin.net>
