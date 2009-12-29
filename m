From: Michal Nazarewicz <mina86@tlen.pl>
Subject: Re: Msync Invalid Arg
Date: Tue, 29 Dec 2009 15:30:24 +0100
Message-ID: <87vdfphmyn.fsf@erwin.mina86.com>
References: <22791256.21262087525518.JavaMail.root@wombat>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha1; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1752092AbZL2Oak@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:sender:from:to:cc:subject
         :references:x-url:x-pgp-fp:x-pgp:date:in-reply-to:message-id
         :user-agent:mime-version:content-type;
        bh=dEMYing2CqxoZ97wgIutMgkbB2n4potI+VjJiUWhxfc=;
        b=wgWDOv76l5xgFuGmGondQ00q8q6Pbr2WM+3UgBOVEQ+a5TBAQpnzTiIWToZ3QbjelZ
         duL/kQOvplk1kP+9O6KsySId10VsMYrDBVxnnf/oXtI8qrP+SSaRgx3hXDiJmCLVqVTN
         BGUD2zE73jWDMpA24swrsA5euVnU+6RJkDqj0=
In-Reply-To: <22791256.21262087525518.JavaMail.root@wombat> (darshan ghumare's
	message of "Tue, 29 Dec 2009 06:52:05 -0500")
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
To: darshan.ghumare@gmail.com
Cc: linux-c-programming@vger.kernel.org, linux-kernel@vger.kernel.org

--=-=-=
Content-Transfer-Encoding: quoted-printable

darshan.ghumare@gmail.com writes:

> Whne I try to execute following code I get "Invalid Argumemt" error
> message in msync.

/* Code rewritten to be shorter */

> #include <fcntl.h>
> #include <stdio.h>
> #include <stdlib.h>
> #include <string.h>
> #include <sys/mman.h>
> #include <unistd.h>
>=20
> #define DIE_IF(cnd, msg) do{ if (cnd) { perror(msg); return 1; } }while(0)
>=20
> int main(void)
> {
> 	char data[20];
> 	void *addr;
> 	int fd, ret;
>=20
> 	fd =3D open("/dev/mem", O_RDWR | O_SYNC);
> 	DIE_IF(fd < 0, "open");
>=20
> 	addr =3D mmap(0, 4096, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
> 	DIE_IF(addr =3D=3D MAP_FAILED, "mmap");
>=20
> 	strcpy(data, "Test Msg");
> 	ret =3D write(fd, data, strlen(data));
> 	DIE_IF(ret < 0, "write");
>=20
> 	ret =3D msync(addr, 4096, MS_SYNC);
> 	DIE_IF(ret < 0, "msync");
>=20
> 	ret =3D lseek(fd, 0, SEEK_SET);
> 	DIE_IF(ret < 0, "lseek");
>=20
> 	memset(data, 0, sizeof data);
> 	ret =3D read(fd, data, sizeof data);
> 	DIE_IF(ret < 0, "read");
> 	printf("Read: %s.\n", data);
>=20
> 	return 0;
> }


The msync(2) fails because /dev/mem driver (drivers/char/mem.c) does not
implement fsync file operation which is used by msync(2) system call.

This sort of makes sense since there is no need to sync the /dev/mem
file -- there is no backing storage on hard drive or anywhere, when you
write data there you write directly to the memory and same goes for
reading.

Anyhow, I'm Ccing this to linux-kernel as maybe we need a dummy fsync
operation for /dev/mem which would do nothing and return zero?

=2D-
Best regards,                                         _     _
 .o. | Liege of Serenly Enlightened Majesty of      o' \,=3D./ `o
 ..o | Computer Science,  Michal "mina86" Nazarewicz   (o o)
 ooo +--<mina86*tlen.pl>--<jid:mina86*jabber.org>--ooO--(_)--Ooo--

--=-=-=
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.12 (GNU/Linux)

iEYEARECAAYFAks6EokACgkQUyzLALfG3x4DJQCffDNvg08atG4/kAtlS3cNVARo
cJYAniaVQS2Lo5kytNwCJe1JQh/j4uvN
=2ln3
-----END PGP SIGNATURE-----
--=-=-=--
