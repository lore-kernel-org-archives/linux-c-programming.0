From: Llfrg@aol.com
Subject: Re: Monitoring a program
Date: Mon, 01 Mar 2004 19:02:30 -0500
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <3878299D.71102FC3.0000FADF@aol.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

Yes John, what I am trying to do is quite like your description. Only that instead of a simple program like ls, the target program would be scientific applications that take several seconds/minutes/hours executing, so that I would like to collect statistics periodically (i.e. every 0.1 second) and store it on a log file for future use (in a way similar to the vmstat command). I believe such information is not available after the execution (if it is, even better!). I would like to know ways of doing it with minimal effect on the target application performance.

John wrote:

>
Let me see if I understand what you are trying to do.  Lets pretend the
target program is ls.
Whenever ls is run by any user you would like you daemon to store
statistical information about the execution of ls.

You might have to get this information from the kernels process table.
While executing the information you want is available in the procfs, however
when the process completes the information disappears.  It has been awhile
since I took my OS class, so I'm not sure if the information is still
available in the kernel's data structures or not.  I believe it would be
until another process with the same pid runs, but there is a good chance
that I'm wrong.

Depending on what you are trying to accomplish there may be better/easier
ways to accomplish your goal.

--
John
>

Thanks,
Leonardo

