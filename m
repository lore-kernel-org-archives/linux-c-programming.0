From: ibraheem umaru-mohammed <iumarumo@eidosnet.co.uk>
Subject: Re: Telnet issues
Date: Mon, 29 Jul 2002 19:07:26 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20020729180725.GA1595@micromuse.com>
References: <20020726114341.GC9971@micromuse.com> <200207271513.g6RFDLnW001345@grinch.txt.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <200207271513.g6RFDLnW001345@grinch.txt.com>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Jason P. Winters" <jason@txt.com>
Cc: linux-c-programming@vger.kernel.org

[Jason P. Winters wrote...]
-|  
-| > This is a shot in the dark...am having some *solaris* issues and was
-| > just hoping someone might spot something that i am missing...
-| > ...
-| > execl("/bin/sh", "sh", "-c", "xterm -e /bin/sh -c 'telnet springfield'", (char *)0);
-| 
-| Hmm... Well, one thing I can see is.. why invoke a shell in xterm to
-| invoke telnet?  Here's what I just tried, and it seems to work (sparc:solaris 8):
-| 
-| execl("/bin/sh", "sh", "-c", "/usr/openwin/bin/xterm -e telnet www", (char *)0);
-| execl("/bin/sh", "sh", "-c", "/usr/openwin/bin/xterm -e telnet (ipnumber)", (char *)0);
-| execl("/bin/sh", "sh", "-c", "xterm -e telnet (ipnumber)", (char *)0);
-| 
-| and it all works for both the name and an ip number...  
-| 
-| So possibly your problem is the extra shell you're invoking.
-| 
-| Ciao!
-| 
-| Jason
-| 

Thanks for responding. Problem was very weird and interesting.

Firstly, the reason why we were invoking a shell in xterm had to do with some of
the environment variables we were passing through, such as the location
of xterm, the telnet host etc.

Initially, I thought it was some sort of name resolving issue (NIS or
something)...having played around with some message catalogs , I found 
I could get the telnet to fork successfully if I didn't open all the
message catalogs. I couldn't figure it out  - was it a name resolving
issue or a locale problem? Hmmn...

Hours later, a colleague later found that I was forking without closing copied file 
descriptors...we added a for loop to close all open file descriptors in the 
range 0  - MAX_INT...and it worked. No issues at all now strangely enough.

Any one have any ideas why this should be platform (solaris) specific
issue, and why i didn't get some sort of proper error? Even so, it seems
strange that that should be the solution to the problem.

Kindest regards,

			--ibs.

-- 
			ibraheem umaru-mohammed
			   www.micromuse.com
			         --0--
