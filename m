From: Micha Feigin <michf@post.tau.ac.il>
Subject: Re: Newbie question on malloc()
Date: Thu, 3 Jun 2004 04:34:27 +0300
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20040603013427.GD2562@luna.mooo.com>
References: <002d01c44897$78ae58d0$de01a8c0@qnessmphibiki> <1086196092.29970.2.camel@localhost> <16574.4399.288522.256729@cerise.nosuchdomain.co.uk> <20040602183734.GU20632@lug-owl.de>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20040602183734.GU20632@lug-owl.de>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming <linux-c-programming@vger.kernel.org>

On Wed, Jun 02, 2004 at 08:37:34PM +0200, Jan-Benedict Glaw wrote:
> On Wed, 2004-06-02 18:41:03 +0100, Glynn Clements <glynn.clements@virgin.net>
> wrote in message <16574.4399.288522.256729@cerise.nosuchdomain.co.uk>:
> > John T. Williams wrote:
> > > As I understand it, that is entirely up to the operation system.  Linux
> > > and NT Kernel systems do reclaim unfreed memory, however I believe one
> > > the major problems with Win98 was that it did not.
> > > 
> > > Anyone with more information feel free to correct me
> > 
> > I very much doubt that the above is accurate.
> > 
> > It may be that Win98 had some specific memory leaks, but any OS which,
> > in the general case, failed to recover a process' memory upon
> > termination would run out of memory very quickly.
> 
> Well, that all depends on the definition of "OS". Any recent 32+ bit
> operating system with virtual memory capabilities and multi-processing
> will reclaim malloc()ed RAM upon process termination.

It has nothing to do with virtual memory. In any multi-processing OS
(any modern one probably) memory allocations are done by the kernel
since the kernel is the one managing the system's memory.

If the kernel doesn't have a bug, this memory is released on process
exit (unless it is still used by another process such as with fork with
virtual memory where it is marked copy on write).

> 
> However, there are some minor operating systems (as I said, depends on
> definition) out there under which processes *need* to free() their
> memory. But if we talk about Linux, *BSD (right, and even Windows
> systems starting from Win 3.1) will reclaim memory:)
> 
> However, if your program is designed so that you can easily track all
> allocations, it doesn't harm if you free everything before exit...
> 
> MfG, JBG
> 
> -- 
>    Jan-Benedict Glaw       jbglaw@lug-owl.de    . +49-172-7608481
>    "Eine Freie Meinung in  einem Freien Kopf    | Gegen Zensur | Gegen Krieg
>     fuer einen Freien Staat voll Freier B?rger" | im Internet! |   im Irak!
>    ret = do_actions((curr | FREE_SPEECH) & ~(NEW_COPYRIGHT_LAW | DRM | TCPA));


