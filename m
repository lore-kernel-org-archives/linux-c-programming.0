From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: Byte Order
Date: Fri, 14 Jan 2005 21:31:04 +0000
Message-ID: <16872.14872.897993.999745@gargle.gargle.HOWL>
References: <20050113_100557_072441.r_zaca@ig.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20050113_100557_072441.r_zaca@ig.com.br>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: r_zaca <r_zaca@ig.com.br>
Cc: linux-c-programming@vger.kernel.org


r_zaca wrote:

>   Thanks a lot, that is what I was looking for. A simple test that I can do, 
> using some C conde, to find out if the machine where the program is running 
> on uses Big or Little endian "memory organization". 

	#include <endian.h>
	
	#if __BYTE_ORDER == __LITTLE_ENDIAN
		...
	#elif __BYTE_ORDER == __BIG_ENDIAN
		...
	#elif __BYTE_ORDER == __PDP_ENDIAN
		...
	#endif

-- 
Glynn Clements <glynn@gclements.plus.com>
