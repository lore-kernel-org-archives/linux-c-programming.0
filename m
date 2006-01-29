From: Shriramana Sharma <samjnaa@gmail.com>
Subject: Does GCC link only used functions?
Date: Sun, 29 Jan 2006 14:38:17 +0530
Message-ID: <200601291438.17093.samjnaa@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linux C Programming List <linux-c-programming@vger.kernel.org>

Hello list. I am relative newbie to GCC.

I have a C program which #includes a header file which in turn #includes many 
other header files. These header files are part of an open source library set 
I got from the net.

Now I do not use all the functions in the various libraries, but the makefile 
which came with the library of course has compile instructions for all the 
libraries. I have modified the makefile to compile my program using those 
libraries, but I did not remove the references to the libraries I knew I did 
not use, for I feared that some error may be caused.

But later I experimented removing some of the superfluous ones from the 
makefile and again "make"-d, and I got the same size executable as before.

So does this mean that GCC links only those functions from a library which I 
call directly or indirectly through another called function in the course of 
my program?

-- 

Penguin #395953 resides at http://samvit.org 
subsisting on SUSE Linux 10.0 with KDE 3.5
