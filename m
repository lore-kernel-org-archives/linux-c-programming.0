From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: Getting resource usage informations of a process
Date: Fri, 21 Apr 2006 14:47:08 +0100
Message-ID: <17480.57948.42893.816927@cerise.gclements.plus.com>
References: <87r73snzqg.fsf@baldur.nicundtas.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <87r73snzqg.fsf@baldur.nicundtas.de>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Tassilo Horn <heimdall@uni-koblenz.de>
Cc: linux-c-programming@vger.kernel.org


Tassilo Horn wrote:

> I've written a specialized compression utility (C++). Now I want to
> compare it to some general purpose compressors like gzip, bzip2 and
> compress. CPU time and memory consumption are the main things of
> interest.
> 
> Therefore I tried using GNU time [1] (version 1.7). With it I get the
> correct CPU time, but the memory resources are always zero (%p and %M in
> time's format string). I tested this on Linux 2.4 & 2.6, Mac OS X and
> OpenBSD.
> 
> Then I tried writing a simple replacement [2] which utilizes the
> getrusage() (via wait4()) system call. But with this, the memory
> resources are always zero, too. Looking into GNU time's source code, it
> seems that it uses the same approach, so this was a no-go. ;-)
> 
> Is getrusage()/wait4() broken, or not intended to be used like this?

GNU libc uses mmap(MAP_ANONYMOUS) for large blocks; this isn't
accounted for by conventional Unix resource handling mechanisms
(getrusage, setrlimit etc).

> How can I get correct memory resource usage informations of a (child)
> process (without changing the code of the process' applications)?

Parse /proc/<pid>/maps. Any entries with an inode of zero (other than
the heap and stack regions) correspond to mmap(MAP_ANONYMOUS).

-- 
Glynn Clements <glynn@gclements.plus.com>
