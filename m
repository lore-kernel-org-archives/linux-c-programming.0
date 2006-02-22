From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: Disadvantage of using long long int
Date: Wed, 22 Feb 2006 17:46:38 +0000
Message-ID: <17404.41854.124660.448355@cerise.gclements.plus.com>
References: <200602221235.43058.techlist@pathfinder.phys.utk.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <200602221235.43058.techlist@pathfinder.phys.utk.edu>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Reuben D. Budiardja" <techlist@pathfinder.phys.utk.edu>
Cc: linux-c-programming@vger.kernel.org


Reuben D. Budiardja wrote:

> In terms of performance and raw speed, is there any disadvantage of using 
> "long long int" instead of "long int", "long double" instead of "double" on 
> 32-bit machine ?

Yes. The longer version will typically be slower.

-- 
Glynn Clements <glynn@gclements.plus.com>
