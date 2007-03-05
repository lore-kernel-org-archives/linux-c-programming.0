From: leslie.polzer@gmx.net
Subject: Re: Handling ioctl() argp memory
Date: Mon, 5 Mar 2007 06:23:55 +0100
Message-ID: <20070305052355.GA13946@wintermute.farpoint>
References: <20070304164844.GA7231@wintermute.farpoint> <17899.30813.80673.270405@cerise.gclements.plus.com>
Reply-To: leslie.polzer@gmx.net
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="6TrnltStXW4iwmi0"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <17899.30813.80673.270405@cerise.gclements.plus.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
To: Glynn Clements <glynn@gclements.plus.com>
Cc: linux-c-programming@vger.kernel.org


--6TrnltStXW4iwmi0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 05, 2007 at 01:54:37AM +0000, Glynn Clements wrote:

> You're probably overwriting the beginning of the allocated block.
What do you mean by that?  I can surely write to allocated memory, at
the start, end and any point between...

Besides, for the record: a short Valgrind run (thanks for the reminder!)
showed me that I calculated the space wrongly, i.e. I allocated not
enough memory.

  Leslie

--=20
gpg --keyserver pgp.mit.edu --recv-keys DD4EBF83
http://nic-nac-project.de/~skypher/

--6TrnltStXW4iwmi0
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFF66lryYzv6N1Ov4MRAn+9AJ46qxsmX3GyZ6khAIK8kcoxF0mPzgCdHYrW
5juAWuKZlwo2mCUdOTXaUJE=
=6Lcd
-----END PGP SIGNATURE-----

--6TrnltStXW4iwmi0--
