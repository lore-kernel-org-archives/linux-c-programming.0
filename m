From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: strange stack limit behavior when allocating more than 2GB mem on 
	32bit machine
Date: Sat, 22 Aug 2009 08:44:25 +0100
Message-ID: <19087.41433.938675.68885@cerise.gclements.plus.com>
References: <56b13acf0908202047k2bf536f9vf993394d42059b8e@mail.gmail.com>
	<19086.17786.445616.394966@cerise.gclements.plus.com>
	<56b13acf0908210212t5b6921f5h4c224efa21d2f067@mail.gmail.com>
	<op.uy0adwzdlak3lt@amdc030.digital.local>
	<56b13acf0908210404m4c235834qb874873403bfb689@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <56b13acf0908210404m4c235834qb874873403bfb689@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Joe <longapple@gmail.com>
Cc: =?ISO-8859-2?Q?Micha=B3_Nazarewicz?= <m.nazarewicz@samsung.com>, linux-c-programming@vger.kernel.org


Joe wrote:

> Clear. But how comes 2000MB can be allocated when stack limit is unlimited?

Because malloc() can allocate from the area reserved for the stack. 
The stack limit is a limit, not a reservation.

If you set a small stack limit, there will be ~2.7 GiB below where the
libraries are mapped and very little above it. If you set the stack
limit to "unlimited", there will be ~850 MiB below where the libraries
are mapped and ~2 GiB above it.

malloc() can allocate from either of those areas, but any particular
allocation must fit into one or the other. It can't split a single
allocation between areas, and it can't move any existing mappings.

-- 
Glynn Clements <glynn@gclements.plus.com>
