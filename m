From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: When to use optimization ?
Date: Mon, 1 Dec 2003 06:59:52 +0000
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <16330.59112.206365.645235@cerise.nosuchdomain.co.uk>
References: <3FCAA303.8000202@saklawi.info>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <3FCAA303.8000202@saklawi.info>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jad Saklawi <jad@saklawi.info>
Cc: linux-c-programming@vger.kernel.org


Jad Saklawi wrote:

> When to use optimization in gcc (for example when i have loops, heavy 
> IO, ???)

Use optimisation for building "production" binaries (i.e. those which
are simply meant to be run by a user). Don't use optimisation when
building binaries which you wish to debug with e.g. gdb.

> and what is the difference between the optimization levels.

The "Optimize Options" section in the "gcc" Info file documents
exactly which optimisations are enabled by the different levels.

-- 
Glynn Clements <glynn.clements@virgin.net>
