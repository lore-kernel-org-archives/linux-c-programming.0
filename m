From: Dennis Heuer <dh@triple-media.com>
Subject: how to best map/buffer a file to memory by being able to lock
 sequences thread-safe
Date: Sat, 13 Oct 2007 00:01:58 +0200
Message-ID: <20071013000158.d011bc82.dh@triple-media.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

hello

i tried to write a memory cache for a file and keep it in sync with the
file while threads or foreign processes are writing safely to it. then
i found mmap and lockf but the both don't work together. i studied all
the other alternatives i found, like fcntl or flockfile, but they
don't support the one or the other action. for example, fcntl locks are
not based on a per-thread base. flockfile only works on the full FILE
object, etc. also, if i don't use mmap, as far as i can see, i have to
map the file to a buffer myself, which causes sync-problems especially
with foreign processes.

how can i reach the same level of features and comfort like with lockf
and mmap without one of the both and by staying posix-compliant (at
least)?

by the way: can i lock sections of a plain memory buffer (mmap'ed or
allocated with malloc or whatever) like i can do with fcntl or lockf
to have threads not running over eachother?

regards,
dennis heuer
