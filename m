From: Stephen Satchell <list@fluent2.pyramid.net>
Subject: Re: printf(), aligning fields
Date: Sat, 23 Aug 2003 18:05:56 -0700
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <5.2.1.1.0.20030823180113.011bceb8@fluent2.pyramid.net>
References: <Pine.LNX.4.21.0308232217220.23476-100000@hestia>
 <Pine.LNX.4.44.0308222010400.17321-100000@praktifix.dwd.de>
 <Pine.LNX.4.21.0308232217220.23476-100000@hestia>
 <16200.462.367759.211524@cerise.nosuchdomain.co.uk>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <16200.462.367759.211524@cerise.nosuchdomain.co.uk>
References: <Pine.LNX.4.21.0308232217220.23476-100000@hestia>
 <Pine.LNX.4.44.0308222010400.17321-100000@praktifix.dwd.de>
 <Pine.LNX.4.21.0308232217220.23476-100000@hestia>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Glynn Clements <glynn.clements@virgin.net>, "J." <mailing-lists@xs4all.nl>
Cc: linux-c-programming@vger.kernel.org

At 01:07 AM 8/24/2003 +0100, Glynn Clements wrote:
> > I am trying to print collums from a c program, as the
> > following example illustrates:
> >
> >   Total  Number   Folder
> >   -----  ------   ------
> >   15502   17      cronlog
> >   189897  42      linux/debian-curiosa
> >   161751  32      linux/debian-firewall
> >    4305   1       linux/debian-general
> >   17431   1       linux/debian-news
> >   107517  1       linux/vger-kernel-announce
> >   61136   16      linux/vger-kernel-c-programming
> >    8580   2       linux/vger-kernel-gcc
> >
> > How can I can align the output to the max right field boundry without
> > overcrossing that field boundry if the field value gets longer?
> >
> > Do I really have to check the length of the value before printing it with,
> > %*s, and then determine how many spaces I need?
>
>You have to make the field large enough to hold all of the values. The
>*printf() family of functions don't provide any way to truncate a
>field to a maximum width.

No, but a program can truncate numbers to the left.

printf ("%7d%3d %1.64s\n", (total % 10000000), (number % 1000), folder);

Your other option is to do a conversion to string, and fill the string with 
an "overflow indicator" when the number to be displayed is too large.  The 
advantage of the second method is you can insert comma (or dot, for Europe) 
delimiters to make the numbers easier for humans to read.


--
X -> unknown; Spurt -> drip of water under pressure
Expert -> X-Spurt -> Unknown drip under pressure.

