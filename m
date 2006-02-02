From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: Does GCC link only used functions?
Date: Thu, 2 Feb 2006 16:39:48 +0000
Message-ID: <17378.13780.99415.165938@cerise.gclements.plus.com>
References: <200601291438.17093.samjnaa@gmail.com>
	<17373.1722.484465.747500@cerise.gclements.plus.com>
	<d93f04c70602012117v6998ef94k3e87a9a3820a45f9@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <d93f04c70602012117v6998ef94k3e87a9a3820a45f9@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hendrik Visage <hvjunk@gmail.com>
Cc: Shriramana Sharma <samjnaa@gmail.com>, Linux C Programming List <linux-c-programming@vger.kernel.org>


Hendrik Visage wrote:

> > > So does this mean that GCC links only those functions from a library which I
> > > call directly or indirectly through another called function in the course of
> > > my program?
> 
> > For a static library (which is just an archive of object files), the
> > linker will only use those object files which are necessary to satisfy
> > any outstanding references.
> 
> That means that all the functions and everything in that object file
> is included?

Yes. The linker can't include specific portions of an object file.

> thus given the lib.a contains obj1.o and obj2.o compiled from obj1.c &
> obj2.c below,
> the program main from main.c below, linked with lib.a will contain the
> obj1.o part, which
> will also include the superflouos int b() (That's the way I understood
> it too), but not obj2 with c() & d().

Correct.

-- 
Glynn Clements <glynn@gclements.plus.com>
