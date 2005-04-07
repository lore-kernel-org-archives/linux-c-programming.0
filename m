From: =?ISO-8859-1?Q?Dar=EDo_Mariani?= <mariani.dario@gmail.com>
Subject: Re: Multithreading with C++
Date: Thu, 7 Apr 2005 16:01:18 -0300
Message-ID: <84bd26ef05040712016ad75429@mail.gmail.com>
References: <D2AA47A6FB2C1A48AF0526440C0F245CAA3679@monm207.nae.ds.army.mil>
Reply-To: =?ISO-8859-1?Q?Dar=EDo_Mariani?= <mariani.dario@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <D2AA47A6FB2C1A48AF0526440C0F245CAA3679@monm207.nae.ds.army.mil>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: 
Cc: linux prg <linux-c-programming@vger.kernel.org>

There are several libraries that implement multithreading in C++:

* http://www.boost.org
* http://www.melikyan.com/ptypes/
* http://www.cs.wustl.edu/~schmidt/ACE.html

You can use one of them and avoid the trouble of creating your own
library, or look there to see how they did it ;-).

           Dar=EDo

On Apr 7, 2005 3:52 PM, Huber, George K RDECOM CERDEC STCD SRI
<George.K.Huber@us.army.mil> wrote:
> Eric wrote:
>=20
> Did you compile with -lpthread and -D_REENTRANT? If I remeber correct=
ly, this
> is something I had alot of trouble with when I started thread program=
ming.
> Similiar error and everything. Compiled but the library calls weren't
> working. Make sure to include <pthread.h> too  ;)
>=20
> yes included <pthread.h>, defined -D_REENTRANT and linked with -lpthr=
ead
>=20
> I have written multi-threaded code in C, this is the first time that =
I have attempted
> to encapsulate a thread in a C++ object.  Must be missing something. =
:-(
>=20
> George
> -
> To unsubscribe from this list: send the line "unsubscribe linux-c-pro=
gramming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>=20

--=20
That is not dead which can eternal lie,
and with strange aeons, even death may die.
-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
