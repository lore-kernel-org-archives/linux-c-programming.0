From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: memory capacity
Date: Tue, 9 Dec 2003 01:35:53 +0000
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <16341.9977.646069.322209@cerise.nosuchdomain.co.uk>
References: <3FD454BB.7050005@hq.ntsp.nec.co.jp>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <3FD454BB.7050005@hq.ntsp.nec.co.jp>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ronkhu@ntsp.nec.co.jp
Cc: linux-c-programming@vger.kernel.org


ronkhu wrote:

> Can anyone help me in increasing the maximum allowable memory usage for 
> an application in HP/UX?

This is a Linux list. You might get some useful replies regarding
generic Unix memory management, but you are less likely to get
anything regarding HP/UX-specific features.

> My superior instructed me to create an array of at least 7,140,000 
> elements(statically)... that would be able to
> store 8 bytes per index..
> 
> What compile option could i use to enhance the memory model (from small 
> to huge?)

Unix isn't MS-DOS. The concept of "small", "huge" etc memory models
was a hack for dealing with the 16-bit limitations on the 8086; it
isn't applicable to Unix.

> or increase the memory limit for an application?

If you have bash, try "ulimit -aS" and "ulimit -aH". Those will report
the soft and hard per-process memory limits respectively. Similarly,
csh and zsh have the "limit" command.

If the soft limits are too low, you can just use "ulimit -d ...",
"ulimit -v ..." etc in the shell to increase them. Or use setrlimit()
in the application.

If the hard limits are too low, the administrator (i.e. root) will
have to increase them; the precise mechanism is platform-specific
(e.g. RedHat uses the pam_limits PAM module; I have no idea what HP/UX
does).

-- 
Glynn Clements <glynn.clements@virgin.net>
