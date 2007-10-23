From: "Steve Graegert" <graegerts@gmail.com>
Subject: Re: threads and kernel
Date: Tue, 23 Oct 2007 09:30:13 +0200
Message-ID: <6a00c8d50710230030t40c2c3a5v2e3ad583e28ded26@mail.gmail.com>
References: <471B5276.9010800@gmail.com> <471CA544.5050701@purplelabs.com>
	 <6a00c8d50710220631u7a9589bcjccdbca234184edaf@mail.gmail.com>
	 <471CA7CD.5070702@purplelabs.com>
	 <6a00c8d50710220720q31c24b71vf761a0dd5563bad9@mail.gmail.com>
	 <1193113932.2731.2.camel@root>
	 <6a00c8d50710222214m116cba3h31b3c7e376a5f9fb@mail.gmail.com>
	 <1193118811.2731.18.camel@root>
	 <6a00c8d50710222358p42e5322btc955990e36580708@mail.gmail.com>
	 <1193123433.2731.29.camel@root>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        bh=pY11/z7beA0Ck8kG1JJqcPfR6U4qyDqKG0yLy8J6yA4=;
        b=d59VD8mxoRZMG7BrMC8gfV2XpMMPVvy/LzS4EnbiI8QMZ5Ch+bAiD0cuFEJOR7XeGY/OEzoDKBF+Qv+doV44MEvz/Nx17AAOc1INn7MfgQE9LE2TfnG9QGLODcnuz8nLca/vog9gmifqCsGdQBZvpYUZQ6Z01FjvFnMR/oMfd+k=
In-Reply-To: <1193123433.2731.29.camel@root>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: vibi_sreenivasan@cms.com
Cc: Linux C Programming List <linux-c-programming@vger.kernel.org>

On 10/23/07, vibi <vibi_sreenivasan@cms.com> wrote:
> On Tue, 2007-10-23 at 08:58 +0200, Steve Graegert wrote:
> > On 10/23/07, vibi <vibi_sreenivasan@cms.com> wrote:
> > > On Tue, 2007-10-23 at 07:14 +0200, Steve Graegert wrote:
> > > > On 10/23/07, vibi <vibi_sreenivasan@cms.com> wrote:
> > > > >  > "The init code used to set up the main program doesn't car=
e about threads,
> > > > >
> > > > >  because it assumes that they won't be used anyway."
> > > > >
> > > > > when is init code linked to the program ,during the compile t=
ime or
> > > > > during the run time?
> > > >
> > > > It's being added by the linker at compile time.
> > > >
> > > >       \Steve
> > >
> > > the application you gave earlier is linked without any knowledge =
of
> > > multi-threading
> > > so
> > >
> > > > cc test.c
> > > > ./a.out
> > >
> > > would fail
> > >
> > > but you also said
> > >
> > > > cc test.c
> > > > LD_PRELOAD=3D/usr/lib/libpthread.so ./a.out
> > >
> > > will not fail
> > >
> > > in both the cases same init code is added at compile time and you=
 also
> > > said that init code determines whether a program is multi-threade=
d.
> > >
> > > So i am a little bit confused because how at run time the init co=
de is
> > > changed.
> >
> > Linkage takes place at compile time and run time.  When starting a
> > program its execution environment is setup properly including loadi=
ng
> > and linking in all libraries (including those specified on the comm=
and
> > line with LD_PRELOAD and at compile time).
> >
> > The LD_PRELOAD environment variable allows you to load additional
> > shared libraries at program startup.  The loader ld.so.1, loads the
> > specified shared libraries as if the program had been linked
> > explicitly with the shared libraries in LD_PRELOAD before any other
> > dependents of the program.  At startup time, the loader implicitly
> > loads one or more libraries, if found, specified in the LD_PRELOAD
> > environment. It uses the same load order and symbol resolution orde=
r
> > as if the library had been explicitly linked as the first library i=
n
> > the link line when building the executable.
> >
> > As a result, at startup the program is multi-threaded when
> > LD_PRELOAD=3D/usr/lib/libpthread.so is specified, but if libpthread=
 is
> > neither specified at compile time nor __before__ startup of the mai=
n
> > program (i.e. LD_PRELOAD) the execution environment is unchanged (n=
ot
> > threaded at all).
> >
> > This is possible because the init code of the libraries is executed=
 at
> > before control is transfered to the main program, thus the program =
is
> > multi-threaded although libpthread has no been specified at compile
> > time and no thread-related function calls are made during runtime.
> >
> >       \Steve
>
> so init code is just like a stub which is resolved while setting up t=
he
> execution environment of the program,ie linkage resolution at load ti=
me.
>
> am i understanding correctly.

Well, it's not a stub, since it's a very important section of the execu=
table.

The .init section holds executable instructions that contribute to the
process initialization code.  That is, when a program starts to run
the system arranges to execute the code in this section before the
main program entry point (main() in C programs).

The .init and .fini sections have a special purpose.  If a function is
placed in the .init section, the system will execute it before the
main function.  Also the functions placed in the .fini section will be
executed by the system after the main function returns.  This feature
is utilized by compilers to implement global constructors and
destructors in C++.

Also, any shared object file included in the program also has an
opportunity to run its initialization code before the call to the main
program.

	\Steve

--

Steve Gr=E4gert
DigitalEther.de
-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
