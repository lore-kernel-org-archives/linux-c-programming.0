From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Subject: Re: ioctl fails....
Date: Sun, 16 May 2004 11:18:24 +0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20040516091823.GG1912@lug-owl.de>
References: <40A6F876.50405@sancharnet.in>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="yJGMwzir+WFaxbyA"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <40A6F876.50405@sancharnet.in>
List-Id: <linux-c-programming.vger.kernel.org>
To: linux-c-programming@vger.kernel.org


--yJGMwzir+WFaxbyA
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, 2004-05-16 10:43:26 +0530, joy <gracecott@sancharnet.in>
wrote in message <40A6F876.50405@sancharnet.in>:
> #include<linux/ppdev.h>
> #include<stdlib.h>
> #include<unistd.h>
> #include<linux/parport.h>

parport.h shouldn't be needed.

> #include<time.h>
> #include<sys/types.h>
> #include<sys/stat.h>
> #include<fcntl.h>
> #include<linux/ioctl.h>

For a small program I wrote, these headers were sufficient:

#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/ioctl.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <linux/ppdev.h>

Generally, try to keep the number of needed OS dependand headers small.
That keeps you informed about that needs to be ported if you ever need
to go to another OS.

> main()
> {
> 	int filedes;
> 	char data=3D0xff;
> 	struct timespec time;
> 	filedes=3Dopen("/dev/par0",O_RDWR);
> 	if(ioctl(filedes,PPCLAIM)=3D=3D-1)
> 		perror("OPEN");
> =09
> 	if(ioctl(filedes, PPWDATA, &data)=3D=3D-1)
> 		perror("Hi");
> 	time.tv_sec=3D1;
> 	time.tv_nsec=3D1000;
> 	nanosleep(&time,NULL);
> 	close(filedes);
> 	return;
> }

The code itself looks okay technically (well, early exit on failure
would be nice:), but I suspect that you're using a wrong device. Is your
device /dev/par0 a char-dev with major=3D99 and minor=3D0? Is the ppdev
driver loaded?

MfG, JBG

--=20
   Jan-Benedict Glaw       jbglaw@lug-owl.de    . +49-172-7608481
   "Eine Freie Meinung in  einem Freien Kopf    | Gegen Zensur | Gegen Krieg
    fuer einen Freien Staat voll Freier B=FCrger" | im Internet! |   im Ira=
k!
   ret =3D do_actions((curr | FREE_SPEECH) & ~(NEW_COPYRIGHT_LAW | DRM | TC=
PA));

--yJGMwzir+WFaxbyA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFApzHfHb1edYOZ4bsRAvrqAJ4tde8ELQ1OnIH7Mg7DmPC0UkEanQCeOjYQ
LJpzU6B7CO50VxVXzUkEzMY=
=69tF
-----END PGP SIGNATURE-----

--yJGMwzir+WFaxbyA--
