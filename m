From: Stephen Satchell <list@satchell.net>
Subject: Re: memory capacity
Date: Mon, 08 Dec 2003 16:51:42 -0800
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <1070931102.17309.11.camel@ssatchell1.pyramid.net>
References: <3FD454BB.7050005@hq.ntsp.nec.co.jp>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <3FD454BB.7050005@hq.ntsp.nec.co.jp>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ronkhu@ntsp.nec.co.jp
Cc: linux-c-programming@vger.kernel.org

On Mon, 2003-12-08 at 02:38, ronkhu wrote:
> Can anyone help me in increasing the maximum allowable memory usage for 
> an application in HP/UX?
> 
> My superior instructed me to create an array of at least 7,140,000 
> elements(statically)... that would be able to
> store 8 bytes per index..
> 
> What compile option could i use to enhance the memory model (from small 
> to huge?) or increase the memory
> limit for an application?

So what is the limit currently?  I calculate the your array would
require 54.5 megabytes, and unless you have a VERY small swap store you
should be able to handle that easily on any modern computer with modern
operating system.  ("Modern" meaning less than four years old.)

Your other option is to learn how to do applications-level paging to
hard disk, so your RAM requirement is small -- I used to do such stuff
with minicomputers with 64 kilobytes without breaking a sweat.  By
breaking the data into fair-sized pages, you can have a decent working
set in a small footprint (512 KB if this is an old 286-based computer,
with 16-KB pages, as an example) and managing the page swapping
intelligenly, including doing some pre-sorting of input data to minimize
thrashing.

What are you going to do when those eight-byte records grow by a couple
of orders of magnitude?  Or you have to deal with multiple sets of
records in parallel?  You can't beat Parkinson's Law.

Satch


