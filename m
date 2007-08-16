From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: String comparison for fixed strings
Date: Thu, 16 Aug 2007 02:54:50 +0100
Message-ID: <18115.44650.24080.718866@cerise.gclements.plus.com>
References: <9870a8150708150406x6297b877u473bfbbc62949f10@mail.gmail.com>
	<200708150918.52599.kratzers@pa.net>
	<18115.4550.134335.647087@cerise.gclements.plus.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <18115.4550.134335.647087@cerise.gclements.plus.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: kratzers@pa.net, KhaOsh <ficheironegro@gmail.com>, linux-c-programming@vger.kernel.org


Glynn Clements wrote:

> 1. The test against the NUL byte can't be eliminated unless you know
> in advance that the string is long enough.

Actually, this is false. If the variable string terminates
prematurely, it will differ from the fixed string at that point, so a
separate NUL check is unnecessary.

As Jesse points out, the logical alternative to the hard-coded
comparisons is memcmp(), not strcmp().

You only need to use strcmp() if you don't know the length of either
string in advance.

-- 
Glynn Clements <glynn@gclements.plus.com>
