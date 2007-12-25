From: =?utf-8?B?Q2loYW4gS8O2bWXDp2/En2x1?= <cihan@enderunix.org>
Subject: setuid funciton
Date: Tue, 25 Dec 2007 21:12:41 +0200
Message-ID: <861350659.20071225211241@enderunix.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-c-programming@vger.kernel.org

Hello everybody

I have written simple code about usage of setuid. this program file set=
-user-id bit is on and this process after exec when I execute this prog=
ram, effective user id and saved-user-id bit will be program-file's use=
r id. this correct?

But the last output when I set uid to 80(www) ,effective user id wasn't=
 80. Why not? saved set user id is still 80? What is the problem?


I compiled below code with gcc and I set-user-id bit and change own fil=
e with this command


Code:
 #include <stdlib.h>
#include <stdio.h>
#include <unistd.h>
#include <sys/types.h>

int main(void)
{
 =20
    printf("Real UID\t=3D %d\n", getuid());
    printf("Effective UID\t=3D %d\n", geteuid());
    printf("Real GID\t=3D %d\n", getgid());
    printf("Effective GID\t=3D %d\n", getegid());
       =20
         setuid(1001);
    printf("Real UID\t=3D %d\n", getuid());
    printf("Effective UID\t=3D %d\n", geteuid());
    printf("Real GID\t=3D %d\n", getgid());
    printf("Effective GID\t=3D %d\n", getegid());

setuid(80);
    printf("Real UID\t=3D %d\n", getuid());
    printf("Effective UID\t=3D %d\n", geteuid());
    printf("Real GID\t=3D %d\n", getgid());
    printf("Effective GID\t=3D %d\n", getegid());
    return EXIT_SUCCESS;
}gcc setuid-simple.c -o setuid-simple
#[root] chown www setuid-simple
#[root] chmod 4755 setuid-simple

and output with ls command
-rwsr-xr-x 1 www wheel 5708 23 Ara 11:41 setuid-simple


this is program's output:


Quote:
Real UID =3D 1001
Effective UID =3D 80
Real GID =3D 0
Effective GID =3D 0
/*setuid(1001)*/
Real UID =3D 1001
Effective UID =3D 1001
Real GID =3D 0
Effective GID =3D 0
/*setuid(80)*/
Real UID =3D 1001
Effective UID =3D 1001
Real GID =3D 0
Effective GID =3D 0=20




--=20
Cihan K=F6me=E7o=F0lu,
EnderUNIX SDT                         mailto:cihan@enderunix.org

-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
