From: tabris <tabris@tabris.net>
Subject: C99 doesn't allow local scope variables?
Date: Mon, 26 Jan 2004 21:30:30 -0500
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <200401262130.35636.tabris@tabris.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Description: clearsigned data
Content-Disposition: inline
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

simple C program

#include <stdlib.h>
#include <stdio.h>

int main(void)
{
    for (int i=0; i < 2; i++)
        printf("crap\n");
};

[tabris@tabriel tmp]$ gcc test.c -o test
test.c: In function `main':
test.c:6: error: `for' loop initial declaration used outside C99 mode

What does that mean, and why am I not allowed to make a local scope variable 
for a for{;;} loop?

works fine if i declare the variable outside the loop. But I swear I used to 
do this with gcc 2.95.
- --
tabris
- -
Body by Nautilus, Brain by Mattel.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iD8DBQFAFc1J1U5ZaPMbKQcRAiJyAJ4namXjJa9zd6Y/VGbR+Y5pyHVjUwCcCy4s
dW251Zxh2o3I97eabiisOMg=
=21yl
-----END PGP SIGNATURE-----

