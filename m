From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: basic C telnet client
Date: Thu, 26 Jun 2003 23:45:41 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <16123.30613.614307.71893@cerise.nosuchdomain.co.uk>
References: <Pine.LNX.4.44.0306261256410.5469-100000@ns.isi.ulatina.ac.cr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.44.0306261256410.5469-100000@ns.isi.ulatina.ac.cr>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Fabio Miranda Hamburger <fabmirha@ns.isi.ulatina.ac.cr>
Cc: linux-c-programming@vger.kernel.org


Fabio Miranda Hamburger wrote:

> Hi, Where Can I get source code of a basic telnet client coded in C?
> I was reviewing freebsd's telnet.c but it's kinda complex. I am looking
> for a basic one for starters.

I'm not sure that you'll find one. The telnet protocol has lots of
options, and any useful telnet client will implement many of them.

If you're interested in the general concepts rather than the telnet
protocol specifically, an rlogin/rsh client will be much simpler.

-- 
Glynn Clements <glynn.clements@virgin.net>
