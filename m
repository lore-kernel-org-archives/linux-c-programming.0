From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: question about gcc and keyboard hadling
Date: Tue, 6 Aug 2002 17:22:57 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <15695.63457.98209.624871@cerise.nosuchdomain.co.uk>
References: <02080504255200.24029@linux>
	<15694.36614.996185.222692@cerise.nosuchdomain.co.uk>
	<20020806061907.GP758@lug-owl.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20020806061907.GP758@lug-owl.de>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Cc: linux-c-programming@vger.kernel.org


Jan-Benedict Glaw wrote:

> Even better question: I'd like to work on a text-based application and
> I'd like to act on simply pressing eg. Ctrl (change some context menu).
> I can do this with the hack I just posted nicely, but it will fail when
> running under X11. Is there any possibility in getting a callback
> registered called everytime an event occures which affects my terminal
> emulation's window?

No, there isn't.

An application which uses terminal I/O is inherently limited by the
set of actions for which the terminal actually generates input.

If you want behaviour that isn't provided by most terminals, then use
X instead. At least X is portable, unlike ioctl(KDSKBMODE) or
terminal-specific behaviours.

-- 
Glynn Clements <glynn.clements@virgin.net>
