From: Hossein Mobahi <hmobahi@yahoo.com>
Subject: Problem with read() and named pipe (FIFO)
Date: Mon, 16 Aug 2004 07:47:52 -0700 (PDT)
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20040816144752.43149.qmail@web12701.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

Hello

There is an executable file, say PRG1, that measures
some quantities by sensors and writes the output to
stdout. I want to grab this output by my own program
PRG2, do some process on it and dump the result on the
screen. Since the whole system is real time, prg1 and
prg2 must run in parallel. The simplest answer could
be "prg1 | prg2", but for some reasons I have to use a
named pipe (FIFO), like "./prg1 > /tmp/mypipe &" and
"./prg2", where mypipe is a named pipe and prg2 reads
it by open() and read().

The problem is that prg1 does not produce any return
(I mean '\n'), and numbers are separated by space.
Therefore, read(fd,n,buf) blocks even if "n" is
smaller than what prg1 has actually written to the
pipe (no matter what n is, even if the pipe's buffer
contains more characters than n, read first waits for
return and onces gets it, it will copy n bytes of the
buffer to buf). On the other hand opening in
non-blocking fashion doesn't help, because I want my
program to wait for the output of prg1. Is there any
way to make read() return once the pipe has more
characters than n? What about defining another
delimiter such as "blank", instead of "return"? Let me
add that I do not want to touch kernel sources, I am
looking for a more portable solution using available
system calls or shell's capabilities.

Thnx

--Hossein



		
__________________________________
Do you Yahoo!?
New and Improved Yahoo! Mail - Send 10MB messages!
http://promotions.yahoo.com/new_mail 
