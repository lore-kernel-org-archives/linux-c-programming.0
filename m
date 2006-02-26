From: leslie.polzer@gmx.net
Subject: Re: Making "make" auto-strip and auto-clean
Date: Sun, 26 Feb 2006 15:10:04 +0100
Message-ID: <20060226141004.GA28946@wintermute>
References: <200602260935.27292.samjnaa@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="mP3DRpeJDSE+ciuQ"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <200602260935.27292.samjnaa@gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
To: Shriramana Sharma <samjnaa@gmail.com>
Cc: Linux C Programming List <linux-c-programming@vger.kernel.org>


--mP3DRpeJDSE+ciuQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


Hello Shiramana,

On Sun, Feb 26, 2006 at 09:35:27AM +0530, Shriramana Sharma wrote:

> I would like make to always
>
> 1. strip the executable
> 2. remove the *.o files it created
>
> after it has compiled the target executable. How do I do this? What  =20
> do I add to the makefile? The current default command I am using is: =20
>
> pan: pan.o libswe.a gcc -g -O2 -o pan pan.o -L. -lswe -lm
I'm not sure I understand your question.
  Here's my answer, though:

pan: pan.o libswe.a
        gcc -g -O2 -o pan pan.o -L. -lswe -lm
        strip pan
        rm -f *.o

  Leslie

--=20
gpg --keyserver pgp.mit.edu --recv-keys 0x52D70289
http://nic-nac-project.de/~skypher/

--mP3DRpeJDSE+ciuQ
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2 (GNU/Linux)

iD8DBQFEAba8n/ep3VLXAokRAqbQAJoCGvNz809/SZW7PDvMZjWByJOYGQCcDuFB
BgmuE6x2SEDkzV8OHIPXh78=
=Y8zk
-----END PGP SIGNATURE-----

--mP3DRpeJDSE+ciuQ--
