From: Michal Nazarewicz <mina86@tlen.pl>
Subject: Re: How to lseek the larger file > 2GB under linux
Date: Sun, 17 May 2009 18:20:25 +0200
Message-ID: <87tz3ju2eu.fsf@erwin.mina86.com>
References: <d13fb4990905170840j6ac84b0ej758582e5ffb5fa8c@mail.gmail.com>
	<d13fb4990905170842l5f700842k43db34f44ef2f829@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha1; protocol="application/pgp-signature"
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:sender:from:to:cc:subject
         :references:x-url:x-pgp-fp:x-pgp:date:in-reply-to:message-id
         :user-agent:mime-version:content-type;
        bh=ib3M8/Kr4nQSjZaXZOCALg1LiH2V+7HZYCcTpYdCYrs=;
        b=lN0A56g1Ad3S2sS78xoFyWF72spY2NJs32CFih/l7nryygovRM3A0/ZnMaz8PLLAiR
         2VRo157fBRNFXOG2gC2UkdfG0sxTMw7XVU2LeTea6V4T9TjIIfC2GBdn0YogbEEFBJOp
         wsUKN9M7TQWHUtL6RwyTKOnBg72TxHMOcsAaw=
In-Reply-To: <d13fb4990905170842l5f700842k43db34f44ef2f829@mail.gmail.com>
	(Nicle's message of "Sun, 17 May 2009 23:42:23 +0800")
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
To: Nicle <ynicle@gmail.com>
Cc: linux-c-programming@vger.kernel.org

--=-=-=
Content-Transfer-Encoding: quoted-printable

Nicle <ynicle@gmail.com> writes:
> I have a file > 2GB, and my job is seeking the file to pos: 2.1G.
> But, it seems that the lseek64 doesn't work.

> #define _LARGEFILE64_SOURCE
> #include ...
>
> int main() {
>  int fd =3D -1;
>  long long pos =3D (long long) 2*1024*1024*1024 + 10; // over 2G

A long shot, but try (2LL << 30) (the "LL" is important).  I don't
expect that will make it work but if you're out of ideas... ;)

>  fd =3D open(FILENAME, O_WRONLY|O_LARGEFILE);
>  if (fd < 0) { /* ... */ }
>
>  if (lseek64(fd, pos, SEEK_SET) < 0)
>      fprintf(stderr, "Failed seeking to %lld, %s\n", pos, strerror(errno)=
);
>
>  return 0;
> }

>  Then the building cmd:   gcc -o test test.c -D_FILE_OFFSET_BITS=3D64
>  Output:            >     Failed seeking to 2147483658, Success.
>
> The return val of lseek64  was "<0", but the strerror told me "Success".

BTW. The following works fine for me:

#v+
#define _LARGEFILE64_SOURCE

#include <errno.h>
#include <fcntl.h>
#include <stdio.h>
#include <string.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <unistd.h>

#define RUN(expr) if ((expr) < 0) { perror(#expr); return 1; } else (void)0

int main(void) {
	const long long pos =3D (2LL << 30) + 10;
	int fd;

	RUN(fd =3D open("deleteme", O_WRONLY | O_LARGEFILE | O_CREAT, 0600));
	RUN(lseek64(fd, pos, SEEK_SET));
	RUN(write(fd, "a", 1));
	return 0;
}
#v-

=2D-=20
Best regards,                                         _     _
 .o. | Liege of Serenly Enlightened Majesty of      o' \,=3D./ `o
 ..o | Computer Science,  Michal "mina86" Nazarewicz   (o o)
 ooo +--<mina86*tlen.pl>--<jid:mina86*jabber.org>--ooO--(_)--Ooo--

--=-=-=
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.11 (GNU/Linux)

iEYEARECAAYFAkoQOVEACgkQUyzLALfG3x6MPQCfb7y475fsN6yRK/2rvx0v2UnK
AQ4An3TNj65zcu7k8xThPnfKkzUSUF10
=8iXr
-----END PGP SIGNATURE-----
--=-=-=--
