From: "Joseph D. Wagner" <theman@josephdwagner.info>
Subject: More Pointer Woes
Date: Sun, 28 Dec 2003 19:45:30 +0600
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <200312281945.30750.theman@josephdwagner.info>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

I get:

find.c:341: error: request for member `blocksize' in something not a 
structure or union

on line 341:

block_order_log.total_blocks = inode.i_blocks / ((fs->blocksize) / 512);

fs is a pointer but blocksize isn't.

This one's probably staring me in the face but I can't figure it out.  I 
need a fresh pair of eyes.

TIA guys (and gals) for all your support.

Joseph D. Wagner

