From: SUBREDU Manuel <diablo@iasi.roedu.net>
Subject: Re: non-blocking server?
Date: Sat, 18 Jan 2003 00:38:50 +0200 (EET)
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <Pine.GSO.4.10.10301180036380.23179-100000@ns.iasi.roedu.net>
References: <200301172219.14911.wrazlov@gmx.net>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <200301172219.14911.wrazlov@gmx.net>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wrazlov <wrazlov@gmx.net>
Cc: linux-c-programming@vger.kernel.org





Hy,

 a more practical solution is to use the select() function, who help's you
write a server in C who can serve multiple clients at once but does not require
any thread programming. And, as far as I know it's also supported by M$ C
compiler and linker.

On Fri, 17 Jan 2003, Wrazlov wrote:

> Hello,
> the last time I tried to write a server in C I had the problem that it had to 
> wait for Bytes to arrive at the open port which blocked the process.
> A solution would be, of course, threading of the server-process or using 
> signals, but I want this code to be used in a windows-environment, too.
> Is that possible? Does the standard-c-library provide some kind of signals or 
> thread-programming for all systems?
>    
>   wrazlov
> -- 
> "What do you get if you multiply six by nine?"
> -
> To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

