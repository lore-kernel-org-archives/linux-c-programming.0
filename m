From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: Socket listening listening on both interfaces
Date: Thu, 12 Feb 2004 22:38:48 +0000
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <16428.120.17555.966165@cerise.nosuchdomain.co.uk>
References: <1076502331.4523.38.camel@qa.intotoind.com>
	<16426.28980.499777.670099@cerise.nosuchdomain.co.uk>
	<1076567648.4523.62.camel@qa.intotoind.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <1076567648.4523.62.camel@qa.intotoind.com>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: syedk <syedk@intotoinc.com>
Cc: linux-c-programming@vger.kernel.org


syedk wrote:

> my question is does'nt the ioctl call:
> ioctl(sock,SIOCGIFFLAGS,&ifinfo);
> bind the socket to eth1?

No; it simply queries the flags for eth1.

> if it does'nt do  i need  to bind it using setsockopt?

Yes.

-- 
Glynn Clements <glynn.clements@virgin.net>
