From: vibi <vibi_sreenivasan@cms.com>
Subject: Re: threads and kernel
Date: Tue, 23 Oct 2007 12:40:33 +0530
Message-ID: <1193123433.2731.29.camel@root>
References: <471B5276.9010800@gmail.com> <471C4849.2040409@purplelabs.com>
	 <6a00c8d50710220601s6aa10d26u762215a3989bf6cd@mail.gmail.com>
	 <471CA544.5050701@purplelabs.com>
	 <6a00c8d50710220631u7a9589bcjccdbca234184edaf@mail.gmail.com>
	 <471CA7CD.5070702@purplelabs.com>
	 <6a00c8d50710220720q31c24b71vf761a0dd5563bad9@mail.gmail.com>
	 <1193113932.2731.2.camel@root>
	 <6a00c8d50710222214m116cba3h31b3c7e376a5f9fb@mail.gmail.com>
	 <1193118811.2731.18.camel@root>
	 <6a00c8d50710222358p42e5322btc955990e36580708@mail.gmail.com>
Reply-To: vibi_sreenivasan@cms.com
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <6a00c8d50710222358p42e5322btc955990e36580708@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Steve Graegert <graegerts@gmail.com>
Cc: Linux C Programming List <linux-c-programming@vger.kernel.org>

On Tue, 2007-10-23 at 08:58 +0200, Steve Graegert wrote:
> On 10/23/07, vibi <vibi_sreenivasan@cms.com> wrote:
> > On Tue, 2007-10-23 at 07:14 +0200, Steve Graegert wrote:
> > > On 10/23/07, vibi <vibi_sreenivasan@cms.com> wrote:
> > > >  > "The init code used to set up the main program doesn't care =
about threads,
> > > >
> > > >  because it assumes that they won't be used anyway."
> > > >
> > > > when is init code linked to the program ,during the compile tim=
e or
> > > > during the run time?
> > >
> > > It's being added by the linker at compile time.
> > >
> > >       \Steve
> >
> > the application you gave earlier is linked without any knowledge of
> > multi-threading
> > so
> >
> > > cc test.c
> > > ./a.out
> >
> > would fail
> >
> > but you also said
> >
> > > cc test.c
> > > LD_PRELOAD=3D/usr/lib/libpthread.so ./a.out
> >
> > will not fail
> >
> > in both the cases same init code is added at compile time and you a=
lso
> > said that init code determines whether a program is multi-threaded.
> >
> > So i am a little bit confused because how at run time the init code=
 is
> > changed.
>=20
> Linkage takes place at compile time and run time.  When starting a
> program its execution environment is setup properly including loading
> and linking in all libraries (including those specified on the comman=
d
> line with LD_PRELOAD and at compile time).
>=20
> The LD_PRELOAD environment variable allows you to load additional
> shared libraries at program startup.  The loader ld.so.1, loads the
> specified shared libraries as if the program had been linked
> explicitly with the shared libraries in LD_PRELOAD before any other
> dependents of the program.  At startup time, the loader implicitly
> loads one or more libraries, if found, specified in the LD_PRELOAD
> environment. It uses the same load order and symbol resolution order
> as if the library had been explicitly linked as the first library in
> the link line when building the executable.
>=20
> As a result, at startup the program is multi-threaded when
> LD_PRELOAD=3D/usr/lib/libpthread.so is specified, but if libpthread i=
s
> neither specified at compile time nor __before__ startup of the main
> program (i.e. LD_PRELOAD) the execution environment is unchanged (not
> threaded at all).
>=20
> This is possible because the init code of the libraries is executed a=
t
> before control is transfered to the main program, thus the program is
> multi-threaded although libpthread has no been specified at compile
> time and no thread-related function calls are made during runtime.
>=20
> 	\Steve

so init code is just like a stub which is resolved while setting up the
execution environment of the program,ie linkage resolution at load time=
=2E

am i understanding correctly.

thanks very much for your help
regards=20
vibi sreenivasan
=20
>=20
> --
>=20
> Steve Gr=C3=A4gert
> DigitalEther.de
>=20

-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
