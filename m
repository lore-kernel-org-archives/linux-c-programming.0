From: Steven Smith <sos22@cam.ac.uk>
Subject: Re: how to read a constantly changing file
Date: Tue, 4 Jun 2002 10:54:56 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20020604095456.GA1012@cam.ac.uk>
References: <Pine.LNX.4.33.0206041504580.32292-100000@soochak.ncst.ernet.in>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="VS++wcV0S1rZb1Fb"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.33.0206041504580.32292-100000@soochak.ncst.ernet.in>
List-Id: <linux-c-programming.vger.kernel.org>
To: Mohammed Khalid Ansari <khalid@ncst.ernet.in>
Cc: linux c programming mailing list <linux-c-programming@vger.kernel.org>


--VS++wcV0S1rZb1Fb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> I want to know how can I read a file (through a C code) which is=20
> constatnly changing, like a log file.(eg tail command)
As far as I can make out, tail does it by sitting in a loop
and calling sleep(1), and then fstat() to see if the file's grown.

You might be better off looking at directory change notifications
for the parent directory. The closest thing this has to documentation
is fs/dnotify.c in the kernel source, though.

Steven Smith,
sos22@cam.ac.uk.

--VS++wcV0S1rZb1Fb
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE8/I5vO4S8/gLNrjcRAjfdAJwKxD5Sup2Bjpy/snNwEokmus/kcACffd5Q
a06O/sslNmMD2TXO2JJYDXw=
=8Jl0
-----END PGP SIGNATURE-----

--VS++wcV0S1rZb1Fb--
