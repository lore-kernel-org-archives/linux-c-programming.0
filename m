From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: Some question about one method.
Date: Tue, 25 May 2004 01:41:27 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <16562.38455.520556.960840@cerise.nosuchdomain.co.uk>
References: <1085135081.21344.21.camel@relay.localnet>
	<20040521211714.GP1912@lug-owl.de>
	<c8sab1$biq$1@sea.gmane.org>
	<20040524173017.GW1912@lug-owl.de>
	<c8u049$b00$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <c8u049$b00$1@sea.gmane.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Charlie Gordon <gmane@chqrlie.org>
Cc: linux-c-programming@vger.kernel.org


Charlie Gordon wrote:

> > struct {
> >  char first;
> >  char second;
> > } s1;
> > struct {
> >  char both[2];
> > } s2;
> > what's the difference ?
> 
> On most architectures, not much.  But C makes no guaranties as to the actual
> layout of structures.
> In particular (&s1.second - &s1.first) may be different than 1.

More generally, (&s1.second - &s1.first) is meaningless. Pointer
arithmetic is only defined when both pointers refer to elements of a
common array.

-- 
Glynn Clements <glynn.clements@virgin.net>
