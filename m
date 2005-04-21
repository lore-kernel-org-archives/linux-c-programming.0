From: kaushal <kaushal@rocsys.com>
Subject: readline-bash-busybox vt102 autowrap not working
Date: Thu, 21 Apr 2005 21:04:05 +0530
Message-ID: <1114097645.16586.1.camel@localhost.localdomain>
Reply-To: kaushal@rocsys.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c <linux-c-programming@vger.kernel.org>

Hello all,
           Iam trying to write a custom shell that runs on a board and
has serial interface via minicom,vt102 terminal.The board has busybox
running on it.When I download my application that uses readline on to it
the readline is not scrolling to the next line when it reaches to the
rightmost column.Line wrap on is not a solution for this as even this is
not providing the same(Just mentioning it).What I observe is:

when I download bash-3.0 into the board and run it,even it is unable to
do this autowrapping.

when I use only the boards' busybox,default it is working fine.

when Iam using libedit(Similar to readline) it is working fine on the
board and provides me autowrap.

But The /usr/share/terminfo/v/* are very much present.I tried to dowload
and run it on the box but in vain.

To repeate the problem:bash is not providing the autowrap feature when
it is being interfaced via serial vt102 terminal.The board is P3 board.

I tried out /etc/inpurc:set horizontal-scrolling-mode on-----X
downloaded the /etc/bashrc and then run bash---X


echo $TERM prints vt102 in the board but printf("%s\n",rl_terminal_name)
is printing 
null.

What could be problem and what all can I try to solve this?

Any suggestions would be greately helpful.

thanks in advance.

regards-
kaushal.

