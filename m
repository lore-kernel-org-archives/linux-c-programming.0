From: <postmaster@yuristudio.net>
Subject: Issue with fcntl FD_CLOEXEC and execve
Date: Fri, 19 Jun 2020 22:40:10 +0200
Message-ID: <000801d64679$d347bf10$79d73d30$@yuristudio.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Language: en-us
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

[ Please keep me in CC as I'm not subscribed to the mailing list ]

Hello,

Sorry for using this weird email address, but my personal email is
apparently blocked ("your address is not liked source for email").
I recently experimented with fork/exeve and wanted to make an error
reporting from worker process back to master process. To create  the link I
used pipe syscall.
The pipe works fine and the process can correctly transmit data back to the
master. The only issue appears when trying to run input pump based
applications like cat, grep, etc. When running these applications the pipe
write end which is marked FC_CLOEXEC should be closed when execve is
triggered, however it is not, but execve still succeeded.
When the target process to execve is not an input pump (uname, ls, .) no
issue occurs and the pipe is correctly closed when execve is triggered and
succeeds.

That is a problem as my master process expects the blocking read to return
with either cause of pipe file descriptor closed or some data written. In
this case when the target process is an input pump the master process never
gets notified of file descriptor closed and by extension locks forever.

Thank you,
Yuri Edward

