From: Jamie Le Tual <jletual@kmtechnologies.com>
Subject: Re: tcpdump equivalent for the serial port
Date: Fri, 12 Sep 2003 10:34:34 -0400
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <3F61D97A.7020202@kmtechnologies.com>
References: <3F61CC14.20607@abcpages.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <3F61CC14.20607@abcpages.com>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-c-programming@vger.kernel.org

I would probably try to see if I could alter the kernel serial port 
driver,  there may even be an API in the driver for what you want. 
That's where I would start.

Peace,
Jamie

Nicolae Mihalache wrote:

> Hello!
>
> I'm interested if somebody has any ideea how to write a program that 
> is able to sniff the data passing through a serial port the same way 
> tcpdump is able to show the data passing through the ethernet cable, 
> i.e. without disturbing the application that sends/receives the data.
> I've seen few programs that basically work as tunnels opening a 
> pseudo-console where the application connects and writing on the other 
> side to the serial device. This approach is not very useful because I 
> want to be able to start/stop my sniffer without interupting the 
> communication and also the application can control different settings 
> of the serial port which probably will not be forwarded by the tunnel.
>
> Thanks,
> mache
>
> -
> To unsubscribe from this list: send the line "unsubscribe 
> linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
> .
>



