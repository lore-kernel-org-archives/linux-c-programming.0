From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: dereferencing pointer to incomplete type
Date: Wed, 16 Jun 2004 22:04:17 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <16592.46545.902693.855705@cerise.nosuchdomain.co.uk>
References: <016001c453dc$08d6ec70$d3113b80@yoursgz3xpngo4>
	<20040616201413.GG6157@opaque>
	<01b501c453de$74bb17c0$d3113b80@yoursgz3xpngo4>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <01b501c453de$74bb17c0$d3113b80@yoursgz3xpngo4>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Anshuman S. Rawat" <asr@cs.columbia.edu>
Cc: linux-c-programming@vger.kernel.org


Anshuman S. Rawat wrote:

> > > Arping.xs:153: dereferencing pointer to incomplete type

In the absence of any other errors, this usually means that you are
dereferencing a pointer to a structure or union type, but the compiler
doesn't have the definition of the structure.

This is normally only relevant to struct/union types, as it is
possible to refer to undefined struct/union types without a syntax
error, i.e.

	struct foo *p;
	union bar *q;

Attempting to use any other unknown type, e.g.

	foo *p;

would result in a syntax error (e.g. "parse error before '*' token").

However, any operation which requires the actual definition of those
structures (i.e. accessing fields with -> or performing pointer
arithmetic) will generate the above "incomplete type" error unless the
definitions are known.

> > >  make: *** [Arping.o] Error 1
> > >  
> > >  memcpy(enet_src, src_mac->ether_addr_octet,6);
> > ...
> > >  struct ether_addr
> > >  {
> > >      u_char  ether_addr_octet[6];
> > >  };
> > 
> > Hi, I think you should define that struct _before_ you use it. This
> > error is exactly what you get when you define it later.
> 
> The struct is defined before it is used through a header file.

The error message indicates that the compiler doesn't know the
definition of "struct ether_addr", which suggests that it hasn't
actually been defined (e.g. because the relevant header file
(net/ethernet.h) hasn't been included).

-- 
Glynn Clements <glynn.clements@virgin.net>
