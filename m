From: Christoph Bussenius <busseniu@cip.physik.uni-muenchen.de>
Subject: Re: functions to determine dementions of console?
Date: Wed, 26 May 2004 16:41:38 +0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20040526144138.GA32207@opaque>
References: <Pine.LNX.4.58.0405231854400.11050@debian>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.58.0405231854400.11050@debian>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

On Sun, May 23, 2004 at 07:05:07PM -0400, ameer armaly wrote:
> I was wondering if there are a set of functions/system calles to let me
> know what someone's set their tty length and heighth too?  I do this
> because I don't want to presume 80x25 in case someone's got it set
> otherwise.

To quote vcs(4):

/dev/vcs[1-63]  are  character  devices  for virtual console terminals,
they have major number 7 and minor number 1 to 63,  usually  mode 0644
and  owner  root.tty.   /dev/vcsa[0-63]  are  the  same,  but including
attributes, and prefixed with four bytes giving the  screen dimensions
and  cursor position: lines, columns, x, y.  (x = y = 0 at the top left
corner of the screen.)

Regards,
Christoph

-- 
``There's no dark side of the moon, really
Matter of fact, it's all dark''

--Pink Floyd
