From: Holger Kiehl <Holger.Kiehl@dwd.de>
Subject: Where am I using so much memory?
Date: Sun, 22 Jul 2007 11:26:54 +0000 (GMT)
Message-ID: <Pine.LNX.4.64.0707221046430.18612@praktifix.dwd.de>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

Hello

I am trying to find out why one of my process (written in C) is suddenly
using so much memory. Under normal conditions VSZ is 5132 and RSS is 2020.
Now after running a view days VSZ is 280896 and RSS is 13700. And it stays
at that level, so I assume it must have been in some code pass that is
hardly used. The program is large so I am looking for a way to locate
the variable that uses the memory with the help of gdb. The process
is compiled with debug information (-ggdb3).

Looking at /proc/29570/smaps (29570 is the process ID of the process in
question) I find the following:

    2b92d1283000-2b92e1d8e000 rw-p 2b92d1283000 00:00 0
    Size:            273452 kB
    Rss:               8328 kB
    Shared_Clean:         0 kB
    Shared_Dirty:         0 kB
    Private_Clean:        0 kB
    Private_Dirty:     8328 kB

Now I assume this must be the place that is using up all the memory. What
type of memory is this? I assume this is memory from some malloc() call
and glibc uses mmap() to implement this. Correct?

If that is the case, then I assume that I did not call free(), since under
linux free() realy frees the memory. Correct?

cat /proc/29570/maps shows the following:

    00400000-00439000 r-xp 00000000 09:07 24494086                           /home/afd/bin/dir_check
    00538000-00539000 rw-p 00038000 09:07 24494086                           /home/afd/bin/dir_check
    00539000-005e7000 rw-p 00539000 00:00 0                                  [heap]
    3953c00000-3953c1a000 r-xp 00000000 09:00 2899267                        /lib64/ld-2.4.so
    3953d19000-3953d1a000 r--p 00019000 09:00 2899267                        /lib64/ld-2.4.so
    3953d1a000-3953d1b000 rw-p 0001a000 09:00 2899267                        /lib64/ld-2.4.so
    3953e00000-3953f3f000 r-xp 00000000 09:00 2899289                        /lib64/libc-2.4.so
    3953f3f000-395403e000 ---p 0013f000 09:00 2899289                        /lib64/libc-2.4.so
    395403e000-3954042000 r--p 0013e000 09:00 2899289                        /lib64/libc-2.4.so
    3954042000-3954043000 rw-p 00142000 09:00 2899289                        /lib64/libc-2.4.so
    3954043000-3954048000 rw-p 3954043000 00:00 0
    2b92d0e8f000-2b92d0e90000 rw-p 2b92d0e8f000 00:00 0
    2b92d0e90000-2b92d0e95000 rw-s 00000000 09:07 24478806                   /home/afd/fifodir/tmp_msg_buffer
    2b92d0e95000-2b92d0e96000 rw-s 00000000 09:07 24478787                   /home/afd/fifodir/afd.status
    2b92d0ea6000-2b92d0ea8000 rw-p 2b92d0ea6000 00:00 0
    2b92d0ea8000-2b92d0ef3000 rw-s 00000000 09:07 3883010                    /home/afd/fifodir/fra_status.627
    2b92d0ef3000-2b92d0f89000 rw-s 00000000 09:07 3883009                    /home/afd/fifodir/fsa_status.757
    2b92d0f89000-2b92d0ff9000 rw-s 00000000 09:07 24477698                   /home/afd/fifodir/amg_data
    2b92d0ff9000-2b92d1282000 rw-p 2b92d0ff9000 00:00 0
    2b92d1282000-2b92d1283000 rw-s 00000000 09:07 24478740                   /home/afd/fifodir/error_queue
    2b92d1283000-2b92e1d8e000 rw-p 2b92d1283000 00:00 0
    7fffd9c06000-7fffd9c1b000 rw-p 7fffd9c06000 00:00 0                      [stack]
    ffffffffff600000-ffffffffff601000 r-xp 00000000 00:00 0                  [vdso]

And cat /proc/29570/status shows this:

    Name:   dir_check
    State:  S (sleeping)
    SleepAVG:       90%
    Tgid:   29570
    Pid:    29570
    PPid:   28394
    TracerPid:      0
    Uid:    5521    5521    5521    5521
    Gid:    501     501     501     501
    FDSize: 64
    Groups: 501
    VmPeak:   281688 kB
    VmSize:   280896 kB
    VmLck:         0 kB
    VmHWM:     14492 kB
    VmRSS:     13700 kB
    VmData:   276776 kB
    VmStk:        84 kB
    VmExe:       228 kB
    VmLib:      1380 kB
    VmPTE:        60 kB
    Threads:        1
    SigQ:   0/81920
    SigPnd: 0000000000000000
    ShdPnd: 0000000000000000
    SigBlk: 0000000000000000
    SigIgn: 0000000000000001
    SigCgt: 0000000000000440
    CapInh: 0000000000000000
    CapPrm: 0000000000000000
    CapEff: 0000000000000000

Is there a way that I can find with the help of gdb the variable name that
had or still has this 270MB allocated?

Or is there some other way to find at which place in the code I am using
so much memory?

Thanks,
Holger

