From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: mixing C/C++
Date: Wed, 26 Nov 2003 02:09:52 +0000
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <16324.2928.523401.152599@cerise.nosuchdomain.co.uk>
References: <20031124111050.GI1819@pcmag.gr>
	<200311242218.40158.steven_shaw@iprimus.com.au>
	<20031124175501.GA1022@velka.phys.uoa.gr>
	<200311251221.39488.steven_shaw@iprimus.com.au>
	<1069757381.3fc333c52bf2b@webmail.uoa.gr>
	<16323.16426.473841.162971@cerise.nosuchdomain.co.uk>
	<1069765948.3fc3553ce0ef8@webmail.uoa.gr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <1069765948.3fc3553ce0ef8@webmail.uoa.gr>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: elathan@phys.uoa.gr
Cc: Steven Shaw <steven_shaw@iprimus.com.au>, linux-c-programming@vger.kernel.org


elathan@phys.uoa.gr wrote:

> > It works fine for me:=20
> [snipped]=20
> > 		wrap_foo_dump(f);=20
> > 		wrap_bar_dump2(f);=20
> > 	=20
> > 		return 0;=20
> > 	}=20
> =20
> Up to that point yes. But if you try to call dump3() (exactly with th=
e code you=20
> have pasted) you wan't get "Taz Hello", but "Bar Hello". This strange=
 behaviour=20
> will not happen, if you subistute the virtual methods with ordinary o=
nes.=20

Right.

You cannot treat "Foo*" and "Taz*" as equivalent within C.

You would have to have separate wrap_foo_dump3() and wrap_taz_dump3(),
and pass only Foo* to the former and only Taz* to the latter.

With single inheritance, the subclass' data structure normally begins
with the (sole) superclass' data structure, with any subclass-specific
fields appended afterwards. With multiple inheritance, this isn't
possible; the beginning of the subclass' data structure cannot
simultaneously match those for multiple superclasses.

A C++ compiler will adjust the pointer when performing a narrowing
cast, so it points directly at the superclass' data structure. A C
compiler can't do this, as it doesn't know anything about classes.

This issue is touched upon at the bottom of =A732.8 of the FAQ to which
Steven linked:

	http://www.parashift.com/c++-faq-lite/mixing-c-and-cpp.html#faq-32.8

--=20
Glynn Clements <glynn.clements@virgin.net>
-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
