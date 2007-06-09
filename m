From: Ingvald Gjesdal <inggjesd@start.no>
Subject: Re: using the correct tool to time my parallel program
Date: Sat, 09 Jun 2007 10:02:37 +0200
Message-ID: <466A5E9D.8030505@start.no>
References: <aaf549e0706082208n4b5df24x544e0edcf43ef3dc@mail.gmail.com>
Reply-To: ingvald.gjesdal@start.no
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <aaf549e0706082208n4b5df24x544e0edcf43ef3dc@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: linux-c-programming@vger.kernel.org

You can use the return value from times(), which returns the number of
clock ticks since system boot

Ingvald

Mark Farnell wrote:
> I have a parallel program, which calls some message passing functions
> which block.  Then I attempted to use times() (with struct tms) to
> time the program.
>=20
> the struct tms gives me the "program time" and the "system time" as
> well as the child process time (if any).  However does it also includ=
e
> the time spent when my program is blocked (i.e. network time).
>=20
> This is important because although I use gprof to separate the CPU
> time spent by my program vs libraries, when I calculate the total tim=
e
> spent, I really need to include the time spent waiting for message
> from network (network time).
>=20
> Therefore is times() really appropriate for my purpose?  If not, what
> other functions can I use instead? (such as gettimeofday?)
>=20
> Thanks!
>=20
> Mark
> -
> To unsubscribe from this list: send the line "unsubscribe=20
> linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>=20
>=20


--=20
Ingvald Gjesdal
5955 Lind=E5s

ingvald.gjesdal@start.no
Tlf. 56 36 96 03
Mob. 408 00 084
-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
