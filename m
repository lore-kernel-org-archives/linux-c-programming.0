From: "Pedro de Medeiros" <pedrovmm+lists@gmail.com>
Subject: Re: can't understand linking behaviour
Date: Wed, 20 Jun 2007 11:39:07 -0300
Message-ID: <38511efb0706200739g3a273c2wa94425646f88186d@mail.gmail.com>
References: <46599AB7.1010701@gmail.com>
	 <18011.26062.21505.664418@cerise.gclements.plus.com>
	 <467213AA.5070008@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:from:sender:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references:x-google-sender-auth;
        b=OeWaFRNk7uBtQBBdFIB/RA4LFMOmSn6pGVRLp94vVpGW/vgSS0Fiu3eR8SmMFmDMuRyNBbkWOMTBKxGfqKyHsFGeMmElzM3ya9cNUz5JyV5KYIp/WMOXZ/TspAHz98V2w/KiJrM/tA6DQf9YTufLBvv4/IOPDx+isjPpq16Nzlk=
In-Reply-To: <467213AA.5070008@gmail.com>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Shriramana Sharma <samjnaa@gmail.com>
Cc: Glynn Clements <glynn@gclements.plus.com>, Linux C Programming List <linux-c-programming@vger.kernel.org>

On 6/15/07, Shriramana Sharma <samjnaa@gmail.com> wrote:
> Glynn Clements wrote:
> > Libraries can have undefined references. Sometimes this is necessar=
y,
> > e.g. if the library depends upon a function which is supposed to be
> > provided by the executable.
>
> To my mind, in the real world, if a library must access a function th=
at
> the executable provides, it will only be through a function pointer -=
-
> the library may provide, for e.g. a binary search facility, and the
> program uses this to carry out a binary search on a function in its b=
ody.


Actually, that's what you do when you allow the function called by the
library to have any name: you call it by a pointer. It is more
flexible, but not necessarily the only way around.


> What real world application would make a library A to call a function
> foo() when foo() is defined in the body of an executable X that itsel=
f
> depends on A? If foo() were in a dependency of A, say library B, then=
 it
> can be understood, but to expect the function to come from X is,
> although *theoretically* possible, how practically necessary?


I suppose it is just because it is more simple and flexible to
implement it this way. Because for library A (and for the compiler and
linker) it doesn't matter if foo() comes from executable X or library
B. At compile time, those symbols are simply inserted in the table of
defined symbols, so it doesn't matter where they come from (and C
doesn't even have namespaces or something like that anyway; symbols
are just global or local).


> >> This seems highly counter-intuitive. Why would the linker require =
*only*
> >> at *executable* build-time the libraries,
> >
> > Why would the linker require all external symbols to be resolved at
> > the time the library is built?
>
> If you prove that there is a valid real-life situation where the libr=
ary
> needs a symbol from an application, then the linker would not require
> all external symbols to be resolved.


Here is an example of library using a symbol from the application: the
external environ variable referenced in unistd.h is defined by the
application. The exec* family of functions (excluding execle() I
guess) use it internally only.


Cheers,
Pedro.

--=20
Pedro de Medeiros - Ci=EAncia da Computa=E7=E3o - Universidade de Bras=ED=
lia
Home Page: http://www.nonseq.net - Linux User No.: 234250
-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
