From: kaushal <kaushal@rocsys.com>
Subject: clear the screen
Date: Mon, 21 Feb 2005 12:38:09 +0530
Message-ID: <1108969688.5088.12.camel@localhost.localdomain>
Reply-To: kaushal@rocsys.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c <linux-c-programming@vger.kernel.org>

hello all,
	Sorry for a very basic question.I would like to know how to clear the
screen from within a c program without using system("clear") or any of
the ncurses functions.Can we do this using printf?My program is in raw
mode so is there any feature available by which I can use the termios
structure for clearing the screen if it is not possible with printf.Long
ago when I used work in the dos platform I used conio.h and clrscr()
rourine.I guess I have to write that clrscr() routine's code itself.Im
working on a linux machine now.

Thanks in advance.
-kaushal.

