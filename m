From: David Erman <david.erman@home.se>
Subject: Re: compiling programs which use pthreads
Date: Sun, 25 Jan 2004 10:23:26 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <40138B0E.8060406@home.se>
References: <1075023389.27269.12.camel@qa.intotoind.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <1075023389.27269.12.camel@qa.intotoind.com>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: syedk <syedk@intotoinc.com>
Cc: linux-c-programming@vger.kernel.org


You need to link with  -lpthread. I.e.

gcc foo.c -lpthread

syedk wrote:
> Hi all,
>      I am getting strange results while compiling programs which use
> pthreads.
> I am working on a RedHat Linux on a 2.4 kernel.
> to start with i wrote a simple program as follows:
> 

/ Dave
