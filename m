From: "Joseph D. Wagner" <theman@josephdwagner.info>
Subject: Re: Remounting File Systems
Date: Fri, 21 Nov 2003 00:03:16 +0600
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <200311210003.16602.theman@josephdwagner.info>
References: <200311202241.41262.theman@josephdwagner.info> <16317.39189.496548.293593@cerise.nosuchdomain.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <16317.39189.496548.293593@cerise.nosuchdomain.co.uk>
Content-Disposition: inline
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Glynn Clements <glynn.clements@virgin.net>
Cc: linux-c-programming@vger.kernel.org

> > I'm writing a program that has to remount a file system on the fly for
> > the purpose of changing the mount flags.
> >
> > Is there any system function that can tell me what the mount flags are
> > for a currently mounted file system?
>
> setmntent/getmntent/endmntent, possibly in conjunction with hasmntopt.

Nice try, but there's still the unlikely chance that /etc/fstab or /etc/mtab 
have not been updated to reflect the CURRENTLY MOUNTED file system.

Joseph D. Wagner

