From: Daniel Souza <thehazard@gmail.com>
Subject: write arbitraty data to a running process memory
Date: Fri, 5 Nov 2004 05:15:06 -0200
Message-ID: <e1e1d5f4041104231529eb739d@mail.gmail.com>
Reply-To: Daniel Souza <thehazard@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

hi, im getting a bit confused about somethings... first, looks to me
that under >= 2.4 kernels, we cant mmap() a /proc/pid/mem file... (not
tested by me, just heard at linux-kernel mailing list) so, there's a
way to write to a running process memory (without use ptrace will be
better, because its disabled in some systems) ? for example, supposing
that there is a little program running as pid 1000, that has a little
buffer of 1024 bytes at address 0x80486ab... and I want to access the
content of that buffer via /proc/1000/mem. How can I calculate the
offset that I need start reading within the memory file that will be
exactly the start of the buffer ? how can I calculate the
correspondent areas of /proc/1000/maps into /proc/1000/mem (if that
maps are really in the mem file) ? like...

root@fooboo:~# cat /proc/1000/maps
08048000-08057000 r-xp 00000000 03:06 13385      /root/fooboo-bin
08057000-08059000 rw-p 0000f000 03:06 13385      /root/fooboo-bin
08059000-0805c000 rwxp 00000000 00:00 0
40000000-40014000 r-xp 00000000 03:06 12031      /lib/ld-2.3.2.so
40014000-40015000 rw-p 00013000 03:06 12031      /lib/ld-2.3.2.so
40015000-40016000 rw-p 00000000 00:00 0
4001f000-40147000 r-xp 00000000 03:06 12065      /lib/libc-2.3.2.so
40147000-4014b000 rw-p 00128000 03:06 12065      /lib/libc-2.3.2.so
4014b000-4014e000 rw-p 00000000 00:00 0
bffff000-c0000000 rwxp 00000000 00:00 0

I want to know that, for example, the range of each map in the mem file... like
08048000-08057000 r-xp 00000000 03:06 13385      /root/fooboo-bin
starts at offset 0xAAAAAAAA and ends at 0xBBBBBBBB in the /proc/1000/mem file

And other things, like... where the stack begins within /proc/1000/mem
? is there any docs about the layout of a usual /proc/x/mem file ? I
wrote a little app that can get cpu registers etc from a running
process... so, having the current stack pointer, can I reproduce a
backtrace ? is there any tool like "dress" (from lcamtuf, looks like
its not running at 2.4 kernels... at least in my slack10 box... or im
getting fooled by my self stupidness... lol) that can recover a
stripped binary (at least part of it) ? how can I access (suposing
that its not a stripped binary) the tables like relocation, dynamic
symbols, etc in memory ? (anyways, I believe that read the executable
file will be easier than the direct memory... am I wrong? but I want
to know how to get that from memory, cuz as I believe, the executable
code is in the /proc/pid/mem file, so I can also read the tables from
a process that the executable file was removed after it started)

Ok, i'll stop right here =X

thanks !

Daniel


-- 
making the world a better place to live since '85
