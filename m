From: Simon Drouin <sdrouin@bic.mni.mcgill.ca>
Subject: linux and pthread
Date: Wed, 10 Nov 2004 15:02:36 -0500
Message-ID: <419273DC.3050208@bic.mni.mcgill.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Linux c programming list <linux-c-programming@vger.kernel.org>

Hi all,

Not sure it is the best place to post that. Tell me if you have any 
other suggestion.

I'm running Mandrake 10 and developping a C/C++ program using multiple 
threads. My program has a main thread that manages UI and a second 
thread is in a loop that continuously grabs data from a serial port. The 
communication between the 2 threads is controled by a mutex. The 
grabbing thread holds the mutex for most of the time in its loop. My 
problem is that when the main thread tries to lock the mutex, it is 
suspended forever,  like if the grabbing thread didn't release the mutex 
lock for long enough for the main thread to lock it.

The FAQ on the LinuxThreads page says that it used to be a problem with 
versions < 0.8 of LinuxThreads. In versions 0.8 and later, a thread that 
locked a mutex while another one was holding it was sure to be scheduled 
as soon as the other thread released the mutex. And I suppose Mandrake 
10 has a version >= 0.8 since the faq was pretty old.

Now, I've been trying to figure out which version of LinuxThread I was 
using. Here's the output of find / -name 'libpthread*.so*':

/usr/lib/libpthread.so
/usr/lib/valgrind/libpthread.so
/usr/lib/valgrind/libpthread.so.0
/lib/i686/libpthread-0.10.so
/lib/i686/libpthread.so.0
/lib/tls/libpthread-0.10.so
/lib/tls/libpthread.so.0
/lib/libpthread-0.10.so
/lib/libpthread.so.0

When I do a 'ldd' on my program, I can see it is using 
/lib/tls/libpthread.so.0. Is there a documentation somewhere on what is 
what in this list. Seems like there are 2 versions of libpthread out 
there: the original LinuxThreads lib and the "Native Posix Thread 
Library"(nptl) (correct me if I'm wrong). Some forum I ran into suggests 
that what is in /lib/tls is related to nptl. Is it the case? If so, what 
are all the others? Are they all different builds of LinuxThreads?

ld seems to be falling back on /lib/i686/libpthread.so.0 if I rename the 
/lib/tls directory. If I run my program with /lib/i686/libpthread.so.0, 
my schedulling problem seems to disapeer. Is there any known bugs in 
nptl and if so, where can I get the information?

Thanks in advance.

Simon Drouin
