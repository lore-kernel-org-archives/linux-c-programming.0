From: Jason Cooper <jcooper@nevernight.net>
Subject: Re: getprotobyname failure
Date: Tue, 25 Feb 2003 09:24:41 -0500
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20030225142441.GN4843@nevernight.net>
References: <00ed01c2dca8$ab5e84f0$3002a8c0@yigitcan>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <00ed01c2dca8$ab5e84f0$3002a8c0@yigitcan>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

Yigit Can (yigit.can@karel.com.tr) wrote:
> 
> I can run this program on my development machine=20
> but when I try to run this program on my basic kernel it gives me the =
> "memory fault" error.
> 
> I'm using libc-2.2.5 on a powerpc 8xx development kit
> so, i'm using the same library on the host and target machine.
> 
> my development machine has celeron  type processor
> and my target board is TQM850L (has ppc_850 processor).
> 
> I've replaced my protocols and nsswitch.conf files with host machines (my
> protocols file contians "tcp 6 TCP" line)
> and that's made no difference.

Yigit, 

My first guess would be byte order because of the different processors.  Try
this page out:

http://www.ecst.csuchico.edu/~beej/guide/net/bgnet.pdf

It is a beginners guide, however, it does talk a bit about byte order, etc.

Cooper.
