From: "Leslie P. Polzer" <leslie.polzer@gmx.net>
Subject: Re: String comparison for fixed strings
Date: Wed, 15 Aug 2007 19:26:55 +0200 (CEST)
Message-ID: <3493.84.157.36.125.1187198815.squirrel@viridian.dnsalias.net>
References: <9870a8150708150406x6297b877u473bfbbc62949f10@mail.gmail.com>
    <200708150918.52599.kratzers@pa.net>
    <18115.4550.134335.647087@cerise.gclements.plus.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <18115.4550.134335.647087@cerise.gclements.plus.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Glynn Clements <glynn@gclements.plus.com>
Cc: kratzers@pa.net, KhaOsh <ficheironegro@gmail.com>, linux-c-programming@vger.kernel.org


> 3. An actual loop is typically quicker than an "unrolled" loop (where
> you just repeat the loop body) as it results in smaller code and thus
> better cache coherency.

I'm not sure whether it was the OP's intention to talk about
the (dis)advantages of unrolled code.


> All things considered, strcmp() is likely to be faster.

Given these things:

1. The null byte check is mandatory.

2. The haystack string is not _considerably_ larger than the
   needle string.


