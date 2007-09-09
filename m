From: "Robert P. J. Day" <rpjday@mindspring.com>
Subject: Re: Testing if a file or directory exist
Date: Sun, 9 Sep 2007 06:07:20 -0400 (EDT)
Message-ID: <Pine.LNX.4.64.0709090605220.31293@localhost.localdomain>
References: <Pine.LNX.4.64.0709090907400.18317@diagnostix.dwd.de>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.64.0709090907400.18317@diagnostix.dwd.de>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Holger Kiehl <Holger.Kiehl@dwd.de>
Cc: linux-c-programming@vger.kernel.org

On Sun, 9 Sep 2007, Holger Kiehl wrote:

> Hello
>
> What is the quickest way to test if a file or directory exist. I can
> think of three different system calls that can be used: access(),
> stat() and open(). Writting a little test program I found that this
> is also the order of which is the quickest, that is access() is the
> quickest and open() the slowest.

if all you want to do is check for existence, then, execution time
notwithstanding, you should use the method which accomplishes that and
nothing more, so the obvious solution would be stat().

it would be illogical to call open() since a side-effect would be that
you then had an open file.  in short, if you just want to test, then
just test.

rday
-- 
========================================================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

http://crashcourse.ca
========================================================================
