From: Hareesh Nagarajan <hareesh.nagarajan@gmail.com>
Subject: Check if a process exists?
Date: Tue, 1 Mar 2005 02:17:04 -0600
Message-ID: <7728232c050301001710a2787@mail.gmail.com>
Reply-To: Hareesh Nagarajan <hareesh.nagarajan@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

Hi,

Can a process check if a given PID exists or not? In other words can a
process check if an unrelated process is alive? Is there any system
call that does this?

I can think of a (few) work arounds to this:

1. open("/proc/pid_in_question") will return true if the process with
pid = pid_in_question is alive.

2. lock a file called ``pid_in_question". Test the lock from the other
process.  If the process is dead then there is no lock on the file
``pid_in_question".

Any ideas/comments?

Thanks,

Hareesh
