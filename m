From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: About combined console/X11 programs (was: question about gcc and keyboard hadling)
Date: Wed, 7 Aug 2002 13:00:16 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <15697.3024.599591.170344@cerise.nosuchdomain.co.uk>
References: <02080504255200.24029@linux>
	<20020806180852.GX758@lug-owl.de>
	<15696.18623.378185.959744@cerise.nosuchdomain.co.uk>
	<02080622481000.01227@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <02080622481000.01227@localhost.localdomain>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: rmb@coopenet.com.ar
Cc: linux-c-programming@vger.kernel.org


+Rudymartin wrote:

> and I only asked how to trap the Meta/Ctrl/Shift keys under a terminal LOL
> 
> now I have another question: lets say I want to develop the text editor under 
> X (and I dont care about portability) which libraries should I use ? (what do 
> you recomend for a text editor?) and where I can find the APIs docs ?

There are many GUI toolkits available for X. I'm not going to get
involved in their relative merits, as such discussions often
degenerate into my-toolkit-is-better-than-your-toolkit flame wars.

> Theres a lots of text editors, but I would like to do a Brief emulation 

Note that there's already a Brief clone, called Crisp.

> thats why I need to use the meta and control keys.

GUI toolkits don't normally report events for pressing and releasing
modifier keys (Ctrl, Shift, Meta etc). Instead, the modifiers are
normally reported as flags with each key or button event.

-- 
Glynn Clements <glynn.clements@virgin.net>
