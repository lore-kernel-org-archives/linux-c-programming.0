From: Progga <abulfazl@juniv.edu>
Subject: Re: mktemp()
Date: Sat, 5 Jun 2004 14:17:05 +0600
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20040605141705.A681@Imrashi.net.bd>
References: <20040605093054.A613@Imrashi.net.bd> <16577.21054.198004.325948@cerise.nosuchdomain.co.uk>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <16577.21054.198004.325948@cerise.nosuchdomain.co.uk>; from glynn.clements@virgin.net on Sat, Jun 05, 2004 at 05:55:26AM +0100
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

On Sat, Jun 05, 2004 at 05:55:26AM +0100, Glynn Clements wrote:
> 
> The risk is that, if you don't use O_EXCL, an attacker could create a
> symlink between the point that mktemp() returns and the point that you
> call open/fopen/etc, causing you to overwrite the target of the
> symlink.

 Does the above mean that mktemp( "abcXXXXXX" ) can return "abc123456" even if
there's a symlink with the name "abc123456" ?



 Khoda Hafez
 Progga

