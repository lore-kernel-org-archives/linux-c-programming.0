From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: clear the screen
Date: Mon, 28 Feb 2005 06:36:39 +0000
Message-ID: <16930.48119.987267.500405@gargle.gargle.HOWL>
References: <1108969688.5088.12.camel@localhost.localdomain>
	<16923.52084.408249.817998@gargle.gargle.HOWL>
	<20050223185457.A550@Imrashi.net.bd>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <20050223185457.A550@Imrashi.net.bd>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Progga <abulfazl@juniv.edu>
Cc: linux-c-programming@vger.kernel.org


Progga wrote:

> > See the manpage for setupterm() and tigetstr() for more information.
> 
>  Should it be like this ? 
> 
> 
> <code>
>     char *area[100], bp[2048] ;
> 
>     tgetent( bp, getenv( "TERM" )) ;
>     puts( tgetstr( "cl", area )) ;
> </code>

First, that's the old termcap interface; new programs should use the
terminfo interface.

Second, the use of the "area" variable is wrong. It should be
something like:

	char buf[100];
	char *area = buf;
	
	puts(tgetstr("cl", &area));

Repeated calls to tgetstr() will advance the "area" pointer, so that
"buf" will contain, in order, all of the strings retrieved by
tgetstr().

-- 
Glynn Clements <glynn@gclements.plus.com>
