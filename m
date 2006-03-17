From: B S Srinidhi <srinidhi-c@deeproot.co.in>
Subject: Re: amd64 :: SIGABRT in malloc()
Date: Fri, 17 Mar 2006 11:44:23 +0530
Message-ID: <1142576064.3744.19.camel@avirat>
References: <1142504931.4517.26.camel@avirat>
	 <17433.17469.719361.117297@cerise.gclements.plus.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <17433.17469.719361.117297@cerise.gclements.plus.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

Hi,

On Thu, 2006-03-16 at 10:55 +0000, Glynn Clements wrote:
> The heap has been corrupted, e.g. due to a buffer overrun.
> 

Thanks a lot for the tip-off. :) After reading this and a suggestion
from one of my friends, I ran the program in valgrind. 

/me still wondering why didn't he think of that earlier.

> > How can I debug this problem?
> 
> Tracking down heap corruption can be awkward, as the error won't
> usually occur until some time later. There are some hints in the glibc

You are absolutely right. Such a crash occurs much later the culprit
have left the scene. Policing such a thing is quite difficult.

> Info file regarding the use of mprobe(). Another possibility is
> Electric Fence (libefence).
> 

mcheck() and mprobe() didn't help me much (or I didn't know what to
infer from their output :D)

I used valgrind instead, and it pointed out a specific error that caught
my attention:

        Address 0x6BE0300 is 0 bytes after a block of size 432 alloc'd

This error was being generated at a place where I was allocating a
structure (much before the actual crash) and without checking the return
value of malloc(), data was written into the structure. Which caused all
the problem.

Now I'm trying to analyze the output of valgrind and doing some more
checks on the code.

Thanks a lot everyone who responded to my post. :D

Srinidhi.
-- 
ASCII ribbon campaign ( )         B S Srinidhi
 - against HTML email  X          http://srinidhi.deeproot.co.in
             & vCards / \         DeepRoot Linux

