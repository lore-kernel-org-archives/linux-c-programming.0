From: Elias Athanasopoulos <eathan@otenet.gr>
Subject: Re: getch()
Date: Thu, 7 Nov 2002 22:58:24 +0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20021107225824.E1136@neutrino.particles.org>
References: <200211071046.24987.abulfazl@juniv.edu> <200211072135.59164.abulfazl@juniv.edu> <20021107200436.C1136@neutrino.particles.org> <15818.41143.242454.812537@cerise.nosuchdomain.co.uk>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <15818.41143.242454.812537@cerise.nosuchdomain.co.uk>; from glynn.clements@virgin.net on Thu, Nov 07, 2002 at 05:19:51PM +0000
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Glynn Clements <glynn.clements@virgin.net>
Cc: Progga <abulfazl@juniv.edu>, linux-c-programming@vger.kernel.org

On Thu, Nov 07, 2002 at 05:19:51PM +0000, Glynn Clements wrote:
> fflush() is only applicable to output streams; using it on input
> streams seems to be a common programming "superstition".

Correct. I really can't tell why this was there. :-) (I can't also
tell why I didn't see the bogocity while copy-pasting it...)

> > [anteater@neutrino berserkers]$ grep _LEFT *.h
> > #define TOP_LEFT 51
> > #define BOT_LEFT 52
> > #define _LEFT 68
> 
> IOW, 'A', 'B', 'C', 'D'. I doubt that you were actually using those
> keys; more likely, assuming that the cursor keys generated particular
> sequences and ignoring most of the sequence.

Yes. IIRC, each arrow kay had a sequence of 3 codes. I was matching only
the first one, because otherwise (i.e. by matching each one of the 3 codes) 
the game was too slow. :-)

Elias
