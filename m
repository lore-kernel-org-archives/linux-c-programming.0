From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: dereferencing pointer to incomplete type
Date: Thu, 17 Jun 2004 11:24:51 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <16593.29043.16464.273595@cerise.nosuchdomain.co.uk>
References: <016001c453dc$08d6ec70$d3113b80@yoursgz3xpngo4>
	<20040616220159.GB16146@luna.mooo.com>
	<00d301c453f5$f15ec7b0$d3113b80@yoursgz3xpngo4>
	<20040617042113.GE16146@luna.mooo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20040617042113.GE16146@luna.mooo.com>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org


Micha Feigin wrote:

> > > > Arping.xs:153: dereferencing pointer to incomplete type

> In this case its probably something else.

I doubt it.

> Are you sure that u_char is properly defined?

If it wasn't, attempts to define variables or structure fields of type
u_char would result in a parse error.

An "incomplete type" error has to refer to a struct, union or enum
(ANSI C forbids forward references to enum types, but gcc allows it). 
These are the only cases where the compiler can know that something is
a type without knowing the type's definition.

I'm quite certain that the problem is due to the fact that the
compiler knows that src_mac is a pointer to "struct ether_addr" but
doesn't know the definition of "struct ether_addr".

As the error message says:

	Arping.xs:153: dereferencing pointer to incomplete type

Assuming that the poster is correct in stating that line 153 is:

	memcpy(enet_src, src_mac->ether_addr_octet,6);

the only dereference in that line is "src_mac->ether_addr_octet", and
the pointer is "src_mac". So, the message is stating that src_mac has
"incomplete" type, which means that the compiler knows that it is a
struct, but doesn't know its definition (in particular, it doesn't
know the offset of the ether_addr_octet field, so it cannot compile
the expression).

For the record, the compiler wouldn't be concerned if enet_src had
incomplete type, because it isn't being dereferenced. The following
source file compiles without any errors or warnings (even with "-ansi
-pedantic -Wall"):

	#include <string.h>
	#include <net/ethernet.h>
	
	extern struct foo *enet_src;
	extern struct ether_addr *src_mac;
	
	void foo(void)
	{
		memcpy(enet_src, src_mac->ether_addr_octet,6);
	}

In summary, I strongly suspect that the .xs file isn't producing the C
code which the author expects; specifically, that the definition for
"struct ether_addr" isn't being seen.

-- 
Glynn Clements <glynn.clements@virgin.net>
