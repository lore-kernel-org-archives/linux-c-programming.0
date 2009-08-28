From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: Help on bit operation
Date: Fri, 28 Aug 2009 21:19:12 +0100
Message-ID: <19096.15296.699625.446036@cerise.gclements.plus.com>
References: <34e1241d0908261602k4d07d422o7ea69b606210701a@mail.gmail.com>
	<19093.53306.413232.981055@cerise.gclements.plus.com>
	<34e1241d0908262343p1cd899a8o4c9e956371d570b3@mail.gmail.com>
	<34e1241d0908272152r32591e52wb1885433edb9a9ff@mail.gmail.com>
	<ca4725240908281002h4fc32b39t23fb84518bd0ab6a@mail.gmail.com>
	<34e1241d0908281139k66e8102dy94b70e9fcfd86763@mail.gmail.com>
	<34e1241d0908281140t65d6eb8cq371ce68cefc2f531@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <34e1241d0908281140t65d6eb8cq371ce68cefc2f531@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Randi Botse <nightdecoder@gmail.com>
Cc: linux-c-programming@vger.kernel.org


Randi Botse wrote:

> Ben, after assign all bitfield struct member, how to pack them to be a
> 32bit integer value?

The structure should be 32 bits wide. If you need the value as a
uint32_t, either use a union:

	union bits_or_int {
		struct bitfield fields;
		uint32_t value;
	};

or a cast, e.g.:

	struct bitfield foo;
	...
	uint32_t value = *(uint32_t *)&foo;

-- 
Glynn Clements <glynn@gclements.plus.com>
