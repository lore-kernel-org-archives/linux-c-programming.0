From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: reading back characters from terminal
Date: Thu, 14 Aug 2003 23:49:53 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <16188.4625.257732.243634@cerise.nosuchdomain.co.uk>
References: <Pine.A41.4.20.0308141136360.38050-100000@delfin.unideb.hu>
	<Pine.A41.4.20.0308141753480.13862-100000@delfin.unideb.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <Pine.A41.4.20.0308141753480.13862-100000@delfin.unideb.hu>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Fekete Gabor <feketga@delfin.unideb.hu>
Cc: linux-c-programming@vger.kernel.org


Fekete Gabor wrote:

> > > > is there a way to read back characters from the terminal (e.g. xterm).
> > > 
> > > No. There isn't even any guarantee that the characters are actually
> > > stored anywhere. Certainly, hardcopy terminals don't store the text,
> > 
> one more question.
> 
> then why can I select text with the mouse both in xterm and on a text
> console and then paste it somewhere?

Because both of those terminals *do* store the text somewhere. 
Unfortunately, exactly where they store it, and in what format, is
specific to the particular terminal.

[Actually, that's only half true for xterm. xterm emulates both a DEC
VT-220 and a Tektronix 4104; you can only paste the text from the
VT-220, not the 4104.]

Theoretically, you could go digging around in the xterm process'
memory, via /proc/<pid>/mem (although, if xterm is running as root,
you'll need root privilege). Or in the framebuffer memory for the
Linux console (again, probably needs root privilege). But that won't
work for a remote login (telnet, ssh, minicom etc).

Similarly, you might be able to get the text from an xterm by OCR'ing
a screen dump, provided that your program can access the X display,
that it can figure out which xterm it is talking to, and that the
xterm itself isn't obscured. But that would be a lot of work, and
wouldn't be particularly reliable.

-- 
Glynn Clements <glynn.clements@virgin.net>
