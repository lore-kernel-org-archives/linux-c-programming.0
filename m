From: Progga <abulfazl@juniv.edu>
Subject: Re: mktemp()
Date: Sun, 6 Jun 2004 04:43:35 +0600
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20040606044335.C1576@Imrashi.net.bd>
References: <20040605093054.A613@Imrashi.net.bd> <16577.21054.198004.325948@cerise.nosuchdomain.co.uk> <20040605141705.A681@Imrashi.net.bd> <16578.8728.916755.738458@cerise.nosuchdomain.co.uk>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <16578.8728.916755.738458@cerise.nosuchdomain.co.uk>; from glynn.clements@virgin.net on Sat, Jun 05, 2004 at 08:42:16PM +0100
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Glynn Clements <glynn.clements@virgin.net>
Cc: linux-c-programming@vger.kernel.org

On Sat, Jun 05, 2004 at 08:42:16PM +0100, Glynn Clements wrote:
> 
> Or another process might coincidentally create a file named abc123456
> between the point that mktemp() returns and the point that you try to
> create your file.

 This sounds serious!  I am using this in a server and this can happen 
of course.  A special Thanks for pointing this special case.   Maybe mkstemp()
is the only solution since open() can't be used here ;-(



> This type of situation is known as a "race condition".

 The manpage mentioned this race condition and I didn't understood even after
going through the OS course ;-(   Need to study hard.



 Khoda Hafez
 Progga

