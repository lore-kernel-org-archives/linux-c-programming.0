From: Christopher Quinn <cq@htec.demon.co.uk>
Subject: Re: finer grained threading?
Date: Thu, 15 Aug 2002 16:00:06 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <3D5BC1F6.1040001@htec.demon.co.uk>
References: <3D5284CF.8090708@veritel.com.br> <3D5BBB61.7050305@htec.demon.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Christopher Quinn <cq@htec.demon.co.uk>
Cc: linux-c-programming@vger.kernel.org

Ah!  As suspected I am not the first to think about this!  I have just 
found a DECthreads page mentioning upcalls and the ability to switch 
threads on a page fault event.

Is it correct to say LinuxThreads(pthreads impl.) cannot offer this feature?
Any suggestions for alternative thread packages for linux that do?

cheers,
chris Q.


Christopher Quinn wrote:
> hi list,
> 
> I have been wondering about what happens to a locked resource within a 
> set of kernel threads when the holding thread causes a page fault, say 
> via touching a page of a mmap'ed file.
> 
> As far as I can see, there is no system call API means for the 
> thread/process to take remedial action when this I/O delay occurs -
> ie. it could be useful for the holding thread to yield its lock on the 
> resource, allowing other threads to progress while it sleeps.
> 
> Does anyone know otherwise?
> 
> Is there any mechanism in the kernel allowing notification of a page 
> fault event (or indeed other I/O related events) to be received by, say, 
> some code encapsulated in a kernel module? ie. would writing a kernel 
> module be any sort of option for me?
> 
> hope that's clear.
> thanks,
> chris Q.
> 
> -
> To unsubscribe from this list: send the line "unsubscribe 
> linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 



-- 
rgrds,
Chris Quinn

