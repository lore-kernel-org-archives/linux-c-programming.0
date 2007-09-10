From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: Testing if a file or directory exist
Date: Mon, 10 Sep 2007 19:01:24 +0100
Message-ID: <18149.34420.844750.159700@cerise.gclements.plus.com>
References: <Pine.LNX.4.64.0709090907400.18317@diagnostix.dwd.de>
	<Pine.LNX.4.64.0709090605220.31293@localhost.localdomain>
	<Pine.LNX.4.64.0709101540300.17374@diagnostix.dwd.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.64.0709101540300.17374@diagnostix.dwd.de>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Holger Kiehl <Holger.Kiehl@dwd.de>
Cc: linux-c-programming@vger.kernel.org


Holger Kiehl wrote:

> >> What is the quickest way to test if a file or directory exist. I can
> >> think of three different system calls that can be used: access(),
> >> stat() and open(). Writting a little test program I found that this
> >> is also the order of which is the quickest, that is access() is the
> >> quickest and open() the slowest.
> >
> > if all you want to do is check for existence, then, execution time
> > notwithstanding, you should use the method which accomplishes that and
> > nothing more, so the obvious solution would be stat().
> 
> That is what I first thought as well. But I think the problem is that
> stat() needs to fill up the structure with all the data, is what takes
> most the time.

That isn't the case. All of the information returned by stat() is in
one place: the inode. stat() just copies various fields from the inode
into the "struct stat".

Most of the time taken would be in resolving the filename to an inode,
and in the system call overhead.

-- 
Glynn Clements <glynn@gclements.plus.com>
