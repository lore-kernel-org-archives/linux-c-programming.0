From: Christoph Bussenius <busseniu@cip.physik.uni-muenchen.de>
Subject: Re: Nevermind, I'm stupid:  Memory Overright problem.
Date: Wed, 2 Jun 2004 21:11:59 +0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20040602191159.GB28817@opaque>
References: <1086149906.23026.2.camel@localhost>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1086149906.23026.2.camel@localhost>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

Hi,

there is at least one more problem with your program.

>   while(port_ptr && *port_ptr != ':') port_ptr++; //search for ':'

This line will increment port_ptr until it becomes NULL. I guess this is
not what you wanted.

However you should not use perror() all the time to report errors, for
it will print the error string of the most recent system call, which is
--again-- not what you want.

Regards
Christoph

-- 
``There's no dark side of the moon, really
Matter of fact, it's all dark''

--Pink Floyd
