From: Glynn Clements <glynn@gclements.plus.com>
Subject: RE: Into the Void
Date: Wed, 2 Feb 2005 12:15:58 +0000
Message-ID: <16896.50302.251490.680737@gargle.gargle.HOWL>
References: <D2AA47A6FB2C1A48AF0526440C0F245CAA3634@monm207.nae.ds.army.mil>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <D2AA47A6FB2C1A48AF0526440C0F245CAA3634@monm207.nae.ds.army.mil>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org


Huber, George K RDECOM CERDEC STCD SRI wrote:

> Well we have not put anything in that memory location yet, and
> as I recall, under Linux any memory is zero-out when returned by malloc to
> help prevent information leakage from one application to another.

Memory contains zeroes when it is first given to the process by the
kernel. Whether or not memory returned from malloc() contains zeroes
depends upon whether that memory has been used previously by the
current process.

At the beginning of a process' life cycle (e.g. at the top of main()),
memory returned from malloc() is likely to contain zeroes.

As time goes by, it becomes increasingly likely that memory returned
from malloc() has previously been allocated, used, then free()d. In
which case, the memory's contents will have been retained; neither
malloc() nor free() themselves fill the memory with zeroes.

If you need to ensure that memory contains zeroes, either use calloc()
(which is defined to fill the memory with zeroes), or fill it yourself
with memset().

-- 
Glynn Clements <glynn@gclements.plus.com>
