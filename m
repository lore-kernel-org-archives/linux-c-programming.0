From: "John T. Williams" <jowillia@vt.edu>
Subject: viewing machine code
Date: Wed, 10 Dec 2003 16:30:31 -0500
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <000d01c3bf64$d94e0670$ed64a8c0@descartes>
Reply-To: "John T. Williams" <jtwilliams@vt.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

is there anyway to get gdb to display the hex code being exicuted?

ie prentend that 0xF8 is the command for add, and I am exicuting the code

addl 04,
is there a way to get gdb to type
0xF804 when exicuting that command.  sort of a step through the program at
the machine code level?


