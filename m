From: Jeff Woods <kazrak+kernel@cesmail.net>
Subject: Re: More Pointer Woes
Date: Sun, 28 Dec 2003 18:32:04 -0800
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <6.0.1.1.0.20031228182648.04161950@no.incoming.mail>
References: <200312281945.30750.theman@josephdwagner.info>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <200312281945.30750.theman@josephdwagner.info>
References: <200312281945.30750.theman@josephdwagner.info>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: "Joseph D. Wagner" <theman@josephdwagner.info>
Cc: linux-c-programming@vger.kernel.org

At 12/28/2003 07:45 PM +0600, Joseph D. Wagner wrote:
>find.c:341: error: request for member `blocksize' in something not a 
>structure or union
>
>on line 341:
>
>block_order_log.total_blocks = inode.i_blocks / ((fs->blocksize) / 512);
>
>fs is a pointer but blocksize isn't.

"fs->blocksize" refers to a field "blocksize" in a struct or union that the 
pointer "fs" indicates.  If  "fs" isn't a pointer to a struct (or union) 
then the "->" operator isn't valid.  What type is "fs"?

P.S.  Did you get this code from an email? Perhaps the ">" came from an 
email quote that didn't get cleaned up and "fs-blocksize" morphed into 
"fs->blocksize".  But this looks like a long-shot to me.  I expect that 
"fs" is supposed to be a pointer to a struct.

--
Jeff Woods <kazrak+kernel@cesmail.net> 


