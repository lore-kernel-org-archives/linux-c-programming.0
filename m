From: Shriramana Sharma <samjnaa@gmail.com>
Subject: Making "make" auto-strip and auto-clean
Date: Sun, 26 Feb 2006 09:35:27 +0530
Message-ID: <200602260935.27292.samjnaa@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linux C Programming List <linux-c-programming@vger.kernel.org>

I would like make to always 

1. strip the executable it created
2. remove the *.o files it created

after it has compiled the target executable. How do I do this? What do I add 
to the makefile? The current default command I am using is: 

pan: pan.o libswe.a
	gcc -g -O2 -o pan pan.o -L. -lswe -lm

Thanks.

-- 

Tux #395953 resides at http://samvit.org
playing with KDE 3.51 on SUSE Linux 10.0
$ date [] CCE +2006-02-26 W08-7 UTC+0530
