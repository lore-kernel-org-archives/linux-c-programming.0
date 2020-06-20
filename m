From: Florian Weimer <fw@deneb.enyo.de>
Subject: Re: Issue with fcntl FD_CLOEXEC and execve
Date: Sat, 20 Jun 2020 08:53:42 +0200
Message-ID: <87mu4yp6rt.fsf@mid.deneb.enyo.de>
References: <000801d64679$d347bf10$79d73d30$@yuristudio.net>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <000801d64679$d347bf10$79d73d30$@yuristudio.net> (postmaster's
        message of "Fri, 19 Jun 2020 22:40:10 +0200")
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: postmaster@yuristudio.net
Cc: linux-c-programming@vger.kernel.org

* postmaster:

> The pipe works fine and the process can correctly transmit data back to the
> master. The only issue appears when trying to run input pump based
> applications like cat, grep, etc. When running these applications the pipe
> write end which is marked FC_CLOEXEC should be closed when execve is
> triggered, however it is not, but execve still succeeded.
> When the target process to execve is not an input pump (uname, ls, .) no
> issue occurs and the pipe is correctly closed when execve is triggered and
> succeeds.
>
> That is a problem as my master process expects the blocking read to return
> with either cause of pipe file descriptor closed or some data written. In
> this case when the target process is an input pump the master process never
> gets notified of file descriptor closed and by extension locks forever.

Do you have a minimal but complete example that shows the problem?

You cannot really make standard input a CLOEXEC descriptor.  If you do
not want subprocesses to use the original standard input, you need to
replace the descriptor with /dev/null before the execve call (but
already in the subprocess).
