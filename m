From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: Remounting File Systems
Date: Fri, 21 Nov 2003 04:48:21 +0000
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <16317.39189.496548.293593@cerise.nosuchdomain.co.uk>
References: <200311202241.41262.theman@josephdwagner.info>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <200311202241.41262.theman@josephdwagner.info>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Joseph D. Wagner" <theman@josephdwagner.info>
Cc: linux-c-programming@vger.kernel.org


Joseph D. Wagner wrote:

> I'm writing a program that has to remount a file system on the fly for the 
> purpose of changing the mount flags.
> 
> Is there any system function that can tell me what the mount flags are for a 
> currently mounted file system?

setmntent/getmntent/endmntent, possibly in conjunction with hasmntopt.

-- 
Glynn Clements <glynn.clements@virgin.net>
