From: Dan Gary <funkychunkymunky@gmail.com>
Subject: File I/O wrapper?
Date: Mon, 24 Jan 2005 11:55:14 -0800
Message-ID: <1450f66c05012411557e328fa1@mail.gmail.com>
Reply-To: Dan Gary <funkychunkymunky@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

I'm working on a new logging system and came across the idea of using
a program through a symbolic link instead of a file for a log.

Basically I would write a program that logs to a variety of
configurable sources, and would act as a file when it comes to I/O,
doing whatever processing I want in between the "actual" file and the
calling program.

My only hang up so far is actually getting the program to emulate file
I/O without writing to the program file itself.


So in simple terms, I want a program to act like a file, and I'm stuck on How.

A FIFO isn't quite what I need, but close, although I need a single
point of reference to handle all I/O, exactly like a file.

And I can't/don't want to rewrite every potential calling program to
work with this.

I've been thinking I'm going to have to do a kernel module, but I was
hoping someone might know a way I can implement this w/o doing a kmod.

I've always been a higher level programmer, interfaces, DB
access/filtering, etc, so anything as low as throwing a hook into file
I/O is a little beyond my existing knowledge level, but I'm willing to
give it a shot.

Any help would be greatly appreciated.
