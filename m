From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: using sh in execl command in C
Date: Mon, 6 Jan 2003 15:43:36 +0000
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <15897.42024.690331.181717@cerise.nosuchdomain.co.uk>
References: <426C1E9EBA27D411839000D0B74752F80562C4B3@punmsg02.ad.infosys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <426C1E9EBA27D411839000D0B74752F80562C4B3@punmsg02.ad.infosys.com>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: nomit kalidhar <nomit_kalidhar@infosys.com>
Cc: linux-c-programming@vger.kernel.org


nomit kalidhar wrote:

> I have the following snippet in C
> 
> Main()
> 
> {
>             execl("/usr/bin/sh","Name","-c","ls",NULL);
> }
> 
> in the execl instead of "Name" I can specify any thing it does not
> affect the program. I wanted to what is the field where the "Name" is
> used for.

All arguments after the first are used to initialise argv[] in the new
program, so the second argument becomes the value of argv[0].

-- 
Glynn Clements <glynn.clements@virgin.net>
