From: Eric <eric@cisu.net>
Subject: PID's of processes and waiting.
Date: Tue, 22 Jun 2004 20:50:48 -0500
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <200406222050.48748.eric@cisu.net>
Reply-To: eric@cisu.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

Hello,

	I am looking for a way to wait for a process to terminate. I have a process 
that was executed via system() and am getting its PID from a file it writes 
itself. I have a few questions.

	1. Is it possible to directly get the PID of a processes executed via 
system()? I do not believe so that is why I am falling back to reading its 
file.

	2. I have tried to waitpid() on the process by giving waitpid the PID read 
from the file as an argument, however it seems to return immidietly because I 
assume the new process is not a child of the calling process. Is it in fact a 
child of the calling process or am I abusing the systemcall? I assume a child 
is created only via fork()/exec() varients and this is the reason waitpid() 
is not working.

	3. Is waiting to see when the /proc/PID directory disappears a reliable 
solution? Does this directory die on exit() and is handled by the kernel, or 
is this unreliable for one reason or another?

	I am aware that a race/deadlock may occur if a new process takes the PID of 
the old process I am waiting for in between the time I poll the directory, 
however, I am at a complete loss on how to wait on this process. I need a 
reliable indicator that the process has stopped wether gracefully or dying a 
horrible death. Currently I am polling its PID file...but that is VERY 
unreliable because it is not cleaned up on a SIGKILL.

Does anyone have any ideas?

Thanks in advance,
	Eric
