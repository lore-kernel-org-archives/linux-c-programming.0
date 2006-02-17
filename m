From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: Compiling the NIST Time Client
Date: Fri, 17 Feb 2006 06:24:59 +0000
Message-ID: <17397.27707.391935.798933@cerise.gclements.plus.com>
References: <200602170800.59429.samjnaa@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <200602170800.59429.samjnaa@gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Shriramana Sharma <samjnaa@gmail.com>
Cc: Linux C Programming List <linux-c-programming@vger.kernel.org>


Shriramana Sharma wrote:

> I downloaded the source code for the NIST Time Client from=20
> ftp://time-a.nist.gov/pub/daytime and compiled it using make. I made =
the=20
> following changes to the source code to make it compile without error=
s but I=20
> want to verify here that I have not committed a blunder (though the p=
rogram=20
> compiles and works properly).
>=20
> I got:
>=20
> samjnaa@linux:~/src/daytime> make nistime
> cc -o tcp.o -c tcp_time_client.c
> tcp_time_client.c: In function =1B-F=A1main=A2:=1B-A
> tcp_time_client.c:172: warning: incompatible implicit declaration of =
built-in=20
> function =1B-F=A1exit=A2=1B-A
> tcp_time_client.c:172: error: too few arguments to function =1B-F=A1e=
xit=A2=1B-A
> tcp_time_client.c:203: warning: incompatible implicit declaration of =
built-in=20
> function =1B-F=A1exit=A2=1B-A
> tcp_time_client.c:203: error: too few arguments to function =1B-F=A1e=
xit=A2=1B-A
> tcp_time_client.c:209: warning: incompatible implicit declaration of =
built-in=20
> function =1B-F=A1exit=A2=1B-A
> tcp_time_client.c:209: error: too few arguments to function =1B-F=A1e=
xit=A2=1B-A
> tcp_time_client.c:228: warning: incompatible implicit declaration of =
built-in=20
> function =1B-F=A1exit=A2=1B-A
> tcp_time_client.c:242: warning: incompatible implicit declaration of =
built-in=20
> function =1B-F=A1exit=A2=1B-A
> tcp_time_client.c:247: warning: incompatible implicit declaration of =
built-in=20
> function =1B-F=A1exit=A2=1B-A
> tcp_time_client.c:255: warning: incompatible implicit declaration of =
built-in=20
> function =1B-F=A1exit=A2=1B-A
> tcp_time_client.c:308: warning: incompatible implicit declaration of =
built-in=20
> function =1B-F=A1exit=A2=1B-A
> tcp_time_client.c:310: warning: incompatible implicit declaration of =
built-in=20
> function =1B-F=A1exit=A2=1B-A
> make: *** [tcp.o] Error 1
>=20
> So I replaced all occurrences of:
>=20
> exit(); with return;
> exit(0); with return 0;
> exit(1); with return 1;

Wrong fix, although it will work so long as all of the calls are from
within main().

The correct fix is to add "#include <stdlib.h>" to the top of the
file.

The call to exit() needs to be changed to either exit(1) or exit(0),
depending upon whether it indicates an error.

--=20
Glynn Clements <glynn@gclements.plus.com>
-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
