From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: Disadvantage of using long long int
Date: Wed, 22 Feb 2006 18:55:24 +0000
Message-ID: <17404.45980.455312.5228@cerise.gclements.plus.com>
References: <200602221235.43058.techlist@pathfinder.phys.utk.edu>
	<6a00c8d50602220954h324b36a4i2ed432ad5616c65d@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <6a00c8d50602220954h324b36a4i2ed432ad5616c65d@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Steve Graegert <graegerts@gmail.com>
Cc: linux-c-programming@vger.kernel.org


Steve Graegert wrote:

> > In terms of performance and raw speed, is there any disadvantage of using
> > "long long int" instead of "long int", "long double" instead of "double" on
> > 32-bit machine ? Are there any other disadvantage that I should consider?
> 
> On 32-bit Intel machines a long long int (64 bits) is usually not the
> same as a long int (32 bits), the same is true for double (64 bits,
> IEEE754) and long double (96 bits, IEEE845).

In C99 (ISO-IEC 9899:1999), long double is supposed to be one of the
two ISO-IEC 60559 extended formats, which are 80 or 128 bits. On x86,
it's usually 80 bits.

> BTW long long int is a GNU extension and subject to portability.

long long int is part of the C99 standard.

-- 
Glynn Clements <glynn@gclements.plus.com>
