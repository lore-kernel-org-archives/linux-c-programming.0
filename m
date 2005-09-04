From: Karol Banczyk <car-los@tlen.pl>
Subject: ophan child process to take standard input
Date: Sun, 04 Sep 2005 20:49:38 +0200
Message-ID: <dfffk2$fp8$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-c-programming@vger.kernel.org

Hello,
	I'm solving an exercise from my school. Not to go into details - the
task is to create a initiating process which in turn starts three new
processes  and then finishes its work. The three processes are to
communicate with pipes. There's no problem till this stage. But there's
the catch. The first of the three processes has to get its input from
the standard input and this works only as long as the parent
(initiating) process is alive. When the parent finishes the standard
input goes back to bash and the orphaned processes are adopted by the
init process having no access to stdin.

	What do you think? Is it a bug in the exercise or is there really a
(non-cosmic) way to achive the goal.


Thanx in advance

KB

