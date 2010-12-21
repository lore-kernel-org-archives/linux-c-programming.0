From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: union to get parts of integer
Date: Tue, 21 Dec 2010 16:22:50 +0000
Message-ID: <19728.54362.897067.885992@cerise.gclements.plus.com>
References: <AANLkTikAB_-kO_cmD5VQRtztx=4V9NDcmU4uWBDE=ON8@mail.gmail.com>
	<87aak0tsf3.fsf@erwin.mina86.com>
	<20101220153008.GH16355@comcast.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20101220153008.GH16355@comcast.net>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Tim Walberg <twalberg@comcast.net>
Cc: Michal Nazarewicz <mina86@tlen.pl>, ratheesh k <ratheesh.ksz@gmail.com>, linux-c-programming@vger.kernel.org


Tim Walberg wrote:

> >>	((char *)&i)[0].
> >>	
> >>	However, are you sure that you need this?  Don't you need "(i & 255)",
> >>	"((i >> 8) & 255)", etc. instead?
> 
> It's likely that either the union or direct pointer expressions yield
> more efficient code, as they can probably be compiled to direct byte-width
> load/store instructions, rather than shifts and logical ands... However,
> if the code's not in a critical path for performance, it probably won't
> matter. And on some architectures, there may not be byte-width operations,
> I guess...

The cast/union versions will give different results depending upon the
CPU's byte order. The shift/mask versions will give the same results
regardless of byte order.

-- 
Glynn Clements <glynn@gclements.plus.com>
