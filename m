From: "Adam Andrew Flanczewski" <lance@slackwise.net>
Subject: Re: Network Statistics Collection
Date: Mon, 20 Sep 2004 22:32:07 -0500
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20040921033207.GA420@pendragon.level3.net>
References: <88240e9404092016313ca56ca0@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <88240e9404092016313ca56ca0@mail.gmail.com>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

Have you tried looking through /proc ? A whole wealth of system information can be gathered from procfs.

I wouldn't know how to get the specifics you ask for, but it's a start.

/* Adam "Lance" Flanczewski */


On Mon, Sep 20, 2004 at 04:31:32PM -0700, TEJAS VORA wrote:
> Hi All,
> 
> I am working on a company project and as a part of it - I have to
> collect and show some network information on the Monitoring utility.
> Please help to find out that how can I collect these information from
> a Linux Machine.
> 
> 1. Number of active TCP connection
> 2. Information of Active connections (Source and Dest IP, Source and Dest Port)
> 3. Retransmitted packets due to Duplicate ACK and SACK
> 4. Connection Duration and RTT
> 5. Transmission Troughput (in KB/Sec)
> 6. Number of Newly Created TCP Connections
> 7. Closed TCP Connections
> 8. Total Data transmitted (in byte)
> 9. Total Data Retransmitted (in byte)
> 
> Also, does anybody have any information on Watchdaog or how to use
> watchdog and SOCKS and SNOOP Daemon?
> I am using RedHat 9.0 machine.
> 
> Any help is apreciated. 
> 
> Looking for an answer.
> 
> Tejas Vora
> -
> To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
> 
