From: "Richard Nairn" <Richard@nairnconsulting.ca>
Subject: Re: Thread scheduling on an SMP
Date: Thu, 23 Dec 2004 10:08:48 -0700
Message-ID: <opsjg0kyykizdgzp@mail.nairnconsulting.ca>
References: <84bd26ef04122305146c8f8a89@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <84bd26ef04122305146c8f8a89@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed	delsp=yes"
To: =?iso-8859-15?Q?Dar=EDo_Mariani?= <mariani.dario@gmail.com>, linux-c-programming@vger.kernel.org

If I am reading your question correctly, you are talking about schedula=
r =20
affinity. You can set which processors you would like to assign pid's t=
o. =20
You need a kernel after 2.5.8 for thiese functions...

Excerpt:

#include <sched.h>

int sched_setaffinity(pid_t pid, unsigned int len, unsigned long *mask)=
;

int sched_getaffinity(pid_t pid, unsigned int len, unsigned long *mask)=
;

DESCRIPTION
sched_setaffinity sets the CPU affinity mask of the process denoted by =
=20
pid. If pid is zero, then the current process is used.

The affinity mask is represented by the bitmask stored in mask. The lea=
st =20
significant bit corresponds to the first logical processor number on th=
e =20
system, while the most significant bit corresponds to the last logical =
=20
processor number on the system. A set bit corresponds to a legally =20
schedulable CPU while an unset bit corresponds to an illegally schedula=
ble =20
CPU. In other words, a process is bound to and will only run on process=
ors =20
whose corresponding bit is set. Usually, all bits in the mask are set.

The argument len is the length of the data pointed to by mask. Normally=
 =20
this is the size of a word on the system. For compatibility with future=
 =20
versions of the Linux kernel, since this size can change, the bitmask =20
supplied must be at least as large as the affinity mask stored in the =20
kernel.

The function sched_getaffinity writes into the pointer supplied by mask=
 =20
that is size len the affinity mask of process pid. If pid is zero, then=
 =20
the mask of the current process is returned.

On Thu, 23 Dec 2004 10:14:17 -0300, Dar=EDo Mariani =20
<mariani.dario@gmail.com> wrote:

> Hello:
>   I have a machine with 4 processors, and I wold like to make the
> following: Set 1 processor to do general stuff using the default
> scheduler and the other three working on my program exclusively, with
> the realtime or my own thread scheduler.
>   Is this possible?, thanks for any comment or links to documentation
> you can give me.
>
>               Dar=EDo
> -
> To unsubscribe from this list: send the line "unsubscribe =20
> linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



--=20
  |       Richard Nairn          Specializing in Linux
  |     Nairn Consulting         Web / Database Solutions
  |        Calgary, AB
  | Richard@NairnConsulting.ca
-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
