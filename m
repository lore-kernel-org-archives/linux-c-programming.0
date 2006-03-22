From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: Debugging ephemeris code
Date: Wed, 22 Mar 2006 15:39:32 +0000
Message-ID: <17441.28596.565556.430774@cerise.gclements.plus.com>
References: <200603220530.21282.samjnaa@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <200603220530.21282.samjnaa@gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Shriramana Sharma <samjnaa@gmail.com>
Cc: Linux C Programming List <linux-c-programming@vger.kernel.org>


Shriramana Sharma wrote:

> In the LGPL ephcom library (53 KB) available from:=20
> http://ephemeris.com/software.html do I get an error when using make =
or=20
> trying to compile ephcom.c directly:
>=20
> gcc -g -O2   -c -o ephcom.o ephcom.c
> ephcom.c: In function =1B-F=A1ephcom_writebinary_block=A2:=1B-A
> ephcom.c:1418: error: conflicting types for =1B-F=A1ephcom_outdouble=A2=
=1B-A
> ephcom.c:1266: error: previous declaration of =1B-F=A1ephcom_outdoubl=
e=A2 was here=1B-A
> ephcom.c: At top level:
> ephcom.c:1767: warning: =1B-F=A1ephcom_cheby=A2 declared inline after=
 being called=1B-A
> ephcom.c:1767: warning: previous implicit declaration of =1B-F=A1ephc=
om_cheby=A2 was =1B-A
> here
> make: *** [ephcom.o] Error 1
>=20
> So what shall I do to safely avert this error? (I don't want to mess =
up things=20
> so I ask the experts here.)

Change line 1266 from:

	double ephcom_outdouble(FILE *, double);
to:
	int ephcom_outdouble(FILE *, double);

And report this issue to bugs@ephemeris.com.

The return value is never used anyhow.

--=20
Glynn Clements <glynn@gclements.plus.com>
-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
