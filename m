From: Shriramana Sharma <samjnaa@gmail.com>
Subject: Compiling the NIST Time Client
Date: Fri, 17 Feb 2006 08:00:59 +0530
Message-ID: <200602170800.59429.samjnaa@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Linux C Programming List <linux-c-programming@vger.kernel.org>

Hello all.

I downloaded the source code for the NIST Time Client from=20
ftp://time-a.nist.gov/pub/daytime and compiled it using make. I made th=
e=20
following changes to the source code to make it compile without errors =
but I=20
want to verify here that I have not committed a blunder (though the pro=
gram=20
compiles and works properly).

I got:

samjnaa@linux:~/src/daytime> make nistime
cc -o tcp.o -c tcp_time_client.c
tcp_time_client.c: In function =E2=80=98main=E2=80=99:
tcp_time_client.c:172: warning: incompatible implicit declaration of bu=
ilt-in=20
function =E2=80=98exit=E2=80=99
tcp_time_client.c:172: error: too few arguments to function =E2=80=98ex=
it=E2=80=99
tcp_time_client.c:203: warning: incompatible implicit declaration of bu=
ilt-in=20
function =E2=80=98exit=E2=80=99
tcp_time_client.c:203: error: too few arguments to function =E2=80=98ex=
it=E2=80=99
tcp_time_client.c:209: warning: incompatible implicit declaration of bu=
ilt-in=20
function =E2=80=98exit=E2=80=99
tcp_time_client.c:209: error: too few arguments to function =E2=80=98ex=
it=E2=80=99
tcp_time_client.c:228: warning: incompatible implicit declaration of bu=
ilt-in=20
function =E2=80=98exit=E2=80=99
tcp_time_client.c:242: warning: incompatible implicit declaration of bu=
ilt-in=20
function =E2=80=98exit=E2=80=99
tcp_time_client.c:247: warning: incompatible implicit declaration of bu=
ilt-in=20
function =E2=80=98exit=E2=80=99
tcp_time_client.c:255: warning: incompatible implicit declaration of bu=
ilt-in=20
function =E2=80=98exit=E2=80=99
tcp_time_client.c:308: warning: incompatible implicit declaration of bu=
ilt-in=20
function =E2=80=98exit=E2=80=99
tcp_time_client.c:310: warning: incompatible implicit declaration of bu=
ilt-in=20
function =E2=80=98exit=E2=80=99
make: *** [tcp.o] Error 1

So I replaced all occurrences of:

exit(); with return;
exit(0); with return 0;
exit(1); with return 1;

after which I got a clean compile and the program seems to work fine.

Converting exit to return seems a harmless operation but ever since I c=
ame to=20
Linux I am somewhat paranoid about hacking anything myself without=20
guidance...

Thanks.

--=20

Tux #395953 resides at http://samvit.org
playing with KDE 3.51 on SUSE Linux 10.0
$ date [] CCE +2006-02-17 W07-5 UTC+0530
-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
