From: Elias Athanasopoulos <eathan@otenet.gr>
Subject: Re: non-blocking server?
Date: Sat, 18 Jan 2003 13:34:50 +0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20030118133450.B1128@neutrino.particles.org>
References: <200301172219.14911.wrazlov@gmx.net>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <200301172219.14911.wrazlov@gmx.net>; from wrazlov@gmx.net on Fri, Jan 17, 2003 at 10:31:31PM +0000
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wrazlov <wrazlov@gmx.net>
Cc: linux-c-programming@vger.kernel.org

On Fri, Jan 17, 2003 at 10:31:31PM +0000, Wrazlov wrote:
> the last time I tried to write a server in C I had the problem that it had to 
> wait for Bytes to arrive at the open port which blocked the process.

You can make the socket non-blocking:

	fcntl(s, F_SETFL, O_NONBLOCK);

Use select() to pick the right descriptor to send()/recv() data.

Elias

-- 
http://gnewtellium.sourceforge.net			MP3 is not a crime.	
