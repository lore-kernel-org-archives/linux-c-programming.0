From: Christopher Quinn <cq@htec.demon.co.uk>
Subject: Re: finer grained threading?
Date: Thu, 15 Aug 2002 16:37:43 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <3D5BCAC7.80701@htec.demon.co.uk>
References: <3D5284CF.8090708@veritel.com.br> <3D5BBB61.7050305@htec.demon.co.uk> <3D5BC1F6.1040001@htec.demon.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Christopher Quinn <cq@htec.demon.co.uk>
Cc: linux-c-programming@vger.kernel.org

I'm tripping over myself...
the 'feature' I'm after is as originally stated, not as might or might 
not be fulfilled by DECthreads/LinuxThreads
ie. ability to register interest in/ receive noticification of, 
page-fault events.

sorry,
chris

Christopher Quinn wrote:
> Ah!  As suspected I am not the first to think about this!  I have just 
> found a DECthreads page mentioning upcalls and the ability to switch 
> threads on a page fault event.
> 
> Is it correct to say LinuxThreads(pthreads impl.) cannot offer this 
> feature?
> Any suggestions for alternative thread packages for linux that do?
> 
> cheers,
> chris Q.
> 

