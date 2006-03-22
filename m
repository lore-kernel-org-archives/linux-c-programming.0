From: Shriramana Sharma <samjnaa@gmail.com>
Subject: Debugging ephemeris code
Date: Wed, 22 Mar 2006 05:30:21 +0530
Message-ID: <200603220530.21282.samjnaa@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Linux C Programming List <linux-c-programming@vger.kernel.org>

In the LGPL ephcom library (53 KB) available from:=20
http://ephemeris.com/software.html do I get an error when using make or=
=20
trying to compile ephcom.c directly:

gcc -g -O2   -c -o ephcom.o ephcom.c
ephcom.c: In function =E2=80=98ephcom_writebinary_block=E2=80=99:
ephcom.c:1418: error: conflicting types for =E2=80=98ephcom_outdouble=E2=
=80=99
ephcom.c:1266: error: previous declaration of =E2=80=98ephcom_outdouble=
=E2=80=99 was here
ephcom.c: At top level:
ephcom.c:1767: warning: =E2=80=98ephcom_cheby=E2=80=99 declared inline =
after being called
ephcom.c:1767: warning: previous implicit declaration of =E2=80=98ephco=
m_cheby=E2=80=99 was=20
here
make: *** [ephcom.o] Error 1

So what shall I do to safely avert this error? (I don't want to mess up=
 things=20
so I ask the experts here.)

Thank you very much in advance.

--=20

Tux #395953 resides at http://samvit.org
playing with KDE 3.51 on SUSE Linux 10.0
$ date [] CCE +2006-03-22 W12-3 UTC+0530
-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
