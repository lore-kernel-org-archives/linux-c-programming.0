From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: getch()
Date: Fri, 8 Nov 2002 17:51:43 +0000
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <15819.63919.939202.386675@cerise.nosuchdomain.co.uk>
References: <200211071046.24987.abulfazl@juniv.edu>
	<200211072135.59164.abulfazl@juniv.edu>
	<20021107200436.C1136@neutrino.particles.org>
	<200211081504.01461.abulfazl@juniv.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <200211081504.01461.abulfazl@juniv.edu>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: abulfazl@juniv.edu
Cc: linux-c-programming@vger.kernel.org


Progga wrote:

>  If input is taken in non-blocking mode then something like:
> 
>   while( read( STDIN_FILENO, &ch, 1 ) != 1 ) ;
> 
>   needs to be used.

NO! This will result in a "busy wait", consuming all available CPU
time.

If you want to wait until a byte is actually available to be read,
either:

a) don't use non-blocking mode in the first place,
b) temporarily disable non-blocking mode, or
c) use select() to wait until input is available.

-- 
Glynn Clements <glynn.clements@virgin.net>
