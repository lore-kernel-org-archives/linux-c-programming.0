From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: About combined console/X11 programs
Date: Wed, 7 Aug 2002 23:32:49 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <15697.40977.907586.868080@cerise.nosuchdomain.co.uk>
References: <02080504255200.24029@linux>
	<20020806180852.GX758@lug-owl.de>
	<15696.18623.378185.959744@cerise.nosuchdomain.co.uk>
	<02080622481000.01227@localhost.localdomain>
	<15697.3024.599591.170344@cerise.nosuchdomain.co.uk>
	<20020807133002.GZ758@lug-owl.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20020807133002.GZ758@lug-owl.de>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Cc: linux-c-programming@vger.kernel.org


Jan-Benedict Glaw wrote:

> > > thats why I need to use the meta and control keys.
> > 
> > GUI toolkits don't normally report events for pressing and releasing
> > modifier keys (Ctrl, Shift, Meta etc). Instead, the modifiers are
> > normally reported as flags with each key or button event.
> 
> I won't go into those my-one-is-bigger-than-... wars, but using GTK+, I
> can easily fetch single keypresses/keyreleases. Look at this snipplet:

[snip]

But you don't necessarily want to process raw key press/release
events, even if you can.

E.g. for text input, you normally want to process whole characters,
which might require multiple key presses (e.g. using dead keys or
compose sequences).

Similarly, if you are binding commands to Ctrl-<key> and/or Meta-<key>
chords, you don't normally care about events corresponding to the Ctrl
or Meta key being pressed. Instead, you handle the event for the
non-modifier key according to which modifiers are active at the time.

Most of the time, you want to let the toolkit handle the actual event
dispatch. E.g. <key> and Shift-<key> typically go to the widget which
has the input focus, while Meta-<key> goes to the menu bar; Ctrl-<key>
might be a command shortcut which is handled at the top level, or
(e.g. in the case of a text widget) it might be handled by the widget
with the input focus.

-- 
Glynn Clements <glynn.clements@virgin.net>
