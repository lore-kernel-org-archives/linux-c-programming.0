From: "Steve Graegert" <graegerts@gmail.com>
Subject: Re: threads and kernel
Date: Mon, 22 Oct 2007 16:20:52 +0200
Message-ID: <6a00c8d50710220720q31c24b71vf761a0dd5563bad9@mail.gmail.com>
References: <471B5276.9010800@gmail.com>
	 <6a00c8d50710211023t898f17idf77bcad37c37a9b@mail.gmail.com>
	 <471C4849.2040409@purplelabs.com>
	 <6a00c8d50710220601s6aa10d26u762215a3989bf6cd@mail.gmail.com>
	 <471CA544.5050701@purplelabs.com>
	 <6a00c8d50710220631u7a9589bcjccdbca234184edaf@mail.gmail.com>
	 <471CA7CD.5070702@purplelabs.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        bh=DkHymznAKZNrQhMDiyO4I16u8XWMjQl2ITQhc4R4PVI=;
        b=OpVatuIDVI80zxerNZtM89zbimfquSn1EbPe2v27+wWZ8yUg3oCFWiBfLNemtzGGLogiS3Wu8nd66z6jHW24Y7FyqlOizbCIgc1VMvmwdJHzJMCGM1kr0GKgzWBWAl9AhSuy9oGobMlDQyvVjKBJ8xRzegp99H2u1OeUCy3JxPw=
In-Reply-To: <471CA7CD.5070702@purplelabs.com>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Benoit Fouet <benoit.fouet@purplelabs.com>
Cc: Linux C Programming List <linux-c-programming@vger.kernel.org>

On 10/22/07, Benoit Fouet <benoit.fouet@purplelabs.com> wrote:
> Hi,
>
> Steve Graegert wrote:
> > Benoit,
> >
> > On 10/22/07, Benoit Fouet <benoit.fouet@purplelabs.com> wrote:
> >
> >> Hi Steve,
> >>
> >> Steve Graegert wrote:
> >>
> >>> Hi Benoit,
> >>>
> >>> On 10/22/07, Benoit Fouet <benoit.fouet@purplelabs.com> wrote:
> >>>
> >>>
> >>>> Hi,
> >>>>
> >>>> Steve Graegert wrote:
> >>>>
> >>>>
> >>>>> As a side note: you can safely use dlopen()  to load shared lib=
raries,
> >>>>> whether or not they depend on libpthread.so, as long as the mai=
n
> >>>>> program was initially threaded.  The other way round is dangero=
us and
> >>>>> mostly not allowed.
> >>>>>
> >>>>>
> >>>>>
> >>>>>
> >>>> could you please elaborate a bit on that ? i cannot see why this=
 is
> >>>> dangerous.
> >>>>
> >>>>
> >>> I was referring to making an application multithreaded at runtime=
=2E
> >>> Therefore you cannot use dlopen() to dynamically add libpthread.s=
o to
> >>> a process when the main program is not __initially threaded__.  B=
y
> >>> "initially threaded" I mean that the libpthread.so  library is
> >>> initialized at program start, either because the main program lin=
ks
> >>> against libpthread.so directly, or because it links against some =
other
> >>> shared library that links against libpthread.so.
> >>>
> >>> Dynamically changing the process environment from "nonthreaded" t=
o
> >>> "threaded" is dangerous and rarely useful (I actually doubt that =
this
> >>> "feature" is useful at all).
> >>>
> >> If i understand correctly what you're saying, you cannot have some=
thing
> >> like:
> >>
> >> int main(int argc, char *argv[]) {
> >>   /* ... */
> >>   foo =3D dlopen("bar.so");
> >>   /* use bar.so functions, clean, etc... */
> >> }
> >>
> >> if bar.so is multithreaded (and thus, linked to libpthread.so) and=
 you
> >> don't compile your main program with -lpthread option.
> >> did i understand you right ?
> >>
> >> this would mean you may need to link against pthread library, just=
 in
> >> case the library(ies) you dlopen might use it ?
> >>
> >
> > Linking against a multi-threaded library at compile time, turns the
> > main program into a multi-threaded program even though no use of
> > threads is being made at all.
> >
> >
>
> i agree, but this was not what i asked.
> consider a library foo using threads.
> consider a main program bar only linked to dl.
> chat you said is that bar cannot use sanely foo functions, because it=
 is
> not multithreaded itself, right ?

Basilcally yes, but let me summarize some important points:

Suppose you have an application that is not linked against libpthread,
neither directly nor indirectly (just as you stated earlier).  The
init code used to set up the main program doesn't care about threads,
because it assumes that they won't be used anyway.  Hence you have a
non-threaded program.  The important thing is the init code, not
whether the main program makes call to pthread_* and its siblings or
not.

Now, this non-thread program loads a shared object using dlopen()
which is linked against libpthread, thus resulting in an "abort trap".

I remember Apache to crash with an abort trap when loading mod_perl
although it has been build without errors.  Recompiling apache with
CFLAGS+=3D-pthread fixed the problem.

Example:

#include <dlfcn.h>
#include <stdio.h>
#include <stdlib.h>

int main(void) {
	void *h;  // the handle

	printf("Trying to load libpthread.so\n");
	h =3D dlopen("libpthread.so", RTLD_LAZY);
	printf("libpthread.so loaded successfully\n");
	dlclose(h);

	return EXIT_SUCCESS;
}

This can be worked around by linking against libpthread, because this
causes the initialization code used to set up the program to be
overridden.

Considering the previous example, doing:

cc test.c
=2E/a.out

results in a crash. But

cc -lpthread test.c
=2E/a.out

won't. Even

cc test.c
LD_PRELOAD=3D/usr/lib/libpthread.so ./a.out

will work.  It's the initialization code that matters, not if threads
are used or not.

	\Steve

--

Steve Gr=E4gert
DigitalEther.de
-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
