From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Subject: Re: question about gcc and keyboard hadling
Date: Tue, 6 Aug 2002 08:13:33 +0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20020806061333.GO758@lug-owl.de>
References: <02080504255200.24029@linux> <15694.36614.996185.222692@cerise.nosuchdomain.co.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vNrHrykRFvLVX6W3"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <15694.36614.996185.222692@cerise.nosuchdomain.co.uk>
List-Id: <linux-c-programming.vger.kernel.org>
To: linux-c-programming@vger.kernel.org


--vNrHrykRFvLVX6W3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, 2002-08-05 15:43:18 +0100, Glynn Clements <glynn.clements@virgin.ne=
t>
wrote in message <15694.36614.996185.222692@cerise.nosuchdomain.co.uk>:
>=20
> +Rudymartin wrote:
>=20
> > im trying to develop a text editor using gcc version 2.96 20000731 (Red=
 Hat=20
> > Linux 7.1 2.96-81) , and thats because I want to make some experience w=
ith=20
> > C++ (I used to program in Java and C under windowz) The Info pages have=
=20
> > information about most libraries and functions but I have found no way =
to=20
> > trap the modifiers keys (ALT/CTRL/SHIFT) under a terminal. And I notice=
d=20
> > emacs can trap those keys under a terminal.
>=20
> You can't get the same kind of modifier behaviour on a terminal that
> you can in a windowed environment.

Well... It's not exactly portable, but you (at least) can get Ctrl, Alt
and Shift running Linux at the Console. I don't know in which way this
interacts with ncurses (definitely, it _will_ interact on input), but
you can do eg.:

#include <stdio.h>
#include <fcntl.h>
#include <linux/kd.h>
#include <possibly/others.h>

struct termios tio_old;
struct termios tio_new;
int old_mode;
char one_byte;

fd=3Dopen("/dev/tty", O_RDONLY);
tcgetattr(fd, &tio_old);
tcgetattr(fd, &tio_new);
ioctl(fd, KDGKBMODE, &old_mode);
ioctl(fd, KDSKBMODE, K_MEDIUMRAW);
tio_new.c_lflag	&=3D ~(ICANON|ECHO|ISIG);
tio_new.c_iflag =3D 0;
tio_new.c_cc[VMIN] =3D 1;
tio_new.c_cc[VTIME] =3D 1
tcsetattr(fd, TCSANOW, &tio_new);
tcflush(fd, TCIOFLUSH);

while(read() =3D=3D sizeof(one_byte)) {
	/* Process Input, will show Alt, Shift and Ctrl*/;
	if(dont_need_to_do_more_work)
		break;
}

ioctl(fd, KDSKBMODE, old_mode);
tcsetattr(fd, TCSANOW, &tio_old);
tcflush(fd, TCIOFLUSH);

close(fd);

However - not easily portable:-(

MfG, JBG

--=20
Jan-Benedict Glaw   .   jbglaw@lug-owl.de   .   +49-172-7608481
	 -- New APT-Proxy written in shell script --
	   http://lug-owl.de/~jbglaw/software/ap2/

--vNrHrykRFvLVX6W3
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQE9T2kNHb1edYOZ4bsRAvWrAJ4qZBhIAvr+405RLm1llaP9SZn2BQCdET0r
rD/jx2Owr2h7FSLLpS8NTPE=
=c42H
-----END PGP SIGNATURE-----

--vNrHrykRFvLVX6W3--
