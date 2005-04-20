From: kaushal <kaushal@rocsys.com>
Subject: readline tab binding
Date: Wed, 20 Apr 2005 12:47:39 +0530
Message-ID: <1113981459.5041.39.camel@localhost.localdomain>
Reply-To: kaushal@rocsys.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c <linux-c-programming@vger.kernel.org>

Hello all,
	Iam new to the readline function.I used it to bind the tab key to my
function.The function works fine .What I intend is:

When tab key is pressed ,My function should print "hello" in the next
line and in the subsequent line the prompt should showoff along with the
partial command and should read from thereon.

Iam getting the intended action and the display in xterm.But when I
run this in the minicom,I find that after printing "hello",in the next
line the prompt and the incomplete command are not being printed but
actually the prompt along with the incomplete command is listening for
sure.Something like the below:


PROMPT:ls<TAB>
HELLO
<CURSOR BLINKS HERE BUT NO (PROMPT+COMMAND) DISPLAYED BUT READY TO TAKE
INPUT.>

intended:

PROMPT:ls<TAB>
HELLO
PROMPT:ls<CURSOR BLINKS HERE READY TO TAKE INPUT>


The problem occurs when I run this via minicom and its all fine in
xterm.

The machine connected via minicom runs linux and is of same
architecture.Iam using readline version 4.0

I tried out giving flushes at various places but it is not turning up.My
box runs fedora core-1.

Any response would be greatly useful.
Thanking in advance.

-kaushal.

