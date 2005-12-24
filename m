From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: what is the current status of "stdint.h"?
Date: Sat, 24 Dec 2005 12:38:39 +0000
Message-ID: <17325.16719.188587.51455@cerise.gclements.plus.com>
References: <Pine.LNX.4.63.0512230621170.4326@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.63.0512230621170.4326@localhost.localdomain>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Robert P. J. Day" <rpjday@mindspring.com>
Cc: C programming list <linux-c-programming@vger.kernel.org>


Robert P. J. Day wrote:

>   is the plan for stdint.h to evetually be moved out of glibc-headers
> and into gcc to conform with the official definition of C99?  or is
> that glibc-headers file "/usr/include/stdint.h" unrelated to the
> eventual C99 support for stdint.h?  or what?

That would have to be addressed to the gcc developers. There is some
discussion of the issue in the thread starting at:

	http://gcc.gnu.org/ml/gcc/2004-11/msg00248.html

-- 
Glynn Clements <glynn@gclements.plus.com>
