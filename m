From: Glynn Clements <glynn@gclements.plus.com>
Subject: RE: Multithreading with C++ - solved
Date: Sat, 9 Apr 2005 00:04:27 +0100
Message-ID: <16983.3579.943387.918959@gargle.gargle.HOWL>
References: <D2AA47A6FB2C1A48AF0526440C0F245CAA367B@monm207.nae.ds.army.mil>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <D2AA47A6FB2C1A48AF0526440C0F245CAA367B@monm207.nae.ds.army.mil>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Huber, George K RDECOM CERDEC STCD SRI" <George.K.Huber@us.army.mil>
Cc: linux-c-programming@vger.kernel.org


Huber, George K RDECOM CERDEC STCD SRI wrote:

> Thanks for all of the suggestions. Actually, Eric hit the nail on
> the head - I was forgetting to link to libpthread. Knew I had to,
> remember thinking that I need to change my makefile and add
> libpthread to the list of libraries that I was linking to. Would
> have bet money that I did this. Oh well....
> 
> Now this bring up an interesting question - how can a program using
> pthread compile cleanly when it is not linked to libpthread? I would
> expect unresolved externals on all pthread functions?

Maybe you were linking against another library which had libpthread as
a dependency; that would cause it to be linked in.

However, while that will prevent unresolved symbols, it won't
generally be sufficient for the resulting program to execute
correctly.

The reason is that libpthread overrides a number of libc functions.

If you explicitly link against libpthread, everything which uses those
functions will use the libpthread versions; however, if you rely upon
libpthread being linked implicitly, some code will use the libpthread
versions while other code will use the libc versions. This tends to
cause crashes.

-- 
Glynn Clements <glynn@gclements.plus.com>
