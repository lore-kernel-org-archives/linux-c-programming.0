From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: how to compile gtk Progs in Linux
Date: Wed, 21 Jan 2004 11:04:03 +0000
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <16398.23715.988055.908177@cerise.nosuchdomain.co.uk>
References: <Pine.LNX.4.44.0401211237520.30249-100000@csews31.cse.iitk.ac.in>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.44.0401211237520.30249-100000@csews31.cse.iitk.ac.in>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "K.Anantha Kiran" <ananth@cse.iitk.ac.in>
Cc: linux-c-programming@vger.kernel.org


K.Anantha Kiran wrote:

> am doing a prj in linux using c.
> using gtk for gui interface.
> gtk code in c.
> 
> using gcc. but could not compile.

Usually, it helps to say exactly what happened, e.g. error messages.

> all gtk lib are at default place. still.
> 
> can u pls ask ur frndz there and mail me how to compile gtk programs
> in c using gcc.

You need to specify the appropriate compiler/linker switches.

For GTK 1.x, you can use "gtk-config --cflags" to obtain the necessary
compiler switches and "gtk-config --libs" for the linker switches.

For GTK 2.x, use "pkg-config --cflags gtk+-2.0" and
"pkg-config --libs gtk+-2.0" instead.

For a "standard" GTK 1.x installation, it is usually sufficient to add
-I/usr/lib/glib/include to the compiler switches and -lgtk to the
linker switches.

OTOH, GTK 2.x often requires a lot of switches, so I suggest running
pkg-config from the Makefile, e.g.:

	GTKFLAGS	:= $(shell pkg-config --cflags gtk+-2.0)
	GTKLIBS		:= $(shell pkg-config --libs gtk+-2.0)

Note the use of ":=" rather than "=", so that the command is only run
once, not every time the variable is used.

-- 
Glynn Clements <glynn.clements@virgin.net>
