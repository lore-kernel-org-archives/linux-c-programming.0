From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: Remounting File Systems
Date: Fri, 21 Nov 2003 07:59:30 +0000
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <16317.50658.862596.190525@cerise.nosuchdomain.co.uk>
References: <200311202241.41262.theman@josephdwagner.info>
	<16317.39189.496548.293593@cerise.nosuchdomain.co.uk>
	<200311210003.16602.theman@josephdwagner.info>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <200311210003.16602.theman@josephdwagner.info>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Joseph D. Wagner" <theman@josephdwagner.info>
Cc: linux-c-programming@vger.kernel.org


Joseph D. Wagner wrote:

> > > I'm writing a program that has to remount a file system on the fly for
> > > the purpose of changing the mount flags.
> > >
> > > Is there any system function that can tell me what the mount flags are
> > > for a currently mounted file system?
> >
> > setmntent/getmntent/endmntent, possibly in conjunction with hasmntopt.
> 
> Nice try, but there's still the unlikely chance that /etc/fstab or /etc/mtab 
> have not been updated to reflect the CURRENTLY MOUNTED file system.

In which case, I think that you're stuffed; /proc/mounts doesn't list
the mount flags (apart from ro/rw), [f]statfs() doesn't provide this
information, and I can't see any plausible-looking ioctl()s.

-- 
Glynn Clements <glynn.clements@virgin.net>
