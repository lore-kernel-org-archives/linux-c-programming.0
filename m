From: Massimiliano Cialdi <cialdi@firenze.net>
Subject: Re: generating ethernet packets
Date: Tue, 6 Jan 2004 12:30:19 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20040106123019.76fd7d22.cialdi@firenze.net>
References: <20031231144746.7eade402.cialdi@firenze.net>
	<Pine.LNX.4.44.0401050357350.19414-100000@jlap.stev.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.44.0401050357350.19414-100000@jlap.stev.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org
Cc: James Stevenson <james@stev.org>, syedk@intotoinc.com

On Mon, 5 Jan 2004 03:58:32 +0000 (GMT)
James Stevenson <james@stev.org> wrote:

> > How can I generate an ethernet frame (with custom payload) with raw sockets?
> Open a raw socket using the socket function.
Which parameters do I need to pass to socket()?

> Then use write to put the packet on the wire.
How can I be sure that the datas will go on eth0 and not on ppp0?

> iirc there are 100's of example on doing this
where are all these examples?

it is also possible to generate an ethernet frame with wrong crc?

thanks

-- 
Massimiliano Cialdi
cialdi@firenze.net
m.cialdi@oksys.it
