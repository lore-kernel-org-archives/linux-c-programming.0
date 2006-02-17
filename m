From: Shriramana Sharma <samjnaa@gmail.com>
Subject: Compiling the NIST Time Client - 2
Date: Fri, 17 Feb 2006 08:22:56 +0530
Message-ID: <200602170822.56226.samjnaa@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Linux C Programming List <linux-c-programming@vger.kernel.org>

> after which I got a clean compile and the program seems to work fine.

I forgot to add that I also got a warning:

cc -o sw.o -c sw.c
sw.c: In function =E2=80=98sw=E2=80=99:
sw.c:43: warning: conflicting types for built-in function =E2=80=98ssca=
nf=E2=80=99

So I added a #include <stdio.h> to sw.c and removed the int sscanf(); a=
fter=20
which a make nistime operation concluded without errors or warnings.

--=20

Tux #395953 resides at http://samvit.org
playing with KDE 3.51 on SUSE Linux 10.0
$ date [] CCE +2006-02-17 W07-5 UTC+0530
-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
