From: "Jason P. Winters" <jason@txt.com>
Subject: Re: Telnet issues
Date: Sat, 27 Jul 2002 08:13:21 -0700 (PDT)
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <200207271513.g6RFDLnW001345@grinch.txt.com>
References: <20020726114341.GC9971@micromuse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20020726114341.GC9971@micromuse.com> from "ibraheem umaru-mohammed" at Jul 26, 2002 12:43:42 PM
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ibraheem umaru-mohammed <iumarumo@eidosnet.co.uk>
Cc: linux-c-programming@vger.kernel.org

 
> This is a shot in the dark...am having some *solaris* issues and was
> just hoping someone might spot something that i am missing...
> ...
> execl("/bin/sh", "sh", "-c", "xterm -e /bin/sh -c 'telnet springfield'", (char *)0);

Hmm... Well, one thing I can see is.. why invoke a shell in xterm to
invoke telnet?  Here's what I just tried, and it seems to work (sparc:solaris 8):

execl("/bin/sh", "sh", "-c", "/usr/openwin/bin/xterm -e telnet www", (char *)0);
execl("/bin/sh", "sh", "-c", "/usr/openwin/bin/xterm -e telnet (ipnumber)", (char *)0);
execl("/bin/sh", "sh", "-c", "xterm -e telnet (ipnumber)", (char *)0);

and it all works for both the name and an ip number...  

So possibly your problem is the extra shell you're invoking.

Ciao!

Jason

-- 
|EMAIL jason@txt.com                        Who wills, Can.
|VOICE (408) 243-3425                         Who tries, Does.
|LOCAL Hey, Jason!                              Who loves, Lives.          o_.
|Disclaimer:  Not me! I didn't do *THAT!*                                 <|
|Local Disclaimer:  I'm not here!                   A. McCaffrey           4
