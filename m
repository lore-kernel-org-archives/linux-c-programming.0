From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: Monitoring a program
Date: Mon, 1 Mar 2004 22:34:47 +0000
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <16451.47751.77618.909644@cerise.nosuchdomain.co.uk>
References: <4FEDBC17.643129B5.0000FADF@aol.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <4FEDBC17.643129B5.0000FADF@aol.com>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Llfrg@aol.com
Cc: linux-c-programming@vger.kernel.org


Llfrg@aol.com wrote:

> I would like to monitor a program execution. I intend to have a
> program (or daemon) that, whenever the target program (whose name is
> to be passed as a paramenter) starts (i.e when ps -C progname returns
> any process), gets statistics like cpu usage and store them on a file,
> finishing when the target program finishes. What would be an efficient
> way to do that?

Suitable mechanisms include:

1. Modifying the target program to log its own statistics.

2. Modifying some other user-space component, (e.g. the loader or
libc) to recognise when the target program is being run and call your
monitoring code.

3. Modifying the kernel, e.g. extending the existing process
accounting mechanism to record additional information. Or at least
forcing the information to remain around long enough to be recorded.

Unsuitable mechanisms include continuously polling the process list in
the hope that you can catch a process running the target program and
attach to it with ptrace() before it terminates.

-- 
Glynn Clements <glynn.clements@virgin.net>
