From: =?ISO-8859-1?Q?Dar=EDo_Mariani?= <mariani.dario@gmail.com>
Subject: Re: Random number generator in Linux kernel
Date: Tue, 8 Mar 2005 09:59:08 -0300
Message-ID: <84bd26ef050308045943a1659b@mail.gmail.com>
References: <20050307231853.9F661B6E7@xprdmailfe20.nwk.excite.com>
Reply-To: =?ISO-8859-1?Q?Dar=EDo_Mariani?= <mariani.dario@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
In-Reply-To: <20050307231853.9F661B6E7@xprdmailfe20.nwk.excite.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: 
Cc: linux-kernel@vger.kernel.org, linux-c-programming@vger.kernel.org

As far as I understand the kernel generates random numbers gathering
data from several entropy sources, you will never get repetability
from there. Two options I know of:

1) The standard C library has the functions rand and random, wich
seems to have a decent distribution of the random numbers.

2) If you use C++, the Boost library (www.boost.org) has an excelent
set of options for generating random numbers.

              Dar=EDo

On Mon,  7 Mar 2005 18:18:53 -0500 (EST), Vineet Joglekar
<vintya@excite.com> wrote:
>=20
> Hi all,
>=20
> Can someone please tell me where can I find and which random/pseudo-r=
andom number generator can I use inside the linux kernel? (2.4.28)
>=20
> I found out 1 function get_random_bytes() in linux/drivers/char/rando=
m.c but thats not what I want.
>=20
> I want a function where I will be supplying a seed to that function a=
s an input, and will get a random number back. If same seed is used, sa=
me number should be generated again.
>=20
> Can anybody please help me with that?
>=20
> Thanks and regards,
>=20
> Vineet.
>=20
> _______________________________________________
> Join Excite! - http://www.excite.com
> The most personalized portal on the Web!
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
