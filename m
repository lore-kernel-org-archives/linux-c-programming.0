From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: select() problem/feature
Date: Mon, 24 Jul 2006 17:35:04 +0100
Message-ID: <17604.63160.842162.982799@cerise.gclements.plus.com>
References: <44C4CFFC.8040909@zg.t-com.hr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <44C4CFFC.8040909@zg.t-com.hr>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Nikola <root.admin1@zg.t-com.hr>
Cc: linux-c-programming@vger.kernel.org


Nikola wrote:

> i am writing small daemon.....and when i was seeing the end ......that 
> was just the beginning
> of my problems.
> 
> General idea was to monitor list of files that was given on start.

> if I do
> #echo "some new line" >> test1.txt
> 
> i would see on my screen that select figured it out and i am having new 
> data for processing and it
> would print it out.

select() is of no use here; files are always "ready" for I/O. select()
is intended for use on descriptors where I/O calls may block
indefinitely: pipes, sockets, terminals and other "slow" character
devices.

You can either poll the file at intervals (like "tail -f ..." does),
or use the linux-specific "dnotify" ioctl()s (see the file
Documentation/dnotify.txt in the kernel source tree for details).

> but when i uncomment last fprintf my while and select goes 
> ballistic.....it prints  numbers forever...not
> blocking......

None of the syscalls in your code will ever block; your program will
be running continuously, using up to 100% CPU. Uncommenting the
fprintf() call simply makes this obvious; it isn't changing anything.

-- 
Glynn Clements <glynn@gclements.plus.com>
