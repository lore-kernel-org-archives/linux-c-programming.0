From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: times()
Date: Sat, 5 Apr 2008 03:45:04 +0100
Message-ID: <18422.59312.24703.716109@cerise.gclements.plus.com>
References: <c6c65ec80804041604g583f809bi1f8f4ae27a2ba748@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <c6c65ec80804041604g583f809bi1f8f4ae27a2ba748@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: =?ISO-8859-1?Q?Jo=E3o_Fernandes_Simpl=EDcio?= <jfsimplicio@gmail.com>
Cc: linux-c-programming@vger.kernel.org


Jo=E3o Fernandes Simpl=EDcio wrote:

> I've been testing the times() function and I can't understand in what
> way is the ticking being incremented for system time measurement
> (tms_stime). I understand that tms_utime gives the ticking related to
> the process and what does tms_stime gives?

tms_utime is the amount of CPU time spent executing user-space code
(i.e. the executable and shared libraries), while tms_stime is the
amount of CPU time spent in the kernel.

> E.g.:
>=20
> In 5 minutes the process gives 10000 ticks, so if the OS supports a
> maximum of 32758 process identifiers this gives us a 30% of load.
>=20
> Is my thinking right or am I missing something else?

The number of PIDs doesn't come into it.

times() reports the CPU time used by a single process.

If sysconf(_SC_CLK_TCK) is 100, then 5 minutes is 5*60*100 =3D 30000
ticks, so 10000 ticks corresponds to 33% of the CPU time being used by
that process.

Also, note that 100% correponds to full utilisation of a single CPU.=20
If you have multiple CPUs (a single CPU chip with multiple cores is
treated as multiple CPUs), a multi-threaded process can exceed 100%
CPU.

--=20
Glynn Clements <glynn@gclements.plus.com>
--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
