From: Prasanta Sadhukhan <Prasanta.Sadhukhan@Sun.COM>
Subject: Re: Running status of a process
Date: Wed, 21 Mar 2007 14:03:09 +0530
Message-ID: <4600EDC5.20209@sun.com>
References: <4600E921.5010106@sun.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-reply-to: <4600E921.5010106@sun.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; format="flowed"; charset="us-ascii"
To: Prasanta Sadhukhan <Prasanta.Sadhukhan@Sun.COM>
Cc: linux-c-programming@vger.kernel.org

Prasanta Sadhukhan wrote:

> Hi,
>
> Can anyone point as to how can I obtain the information whether a 
> non-child process is still running?
>
> I tried waitpid(pid, &status, WNOHANG) but always receive return value 
> as -1 with errno as ECHILD.
> Since the processes I am waiting for is not the child of this process 
> from where I am calling waitpid() (ie, they are independant 
> processes), it might be a valid error but what is the other alternative?
>
> Regards
> Prasanta

Got it...Should have called kill(pid, 0)
Thanks anyways

>
> -
> To unsubscribe from this list: send the line "unsubscribe 
> linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



