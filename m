From: ibraheem umaru-mohammed <iumarumo@eidosnet.co.uk>
Subject: Telnet issues
Date: Fri, 26 Jul 2002 12:43:42 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20020726114341.GC9971@micromuse.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

This is a shot in the dark...am having some *solaris* issues and was
just hoping someone might spot something that i am missing...

Basically, telnet seems to work differently when given
an IP address to when it is given a hostname?

Basically, we have a problem where we attempt to spawn a shell to start
xterm with telnet as the command...when a hostname is specified, telnet
establishes contact, but for some reason is started up in
SINGLE_CHARACTER_MODE. When an IP address is specified, telnet is
started in LINE_MODE. 

We get the following when started in SINGLE_CHARACTER_MODE:

			--cut here--
Trying 193.131.98.222...
Connected to springfield.
Escape character is '^]'.
			--cut here--

And it just hangs there. The command we are trying to issue in C is:

execl("/bin/sh", "sh", "-c", "xterm -e /bin/sh -c 'telnet springfield'", (char *)0);

Anyone have any ideas?

Kindest regards,

			--ibs.

-- 
			ibraheem umaru-mohammed
			   www.micromuse.com
			         --0--
