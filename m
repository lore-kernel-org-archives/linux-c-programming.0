From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: Handling ioctl() argp memory
Date: Mon, 5 Mar 2007 06:26:50 +0000
Message-ID: <17899.47146.859201.87363@cerise.gclements.plus.com>
References: <20070304164844.GA7231@wintermute.farpoint>
	<17899.30813.80673.270405@cerise.gclements.plus.com>
	<20070305052355.GA13946@wintermute.farpoint>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20070305052355.GA13946@wintermute.farpoint>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: leslie.polzer@gmx.net
Cc: linux-c-programming@vger.kernel.org


leslie.polzer@gmx.net wrote:

> > You're probably overwriting the beginning of the allocated block.
> 
> What do you mean by that?  I can surely write to allocated memory, at
> the start, end and any point between...

Each block returned from malloc etc has a header; the pointer which
malloc() returns points to the first byte after the header. If you
corrupt the header, you will often get a segfault when you try to
free() the block.

> Besides, for the record: a short Valgrind run (thanks for the reminder!)
> showed me that I calculated the space wrongly, i.e. I allocated not
> enough memory.

If you write beyond the end of one block, you'll often end up
corrupting the header at the beginning of the block which follows it
in memory.

Not always, as there may be some unused space after the end of the
block; it's more likely to happen with simple programs where the
blocks are likely to be adjacent in memory.

-- 
Glynn Clements <glynn@gclements.plus.com>
