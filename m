From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: mktemp()
Date: Sat, 5 Jun 2004 20:42:16 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <16578.8728.916755.738458@cerise.nosuchdomain.co.uk>
References: <20040605093054.A613@Imrashi.net.bd>
	<16577.21054.198004.325948@cerise.nosuchdomain.co.uk>
	<20040605141705.A681@Imrashi.net.bd>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20040605141705.A681@Imrashi.net.bd>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Progga <abulfazl@juniv.edu>
Cc: linux-c-programming@vger.kernel.org


Progga wrote:

> > The risk is that, if you don't use O_EXCL, an attacker could create a
> > symlink between the point that mktemp() returns and the point that you
> > call open/fopen/etc, causing you to overwrite the target of the
> > symlink.
> 
>  Does the above mean that mktemp( "abcXXXXXX" ) can return "abc123456" even if
> there's a symlink with the name "abc123456" ?

No.

But an attacker could create a symlink with the name abc123456 between
the point that mktemp() returns and the point that you create the
file.

Or another process might coincidentally create a file named abc123456
between the point that mktemp() returns and the point that you try to
create your file.

This type of situation is known as a "race condition".

-- 
Glynn Clements <glynn.clements@virgin.net>
