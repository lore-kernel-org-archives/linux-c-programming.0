From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: Beginning programmer + simple program
Date: Mon, 19 Jan 2004 06:36:52 +0000
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <16395.31492.620227.139306@cerise.nosuchdomain.co.uk>
References: <200401171852.03121.eric@cisu.net>
	<16393.61626.659377.266758@cerise.nosuchdomain.co.uk>
	<200401180000.26606.eric@cisu.net>
	<200401180054.39404.eric@cisu.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <200401180054.39404.eric@cisu.net>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Eric <eric@cisu.net>
Cc: linux-c-programming@vger.kernel.org


Eric wrote:

> > > >       This program is pretty fast. It parsed a 2.3MB file in about a
> > > > second. The implementation should be pretty close to O(1) , probably
> > > > slightly more. Since it parsed this pretty fast with very low overhead,
> > > > I am not worried about speed, just correctness.
> > > >
> 
> Here is an update. I am quite pleased with the feedback you have given me and 
> how it has improved my program. It scanned a 73MB text file in 7 seconds. I 
> would say thats even better! Silly read() code. That was stupid to begin 
> with.
> 	Unfortunatly, I don't believe your code will work for me. I dont want to run 
> the risk of overflowing the buffer as I believe you might with your read() 
> command. I will be getting an unknown amount of data (possibly file 
> attachments) and I dont want to allocate a huge(couple MB) buffer for an 
> attachement. I'd rather just pass it along in byte for byte as it comes in.
> 	Does that sound right? Or am I mis-reading your code. I believe you are 
> assuming small text files.

No; I'm using a double-nested loop. The outer loop reads at most
BUFFERSIZE bytes into a buffer on each pass, and repeats until the
entire file has been read. The inner loop processes the bytes which
have been read on that pass.

When using the *_unlocked() macros, there may not be a significant
difference between the two approaches. Without optimisation, the
double-nested loop would be slightly quicker (as the loop test is
simpler), but optimisation may eliminate the difference.

Using the locked I/O functions could incur a substantial performance
hit, as they have to lock/unlock the FILE structure for each
operation. While the cost of obtaining and releasing an uncontested
lock is small in absolute terms, it could be a substantial proportion
of the overall cost for a tight getc/putc loop.

> 	This is MUCH more readable. I've re-thought my approach and realized I don't 
> even need a buffer. This has shortened my code considerably.
> 
> BTW, is there a good method for 1-1 copy from STDIN to STDOUT?
> time cat < largefile > testfile 
> gives me .5s
> while my program will find the string in the first few lines but still take 
> 10s to do essentially the same operation. After finding the string it just 
> goes to dump_full_message() which I want to act just like cat in this sense. 

First, try using the *_unlocked functions. However:

The fastest way to copy data between two files is to mmap() both
source and destination and use memcpy() to copy the data. This only
requires one copy rather than two (read() copies from the kernel's
buffers to application memory, write() copies from application memory
to the kernel's buffers).

However, mmap() only works with files and block devices, and not with
pipes, sockets or character devices. Also, you need to create space in
the destination (with ftruncate()) first.

If the source is a file but the destination isn't, you can mmap() the
source then write() the mmap()ed region to the destination. Similarly,
if the destination is a file but the source isn't, you can mmap() the
destination then read() into it. Again, the data is only copied once.

If neither source nor destination can be mmap()ed, you may be able to
use sendfile(); however, this isn't portable and doesn't work with all
types of streams (IIRC, one of them has to be a socket). Otherwise,
you're stuck with read()/write(), which involves two copies.

-- 
Glynn Clements <glynn.clements@virgin.net>
