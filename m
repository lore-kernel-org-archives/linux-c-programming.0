From: B S Srinidhi <srinidhi-c@deeproot.co.in>
Subject: amd64 :: SIGABRT in malloc()
Date: Thu, 16 Mar 2006 15:58:50 +0530
Message-ID: <1142504931.4517.26.camel@avirat>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

Hi,

I'm new to this list, but I've searched the archives (a little bit) to
find a solution to my problem and haven't found anything.

I've an application running on an amd64 machine. This app crashes while
allocating memory of size 300:

        suffix = malloc(sizeof(char) * 300);

When run under GDB, I get the following bt:

*** glibc detected *** malloc(): memory corruption: 0x00000000005343f0 ***

Program received signal SIGABRT, Aborted.
0x0000002a96214de0 in raise () from /lib/libc.so.6
(gdb) where
#0  0x0000002a96214de0 in raise () from /lib/libc.so.6
#1  0x0000002a96216290 in abort () from /lib/libc.so.6
#2  0x0000002a9624b06e in __fsetlocking () from /lib/libc.so.6
#3  0x0000002a962518fa in free () from /lib/libc.so.6
#4  0x0000002a96252d4b in malloc () from /lib/libc.so.6
<snipped>

Any ideas as to why this could be happening? How can I debug this
problem? And why is malloc() calling free()? 

Any help or pointers would be of great help.

Srinidhi.
-- 
ASCII ribbon campaign ( )         B S Srinidhi
 - against HTML email  X          http://srinidhi.deeproot.co.in
             & vCards / \         DeepRoot Linux

