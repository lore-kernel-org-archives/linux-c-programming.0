From: vibi <vibi_sreenivasan@cms.com>
Subject: Re: threads and kernel
Date: Tue, 23 Oct 2007 11:23:31 +0530
Message-ID: <1193118811.2731.18.camel@root>
References: <471B5276.9010800@gmail.com>
	 <6a00c8d50710211023t898f17idf77bcad37c37a9b@mail.gmail.com>
	 <471C4849.2040409@purplelabs.com>
	 <6a00c8d50710220601s6aa10d26u762215a3989bf6cd@mail.gmail.com>
	 <471CA544.5050701@purplelabs.com>
	 <6a00c8d50710220631u7a9589bcjccdbca234184edaf@mail.gmail.com>
	 <471CA7CD.5070702@purplelabs.com>
	 <6a00c8d50710220720q31c24b71vf761a0dd5563bad9@mail.gmail.com>
	 <1193113932.2731.2.camel@root>
	 <6a00c8d50710222214m116cba3h31b3c7e376a5f9fb@mail.gmail.com>
Reply-To: vibi_sreenivasan@cms.com
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <6a00c8d50710222214m116cba3h31b3c7e376a5f9fb@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Steve Graegert <graegerts@gmail.com>
Cc: Linux C Programming List <linux-c-programming@vger.kernel.org>

On Tue, 2007-10-23 at 07:14 +0200, Steve Graegert wrote:
> On 10/23/07, vibi <vibi_sreenivasan@cms.com> wrote:
> >  > "The init code used to set up the main program doesn't care abou=
t threads,
> >
> >  because it assumes that they won't be used anyway."
> >
> > when is init code linked to the program ,during the compile time or
> > during the run time?
>=20
> It's being added by the linker at compile time.
>=20
> 	\Steve

the application you gave earlier is linked without any knowledge of
multi-threading
so=20

> cc test.c
> ./a.out

would fail

but you also said=20

> cc test.c
> LD_PRELOAD=3D/usr/lib/libpthread.so ./a.out

will not fail

in both the cases same init code is added at compile time and you also
said that init code determines whether a program is multi-threaded.

So i am a little bit confused because how at run time the init code is
changed.

regards
vibi sreenivasan

>=20
> Steve Gr=C3=A4gert
> DigitalEther.de
>=20

-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
