From: Billy O'Connor <billy@oconnoronline.net>
Subject: Re: c debugging w/ gdb revisited
Date: Fri, 14 Jun 2002 02:21:38 -0400 (EDT)
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20020614062138.240CD89@dps7.oconnoronline.net>
References: <20020614065235.010E336F9@sitemail.everyone.net>
Reply-To: billy@oconnoronline.net
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20020614065235.010E336F9@sitemail.everyone.net>
	(xjnfx@doityourself.com)
List-Id: <linux-c-programming.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: xjnfx@doityourself.com
Cc: linux-c-programming@vger.kernel.org

   just a quick question, does anyone know if its possible to set a break/watchpoint in gdb when a register points to a certain location?
   i own the gdb manual, and have been playing in it for a bit and just cant seem to figure it out, is it possible?


I don't believe that could be done at all, the machine would have to
stop whenever it mov'd a value to the register so the debugger could
examine it.  I don't think that's possible on Intel machines, anyway.

--
Billy O'Connor
