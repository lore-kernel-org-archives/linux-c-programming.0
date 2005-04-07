From: Sandro Dangui <sandro.dangui@gmail.com>
Subject: Re: Multithreading with C++
Date: Thu, 7 Apr 2005 17:26:05 -0300
Message-ID: <fde20208050407132613484e07@mail.gmail.com>
References: <D2AA47A6FB2C1A48AF0526440C0F245CAA3679@monm207.nae.ds.army.mil>
	 <84bd26ef05040712016ad75429@mail.gmail.com>
	 <fde202080504071322520de47@mail.gmail.com>
Reply-To: Sandro Dangui <sandro.dangui@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <fde202080504071322520de47@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-c-programming@vger.kernel.org

How many threads are you trying to create? I mean, using your class CTh=
read...
I see only a problem when trying to create more than one thread, due
to the "static CThread*  m_pThis". This attribute should not be shared
between all threads you create. I think you want to have a
relationship 1 to 1, for each instance of CThead class you want to
have one actual running thread handling with.
 =20
Sandro.
=20
 ----------------------------------------------------------------------=
------------------
 =20
> On Apr 7, 2005 4:01 PM, Dar=EDo Mariani <mariani.dario@gmail.com> wro=
te:=20
> > There are several libraries that implement multithreading in C++:
> >=20
> > * http://www.boost.org
> > * http://www.melikyan.com/ptypes/
> > * http://www.cs.wustl.edu/~schmidt/ACE.html
> >=20
> > You can use one of them and avoid the trouble of creating your own
> > library, or look there to see how they did it ;-).
> >=20
> >           Dar=EDo
> >=20
> > On Apr 7, 2005 3:52 PM, Huber, George K RDECOM CERDEC STCD SRI
> > <George.K.Huber@us.army.mil> wrote:
> > > Eric wrote:
> > >
> > > Did you compile with -lpthread and -D_REENTRANT? If I remeber cor=
rectly, this
> > > is something I had alot of trouble with when I started thread pro=
gramming.
> > > Similiar error and everything. Compiled but the library calls wer=
en't
> > > working. Make sure to include <pthread.h> too  ;)
> > >
> > > yes included <pthread.h>, defined -D_REENTRANT and linked with -l=
pthread
> > >
> > > I have written multi-threaded code in C, this is the first time t=
hat I have attempted
> > > to encapsulate a thread in a C++ object.  Must be missing somethi=
ng. :-(
> > >
> > > George
> > > -
> > > To unsubscribe from this list: send the line "unsubscribe linux-c=
-programming" in
> > > the body of a message to majordomo@vger.kernel.org
> > > More majordomo info at  http://vger.kernel.org/majordomo-info.htm=
l
> > >
> >=20
> > --
> > That is not dead which can eternal lie,
> > and with strange aeons, even death may die.
> > -
> > To unsubscribe from this list: send the line "unsubscribe linux-c-p=
rogramming" in
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
> >=20
>=20
>
-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
