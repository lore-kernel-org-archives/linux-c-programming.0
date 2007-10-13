From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: how to best map/buffer a file to memory by being able to lock
 sequences thread-safe
Date: Sat, 13 Oct 2007 17:00:55 +0100
Message-ID: <18192.60343.220513.255521@cerise.gclements.plus.com>
References: <20071013000158.d011bc82.dh@triple-media.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20071013000158.d011bc82.dh@triple-media.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Dennis Heuer <dh@triple-media.com>
Cc: linux-c-programming@vger.kernel.org


Dennis Heuer wrote:

> i tried to write a memory cache for a file and keep it in sync with the
> file while threads or foreign processes are writing safely to it. then
> i found mmap and lockf but the both don't work together. i studied all
> the other alternatives i found, like fcntl or flockfile, but they
> don't support the one or the other action. for example, fcntl locks are
> not based on a per-thread base. flockfile only works on the full FILE
> object, etc. also, if i don't use mmap, as far as i can see, i have to
> map the file to a buffer myself, which causes sync-problems especially
> with foreign processes.
> 
> how can i reach the same level of features and comfort like with lockf
> and mmap without one of the both and by staying posix-compliant (at
> least)?

One option is to create another file of the appropriate size, and
obtain locks on that file instead of the mapped file. If the file is
sparse (i.e. is enlarged using ftruncate rather than by having data
written to it), it won't use significant disk space.

> by the way: can i lock sections of a plain memory buffer (mmap'ed or
> allocated with malloc or whatever) like i can do with fcntl or lockf
> to have threads not running over eachother?

You can implement locks for anything using semaphore sets, condition
variables, mutexes etc.

The only way that file locks are really any different is that they let
you effectively have a separate lock for each byte of the file without
the overhead of actually having a separate lock for each byte.

-- 
Glynn Clements <glynn@gclements.plus.com>
