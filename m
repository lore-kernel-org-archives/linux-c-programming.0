From: Luciano Moreira - glnx <lucianomx@gmail.com>
Subject: To control the use of max. processor capacity (system call ?)
Date: Fri, 20 May 2005 21:40:19 -0300
Message-ID: <428E8373.3060809@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-c-programming <linux-c-programming@vger.kernel.org>

Hi guys !

I never saw this problem, but recently one of our processing programs 
are using the maximum capacity of machine processor, leaving some others 
resources of the Linux Operation Systems to run slowly. We never used 
techniques to pause processing, like is usually need in Windows. Hence, 
we leave OS to control the processor's slices.

Instead of attacking OS kernel settings, does exist some recomended 
system call (API) on Linux to do some micro-pauses during processing, to 
leave others deamons to run with its normal performance ?

Maybe it's a priority approach, but I m looking for something different. 
Does it exist ?

Thanks.

Luciano

