From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: "static const" attribute in C++ (How to ?)
Date: Thu, 1 Jul 2004 23:33:24 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <16612.37172.723320.441386@cerise.nosuchdomain.co.uk>
References: <40E09FC4.50800@ig.com.br>
	<16608.44836.384260.844173@cerise.nosuchdomain.co.uk>
	<20040629143238.GD6335@luna.mooo.com>
	<16609.43579.336662.194984@cerise.nosuchdomain.co.uk>
	<20040630013316.GF9412@luna.mooo.com>
	<16610.7915.923533.301196@cerise.nosuchdomain.co.uk>
	<87k6xovci7.fsf@wigwam.deepwood.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <87k6xovci7.fsf@wigwam.deepwood.net>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Daniel Brockman <drlion@deepwood.net>
Cc: linux-c-programming@vger.kernel.org


Daniel Brockman wrote:

> >> > > > It appears that you are allowed to initialise constant static
> >> > > > members within the declaration
> >
> > [...]
> >
> > But in this case, there isn't a variable. Foo::DEFSIZE is a
> > compile-time constant; it doesn't exist in memory.
> 
> So what happens if you try to take its address?

You get a link error, unless you also add a definition in one of the
source files.

-- 
Glynn Clements <glynn.clements@virgin.net>
