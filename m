From: David Eduardo =?ISO-8859-1?Q?G=F3mez?= Noguera 
	<davidgn@servidor.unam.mx>
Subject: stracing pwd
Date: Sat, 19 Jun 2004 10:29:40 -0500
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <1087658980.8158.13.camel@mokona>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linux C Programming <linux-c-programming@vger.kernel.org>

Hellow. This just striked me.
I wondered how pwd works, I entered a linked directory, and pwd gives me
the link.
when I tried pwd -h (wrong argument) I saw there are two possible
arguments
I have 
/usr/src/linux-2.6.7
/usr/src/linux -> /usr/src/linux-2.6.7

under /usr/src/linux, 
pwd prints /usr/src/linux
pwd -L too
pwd -P prints /usr/src/linux-2.6.7
but an strace always shows the same
write(1, "/usr/src/linux-2.6.7\n", 21/usr/src/linux-2.6.7
)  = 21
and it prints /usr/src/linux-2.6.7 to stdout no matter the parameter
given to pwd.

Anyone knows why that could happen? 
( I haven't seen to the pwd code yet though)

