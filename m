From: Luciano Miguel Ferreira Rocha <luciano@lsd.di.uminho.pt>
Subject: Re: gcc : cpp Memory Exhausted
Date: Wed, 24 Sep 2003 23:23:54 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20030924222354.GA29626@lsd.di.uminho.pt>
References: <20030922104825.81134.qmail@web20002.mail.yahoo.com> <003501c3811f$610395a0$ed64a8c0@descartes> <3F702813.8030200@gsecone.com> <003e01c381ec$c76473a0$ed64a8c0@descartes> <00fb01c382a9$3178a560$caba0ba4@uwe.ac.uk> <010701c382ae$5490ec10$caba0ba4@uwe.ac.uk>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <010701c382ae$5490ec10$caba0ba4@uwe.ac.uk>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matthew Studley <matthew.studley@uwe.ac.uk>
Cc: linux-c-programming@vger.kernel.org

On Wed, Sep 24, 2003 at 04:12:54PM +0100, Matthew Studley wrote:
> I have 'solved' the problem; I was just compiling one of the source files, I
> deleted all compiled output and recompiled all the source.  No problem!
> 
> This is bizarre!
> 
> I have no idea what was causing this though, and would really appreciate any
> ideas!

I don't know the exact reason, but I'l give some suggestions:

1. recursive #include, as when a.h #includes "b.h", and b.h #includes "a.h"
   or just a.h #includes "a.h"...

2. memory corruption. the compilation of all sources could had caused the
   corrupted cache to be discarded.

3. corruption of disk transfers
   (by means of an invalid selected DMA or ilegal cable)

Regards,
Luciano Rocha
