From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: The stickybit!!
Date: Sat, 18 Dec 2004 00:25:34 +0000
Message-ID: <16835.30974.291491.153681@cerise.gclements.plus.com>
References: <1103265276.6880.8.camel@myLinux>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <1103265276.6880.8.camel@myLinux>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jagadeesh Bhaskar P <jbhaskar@hclinsys.com>
Cc: Linux C Programming <linux-c-programming@vger.kernel.org>


Jagadeesh Bhaskar P wrote:

> 	Though it is known that stickybit is obsolete, im just curious to see
> the effect of setting a sticky bit on an executable file.
> 
> 	Is there a way to findout the data if residing in swap area after the
> process is terminated, using a C program??

Read-only sections (e.g. text, rodata) of binaries (executables or
libraries) will never end up in the swap file. Either they reside in
RAM or they don't; if they don't, they will be read in from the binary
as required.

The swap file is only used for storing mutable data (e.g. data or bss
sections of binaries, memory allocated by brk() or anonymous mmap(),
or writeable mmap()ed files using MAP_PRIVATE).

Immutable data is already stored in the mapped file, so there's no
point in copying it to swap.

As for the question which you presumably meant to ask, i.e. how to
determine if a particular page of a file is currently stored in
physical RAM, I don't have an answer.

Obviously, the kernel has this information, so you could always dig it
out of /dev/kmem or /proc/kcore or similar. I don't know whether
there's a better interface.

-- 
Glynn Clements <glynn@gclements.plus.com>
