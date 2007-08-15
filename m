From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: String comparison for fixed strings
Date: Wed, 15 Aug 2007 15:46:30 +0100
Message-ID: <18115.4550.134335.647087@cerise.gclements.plus.com>
References: <9870a8150708150406x6297b877u473bfbbc62949f10@mail.gmail.com>
	<200708150918.52599.kratzers@pa.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <200708150918.52599.kratzers@pa.net>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: kratzers@pa.net
Cc: KhaOsh <ficheironegro@gmail.com>, linux-c-programming@vger.kernel.org


Stephen Kratzer wrote:

> > In terms of speed what the fastest way of doing a strings comparison
> > on fixed strings? Using one of those strcmp() functions or doing the
> > following:
> >
> > (Pseudo code)
> > "if (s[0] == 0xa && s[1] == 0xb && s[2] == 0xc)" (etc)
> > or
> > "if (s[0] == 'A' && s[1] == 'B' && s[2[ == 'C')" (etc)
> >
> > Thanks for your help.
> 
> The function strcmp uses a do/while loop, a conditional to test every 
> character in the first string against the null character, and pointer 
> arithmetic, so, in terms of sheer speed, your method would probably be 
> faster. But, in terms of program clarity, strcmp wins by a mile.

1. The test against the NUL byte can't be eliminated unless you know
in advance that the string is long enough.

2. The above pseudo-code also does pointer arithmetic: "s[2]" is just
another way of writing "*(s+2)".

3. An actual loop is typically quicker than an "unrolled" loop (where
you just repeat the loop body) as it results in smaller code and thus
better cache coherency.

All things considered, strcmp() is likely to be faster.

-- 
Glynn Clements <glynn@gclements.plus.com>
