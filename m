From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: how to the filename
Date: Thu, 14 Apr 2005 22:10:15 +0100
Message-ID: <16990.56375.187052.48678@gargle.gargle.HOWL>
References: <1113472539.5952.62.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <1113472539.5952.62.camel@localhost.localdomain>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: kaushal@rocsys.com
Cc: linux prg <linux-c-programming@vger.kernel.org>


kaushal wrote:

> 	How can I get the filename/pathname given the open file descriptor?Does
> fstat provide this feature internally?Can somebody give the code snippet
> for this.

If a descriptor corresponds to a file, the kernel records the name
under which the file was opened; the name is available via
the link /proc/<pid>/fd/<descriptor#>. If the file is renamed, the
link will be updated; if the file is deleted, " (deleted)" will be
added to the link.

Note that this is Linux-specific; it won't work on other Unices. Also,
it won't work if the /proc filesystem doesn't exist.

The historical behaviour is that any system calls which accept a
filename as an argument (e.g. open(), stat() etc) immediately resolve
the filename to a device/inode pair, then forget all about the
filename.

The only portable solution is to retrieve the device and inode numbers
via fstat(), locate the mount point for the device, then scan the
entire filesystem beneath the mount point until you find a file with
the correct inode number. If you don't find such a file, it has been
deleted since it was opened (programs which create temporary files
often delete them as soon as they are opened so they don't get left
around if the process terminates abnormally).

[A deleted file will exist so long as it remains open, it just won't
have a filename, so you can't use open(), stat() etc on it.]

-- 
Glynn Clements <glynn@gclements.plus.com>
