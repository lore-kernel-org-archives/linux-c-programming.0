From: James Stevenson <james@stev.org>
Subject: Re: generating ethernet packets
Date: Mon, 5 Jan 2004 03:58:32 +0000 (GMT)
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.44.0401050357350.19414-100000@jlap.stev.org>
References: <20031231144746.7eade402.cialdi@firenze.net>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20031231144746.7eade402.cialdi@firenze.net>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Massimiliano Cialdi <cialdi@firenze.net>
Cc: linux-c-programming@vger.kernel.org, syedk <syedk@intotoinc.com>


> > If u want to do it on your own u can use raw sockets.
> How can I generate an ethernet frame (with custom payload) with raw sockets?


Open a raw socket using the socket function.
Then use write to put the packet on the wire.

iirc there are 100's of example on doing this

	James

