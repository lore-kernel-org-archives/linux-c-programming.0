From: "Joseph D. Wagner" <theman@josephdwagner.info>
Subject: Re: More Pointer Woes
Date: Sun, 28 Dec 2003 22:06:00 +0600
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <200312282206.00330.theman@josephdwagner.info>
References: <200312281945.30750.theman@josephdwagner.info> <6.0.1.1.0.20031228182648.04161950@no.incoming.mail>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <6.0.1.1.0.20031228182648.04161950@no.incoming.mail>
Content-Disposition: inline
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jeff Woods <kazrak+kernel@cesmail.net>
Cc: linux-c-programming@vger.kernel.org

> "fs->blocksize" refers to a field "blocksize" in a struct or union that
> the pointer "fs" indicates.  If  "fs" isn't a pointer to a struct (or
> union) then the "->" operator isn't valid.  What type is "fs"?

ext2_filsys *fs which can be found in ext2fs.h

> P.S.  Did you get this code from an email? Perhaps the ">" came from an
> email quote that didn't get cleaned up and "fs-blocksize" morphed into
> "fs->blocksize".  But this looks like a long-shot to me.  I expect that
> "fs" is supposed to be a pointer to a struct.

No, I wrote it myself.  I've tried:

fs.blocksize
fs->blocksize
*(fs).blocksize (which should be the same thing)
*(fs->blocksize)
*fs->blocksize
*(fs.blocksize)
&(fs->blocksize)

To simplify it:

int blocksize_k = fs->blocksize;

also fails.  blocksize is of type int.

Joseph D. Wagner

