From: Fekete Gabor <feketga@delfin.unideb.hu>
Subject: reading back characters from terminal
Date: Wed, 13 Aug 2003 20:52:01 +0200 (DFT)
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <Pine.A41.4.20.0308132043580.88086-100000@delfin.unideb.hu>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

hi,

is there a way to read back characters from the terminal (e.g. xterm).
i mean for example running xterm with bash and writing a program that
when run from the bash prompt could read an arbitrary text back from
the xterm window.
e.g.:

$ ls -al
total 16
drwxr-xr-x    4 x        users        4096 Jun 20 00:39 ./
drwxr-xr-x   21 x        users        4096 Aug 13 21:33 ../
drwxr-xr-x    2 x        users        4096 Jun 22 20:45 colors/
drwxr-xr-x    2 x        users        4096 Jun 14 20:06 plugin/
$ program
and then the "program" would read back the contents of the terminal, like
ten characters starting from the position row 5, line 7.

WITHOUT NCURSES!

anyone?


