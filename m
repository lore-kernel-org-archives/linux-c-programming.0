From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: data structure question
Date: Tue, 17 May 2005 08:36:40 +0100
Message-ID: <17033.40712.26126.544056@gargle.gargle.HOWL>
References: <42871714.5060007@bonbon.net>
	<17031.11321.223828.203914@gargle.gargle.HOWL>
	<4287315D.3080802@bonbon.net>
	<17031.23394.834533.766062@gargle.gargle.HOWL>
	<42881ADE.2010009@bonbon.net>
	<17032.48134.349409.976254@gargle.gargle.HOWL>
	<4288E71C.2060400@bonbon.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <4288E71C.2060400@bonbon.net>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: gumbold@bonbon.net
Cc: linux-c-programming@vger.kernel.org


gumbold wrote:

> > then sizeof(struct abc) would be 8 and the offset of abc from the
> > beginning of the structure would be 4.
> > 
> > With:
> > 
> > 	struct abc {
> > 	    __u16 a;
> > 	    __u16 b;
> > 	    char abc[0];
> > 	};
> > 
> > sizeof(struct abc) would be 4 and the offset of abc from the beginning
> > of the structure would still be 4 (i.e. p->abc refers to the first
> > byte after the structure).
> 
> I understand. But if you doing `p->abc = (char *)malloc(111)'

That would be an error. p->abc is an array, not a pointer.

Arrays and pointers aren't the same. They are often confused, for
several reasons:

1. An array is automatically converted to a pointer to its first
element whenever it occurs as an expression. This doesn't apply to
lvalues (e.g. in declarations or as the argument to sizeof).

2. In a declaration, the syntax foo[...] declares an array named foo,
but in the expression foo[...], foo is a pointer (it might be an array
which has been converted to a pointer according to point 1 above, but
it's still a pointer).

3. In a function prototype, pointer arguments can be declared using
either "T foo[]" or "T *foo".

-- 
Glynn Clements <glynn@gclements.plus.com>
