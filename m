From: Per Jessen <per@computer.org>
Subject: building libc
Date: Mon, 10 Dec 2007 15:41:05 +0100
Message-ID: <475D5001.60600@computer.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

All,

I'm trying to build a shared libary with a modified getaddrinfo() from
glibc.  getaddrinfo() sorts the results from DNS according to RFC3484,
but this screws up round-robin load-balancing.

Ian Jackson put a fix into ubuntus glibc 2.6.1, and this is what I'm
trying to use.

So, I've got glibc-2.6.1 from ubuntu all built, and I'm now trying to
build my own mygetaddrinfo.so containing just the patched getaddrinfo().
Has anyone attempted something similar, and if so, do you have any hints
for me?
I can build mygetaddrinfo.so, but when I try to use it (with
LD_PRELOAD), it keeps reporting unresolved symbols such as __inet_aton.


cheers
Per Jessen, Zurich
