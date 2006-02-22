From: "Steve Graegert" <graegerts@gmail.com>
Subject: Re: Disadvantage of using long long int
Date: Wed, 22 Feb 2006 18:54:15 +0100
Message-ID: <6a00c8d50602220954h324b36a4i2ed432ad5616c65d@mail.gmail.com>
References: <200602221235.43058.techlist@pathfinder.phys.utk.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <200602221235.43058.techlist@pathfinder.phys.utk.edu>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

On 2/22/06, Reuben D. Budiardja <techlist@pathfinder.phys.utk.edu> wrote:
>
> Hello,
> In terms of performance and raw speed, is there any disadvantage of using
> "long long int" instead of "long int", "long double" instead of "double" on
> 32-bit machine ? Are there any other disadvantage that I should consider?

On 32-bit Intel machines a long long int (64 bits) is usually not the
same as a long int (32 bits), the same is true for double (64 bits,
IEEE754) and long double (96 bits, IEEE845).  BTW long long int is a
GNU extension and subject to portability.  The situation is completely
different for 64-bit systems.

Conclusion: using the larger versions will result in loss of performance.

	\Steve
