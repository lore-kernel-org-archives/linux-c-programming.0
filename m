From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: Help: need to prevent infinite loop
Date: Sun, 22 Jan 2006 10:20:44 +0000
Message-ID: <17363.23676.751524.480464@cerise.gclements.plus.com>
References: <200601171006.36978.samjnaa@gmail.com>
	<43CC996D.4050100@ajp-services.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <43CC996D.4050100@ajp-services.net>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: jesse@ajp-services.net
Cc: linux-c-programming@vger.kernel.org


Jesse Ruffin wrote:

> The problem is a general one that will affect many non digit characters.
> 
> scanf() on my computer returns 0, an early match error. But what you
> probably don't expect, and I can't find in the info or man pages, is
> that glibc scanf seems to unget() the input that it has read.

It doesn't "unget" anything, it simply doesn't consume anything.

More generally, [f]scanf() only consumes the data which actually
matches the fields in the format string. The return value tells you
how many fields were assigned; if the return value is zero, nothing is
assigned and nothing is consumed.

-- 
Glynn Clements <glynn@gclements.plus.com>
