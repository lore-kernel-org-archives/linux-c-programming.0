From: Christopher Quinn <cq@htec.demon.co.uk>
Subject: finer grained threading?
Date: Thu, 15 Aug 2002 15:32:01 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <3D5BBB61.7050305@htec.demon.co.uk>
References: <3D5284CF.8090708@veritel.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-c-programming@vger.kernel.org

hi list,

I have been wondering about what happens to a locked resource within a 
set of kernel threads when the holding thread causes a page fault, say 
via touching a page of a mmap'ed file.

As far as I can see, there is no system call API means for the 
thread/process to take remedial action when this I/O delay occurs -
ie. it could be useful for the holding thread to yield its lock on the 
resource, allowing other threads to progress while it sleeps.

Does anyone know otherwise?

Is there any mechanism in the kernel allowing notification of a page 
fault event (or indeed other I/O related events) to be received by, say, 
some code encapsulated in a kernel module? ie. would writing a kernel 
module be any sort of option for me?

hope that's clear.
thanks,
chris Q.

