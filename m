From: Progga <abulfazl@juniv.edu>
Subject: Re: FILE_FLAG_WRITE_THROUGH
Date: Wed, 5 Apr 2006 12:50:38 +0600
Message-ID: <20060405065038.GB716@ju.Imrashi.net.bd>
References: <4432B296.8050408@gmail.com> <17459.16716.938764.154497@cerise.gclements.plus.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="rJwd6BRFiFCcLxzm"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <17459.16716.938764.154497@cerise.gclements.plus.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
To: linux-c-programming@vger.kernel.org


--rJwd6BRFiFCcLxzm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 05, 2006 at 05:02:20AM +0100, Glynn Clements wrote:

> The O_DIRECT flag suggested by Steve is probably overkill. It requires
> that the buffer start address, buffer size and file offset are all
> multiples of the filesystem's block size, and only works on some
> filesystems.

Although it works for a single file, how good is fsync() in this case?


--rJwd6BRFiFCcLxzm
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.0 (FreeBSD)

iD8DBQFEM2i+AjLUsitphWkRAlWKAJ4664IlNjVJcoOOoNKqzgu4v55RgwCfaYgg
BspDuns5KiuTl5oFsgV4SH0=
=N+MY
-----END PGP SIGNATURE-----

--rJwd6BRFiFCcLxzm--
