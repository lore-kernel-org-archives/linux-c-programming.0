From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: Curses and key-up information
Date: Mon, 6 Jan 2003 16:00:39 +0000
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <15897.43047.454804.466506@cerise.nosuchdomain.co.uk>
References: <4DB84F6A7711D511A5020002A550C8B778710B@BELL>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <4DB84F6A7711D511A5020002A550C8B778710B@BELL>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Steve Goodwin <SteveG@bitscorp.com>
Cc: linux-c-programming@vger.kernel.org


Steve Goodwin wrote:

> I'm writing to write a little curses maze game that involves a lot of key
> handling, and the most obvious way to handle the control is with a
> IsKeyDown(char key) type-function. Alas, curses doesn't appear to have one
> and was wondering is anyone else has found a way around this problem (either
> within curses, or using ioctl/poll or similar).

It can't be done. The process only receives notification of key
presses; there is no way to discover when a key is released.

Bear in mind that Unix terminal I/O was designed for terminals (vt100
etc) rather than a keyboard which is attached directly. Terminals
(whether hardware terminals such as the vt100, emulators such as
xterm, the linux console, telnet etc) simply don't send anything when
a key is released, so there's no way to detect it.

-- 
Glynn Clements <glynn.clements@virgin.net>
