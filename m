From: manishbansode@gmail.com
Subject: pthread_create hangs.
Date: Thu, 14 Apr 2011 03:36:24 -0400
Message-ID: <29049303.11302766584588.JavaMail.root@ip-10-131-22-205>
Reply-To: manishbansode@gmail.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

Hi,

Im writing a FactCGI application which creates some threads. I observed that pthread_create call hangs.
I attached the process using GDB. Here is the backtrace:-
(gdb) bt
#0  0x00000032240dfade in __lll_lock_wait_private () from /lib64/libc.so.6
#1  0x0000003224076a5b in _L_lock_1530 () from /lib64/libc.so.6
#2  0x000000322406fe32 in arena_get2 () from /lib64/libc.so.6
#3  0x0000003224074a4b in calloc () from /lib64/libc.so.6
#4  0x000000322300ff33 in _dl_allocate_tls () from /lib64/ld-linux-x86-64.so.2
#5  0x0000003224c06eb9 in pthread_create@@GLIBC_2.2.5 () from /lib64/libpthread.so.0
#6  0x00000000004031ea in main () at ./artemis_pull.c:507


Please give me some pointers.

-Manish.

--
This message was sent on behalf of manishbansode@gmail.com at openSubscriber.com
http://www.opensubscriber.com/messages/linux-c-programming@vger.kernel.org/topic.html
