From: Tassilo Horn <heimdall@uni-koblenz.de>
Subject: Getting resource usage informations of a process
Date: Thu, 20 Apr 2006 15:27:51 +0200
Message-ID: <87r73snzqg.fsf@baldur.nicundtas.de>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

Hi all,

I've written a specialized compression utility (C++). Now I want to
compare it to some general purpose compressors like gzip, bzip2 and
compress. CPU time and memory consumption are the main things of
interest.

Therefore I tried using GNU time [1] (version 1.7). With it I get the
correct CPU time, but the memory resources are always zero (%p and %M in
time's format string). I tested this on Linux 2.4 & 2.6, Mac OS X and
OpenBSD.

Then I tried writing a simple replacement [2] which utilizes the
getrusage() (via wait4()) system call. But with this, the memory
resources are always zero, too. Looking into GNU time's source code, it
seems that it uses the same approach, so this was a no-go. ;-)

Is getrusage()/wait4() broken, or not intended to be used like this?

How can I get correct memory resource usage informations of a (child)
process (without changing the code of the process' applications)?

Kind regards,
Tassilo

Footnotes:
[1] http://www.gnu.org/software/time/time.html
[2] http://www.uni-koblenz.de/~heimdall/rusage.c

