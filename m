From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: How to set string font size in XMotif
Date: Fri, 20 Feb 2004 10:50:02 +0000
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <16437.58970.285794.853172@cerise.nosuchdomain.co.uk>
References: <5369F0C739D7BD40B04265D0CAA8FF72149219@ZENMAILHQ.ind.zensar.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <5369F0C739D7BD40B04265D0CAA8FF72149219@ZENMAILHQ.ind.zensar.com>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: romesh sahu <r.sahu@zensar.com>
Cc: linux-c-programming@vger.kernel.org


romesh sahu wrote:

> > I am facing a problem in XMotif on solaris...I am setting a string
> > as a title for the form widget ..I am not setting any font size or
> > other font setting...in one solaris server ,the title appears ok but
> > in other the end of title is getting left out...that is string
> > display length is more than the form widget width so end of title is
> > cut out.....i want to reduce the string display font size so that
> > the string display length will also reduce.....i tried changing the
> > font value in fallback string but its not having any effect ...

1. Motif widgets don't have a "font" resource; instead, they use
"fontList".

2. The fallback resources are only used if no site-wide app-defaults
file is found.

3. A resource setting might be overriden by a more specific setting
elsewhere.

-- 
Glynn Clements <glynn.clements@virgin.net>
