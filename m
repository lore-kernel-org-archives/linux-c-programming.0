From: linux-c-programming-owner@vger.kernel.org
Subject: Re: script in c
Date: Sun, 7 Nov 2004 22:50:24 -0800 (PST)
Message-ID: <20041108065024.35087.qmail@web14001.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-c-programming@vger.kernel.org

--- kaushal <kaushal@rocsys.com> wrote:

> Hello  all,

Hello,

>            Is there a way by which I can exec a
> shell script without
> using the "system()" call?
> Thanks in advance.

You can use exec*() family for this purpose.

man exec

Here is a little sample:

[mbaris@zion:/tmp/code_temp]$ cat exec.c
#include <unistd.h>
#include <string.h>
#include <errno.h>

int main(void)
{
  if (execl("/bin/sh", "-c", "./script.sh", NULL)=3D=3D-1)
  {
    printf("ERROR: %s\n", strerror(errno));
  }

  return 0;
}


[mbaris@zion:/tmp/code_temp]$ cat script.sh
#!/bin/bash

echo "Fired!";
exit;

[mbaris@zion:/tmp/code_temp]$ gcc -o exec exec.c
[mbaris@zion:/tmp/code_temp]$ ./exec
Fired!
[mbaris@zion:/tmp/code_temp]$

> =20
> cheers-
> kaushal.
>=20


=3D=3D=3D=3D=3D
M.Bar=FD=FE Demiray

DOS: n., A small annoying boot virus that causes random=20
spontaneous system crashes, usually just before saving a massive project. E=
asily cured by UNIX.  See also MS-DOS, IBM-DOS, DR-DOS.


	=09
__________________________________=20
Do you Yahoo!?=20
Check out the new Yahoo! Front Page.=20
www.yahoo.com=20
=20

-
To unsubscribe from this list: send the line "unsubscribe linux-c-programmi=
ng" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
