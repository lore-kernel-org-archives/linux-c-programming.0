From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: Anonymous structures
Date: Sat, 5 Aug 2006 17:20:37 +0100
Message-ID: <17620.50517.258546.487081@cerise.gclements.plus.com>
References: <16D08C962563664288C2B2EC23C47FCB2364A0@BLR-SJP-MBX01.wipro.com>
	<17619.33371.576220.777404@cerise.gclements.plus.com>
	<f68850780608041928j6c417b5bs161805a207847ae9@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <f68850780608041928j6c417b5bs161805a207847ae9@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Raseel Bhagat <raseelbhagat@gmail.com>
Cc: linux-c-programming@vger.kernel.org


Raseel Bhagat wrote:

> > No. An anonymous structure has an unknown size, so the compiler cannot
> > generate code to copy them.
> >
> > Anonymous structures are only useful as pointer targets, i.e.
> > "struct A *foo". You can pass around pointers to structures without
> > knowing the size of the structure, although you can't dereference them.
> 
> If we can't dereference them, then what would be the use of such a call ?
> Can you cite a example for the above scenario ?

They can be dereferenced in a context where the structure isn't
anonymous.

A library can define a structure in a private header which is used by
the library's source files, while the public header only has an
anonymous declaration. The library can pass pointers to the
application, which can pass them back to the library, but the
application can't access the structure's members. To the application,
the pointer is an opaque handle.

E.g.:

private header:

	struct foo { int x; };

library source:

	#include "foo_priv.h"
	struct foo *foo_new(void)
	{
		struct foo *p = malloc(sizeof(struct foo));
		p->x = 0;
		return p;
	}
	void foo_set(struct foo *p, int x)
	{
		p->x = x;
	}
	int foo_get(struct foo *p)
	{
		return p->x;
	}

public header:

	struct foo;

	extern struct foo *foo_new(void);
	extern void foo_set(struct foo *p, int x);
	extern int foo_get(struct foo *p);

-- 
Glynn Clements <glynn@gclements.plus.com>
