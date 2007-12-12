From: Per Jessen <per@computer.org>
Subject: Re: building libc
Date: Wed, 12 Dec 2007 21:15:33 +0100
Message-ID: <47604165.2070305@computer.org>
References: <475D5001.60600@computer.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <475D5001.60600@computer.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

Per Jessen wrote:
> All,
> 
> I'm trying to build a shared libary with a modified getaddrinfo() from
> glibc.  getaddrinfo() sorts the results from DNS according to RFC3484,
> but this screws up round-robin load-balancing.
> 
> Ian Jackson put a fix into ubuntus glibc 2.6.1, and this is what I'm
> trying to use.
> 
> So, I've got glibc-2.6.1 from ubuntu all built, and I'm now trying to
> build my own mygetaddrinfo.so containing just the patched getaddrinfo().
> Has anyone attempted something similar, and if so, do you have any hints
> for me?

Alright, I realize this was perhaps a little unclear.  What I'm trying
to achieve is actually quite simple:

- to replace the normal getaddrinfo() routine from the default glibc
libary with my own version.

My "own" version just happens to be 2000 lines of getaddrinfo from the
ubuntu glibc which was patched to fix the RFC3484 problem.  I'm just not
very keen on working my way through the 2000 lines and fixing things
such that it will compile outside of the complete glibc tree.


Per Jessen, Zurich

