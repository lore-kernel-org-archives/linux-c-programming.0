From: "Charlie Gordon" <gmane@chqrlie.org>
Subject: Re: How to allocate few bytes to a file automatically after creating it?
Date: Thu, 13 May 2004 09:53:27 +0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <c7v9ep$fcp$1@sea.gmane.org>
References: <20040513015353.37BCC1E453@xprdmailfe25.nwk.excite.com>
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

> My aim is to allocate few bytes to a file; with some valid data in it as
soon as it is created. Will the following approach work?
>
> Calling the function ext2_direct_IO() with the appropriate parameters
after creating a new inode. The appro. parameters are rw flag, inode, iobuf,
blocknr, blocksize.
> If I want to add just 100 bytes to the file, I guess blocknr should be 1
and blocksize should be 512 or 1024 .. is that right? Also, how to fill in
"iobuf" which is of the type "struct kiobuf *" to add these 100 bytes?
>

Are you doing this from a driver ?
Fiddling with file system specific stuff seems overkill for your purpose.
If your goal is to make sure the file is non empty, with correct contents,
as soon as it appears in the file system, the classical method is to create
a new file with a temporary name with open(), write appropriate contents to
it with write(), close it, and then rename it to the correct name with
rename(), an atomic change to most file systems.  The only constraint is
that the file be created in the same file system.

If this doesn't solve your problem, what did I miss ?

Chqrlie.



