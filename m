From: Shriramana Sharma <samjnaa@gmail.com>
Subject: Compile error caused by case of filename extension
Date: Sat, 25 Mar 2006 13:33:49 +0530
Message-ID: <200603251333.50127.samjnaa@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Linux C Programming List <linux-c-programming@vger.kernel.org>

When the contents of TESTING.C are:

#include "stdio.h"
void main(void)
{
	printf("\n%d\n", ( -0.25 < 0) ? 2 : 4);
}

Upon trying to compile:

$ gcc -o TESTING TESTING.C
TESTING.C:3: error: =E2=80=98::main=E2=80=99 must return =E2=80=98int=E2=
=80=99

Then I changed the file to:

#include "stdio.h"
int main(void)
{
	printf("\n%d\n", ( -0.25 < 0) ? 2 : 4);
	return 1;
}

Then I got:

$ gcc -o TESTING TESTING.C
/tmp/ccEnQk4o.o:(.eh_frame+0x11): undefined reference to=20
`__gxx_personality_v0'
collect2: ld returned 1 exit status

But if I change the input file name extension to testing.c or even TEST=
ING.c=20
(small letters) no problems were got. Why is this?

--=20

Tux #395953 resides at http://samvit.org
playing with KDE 3.51 on SUSE Linux 10.0
$ date [] CCE +2006-03-25 W12-6 UTC+0530
-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
