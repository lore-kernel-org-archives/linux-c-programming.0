From: Progga <abulfazl@juniv.edu>
Subject: Re: Any pointer to Byte Alignment & Structure Padding?
Date: Tue, 2 Aug 2005 17:08:26 +0600
Message-ID: <20050802170826.D276@Imrashi.net.bd>
References: <014001c5968e$4e30ca70$9900a8c0@ispl091><6eee1c40508010514517b5b90@mail.gmail.com><015a01c59694$80662070$9900a8c0@ispl091><20050801161125.716db5ff@localhost.localdomain><003b01c59715$d3ffef00$9900a8c0@ispl091><6a00c8d5050801234267dd0f7f@mail.gmail.com><01dd01c5972f$5c3b62a0$9900a8c0@ispl091> <17135.20687.821822.269575@cerise.gclements.plus.com> <02c401c59745$2aaa0410$9900a8c0@ispl091>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="yudcn1FV7Hsu/q59"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <02c401c59745$2aaa0410$9900a8c0@ispl091>; from amit_dang@intersolutions.stpn.soft.net on Tue, Aug 02, 2005 at 03:02:35PM +0530
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
To: Amit Dang <amit_dang@intersolutions.stpn.soft.net>
Cc: linux-c-programming@vger.kernel.org


--yudcn1FV7Hsu/q59
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 02, 2005 at 03:02:35PM +0530, Amit Dang wrote:

>     You are very right in saying that "there is no need for structures to
> have same layout on different platform" until structures are being written
> directly to the file system. But many time there is a requirement that the
> data file can be moved across platforms.

 In that case use __attribute__ ((packed)) after the structure definition.
There'll be no alignment then and the size will always be the same.

	struct hihi{
		int a ;
		char b ;
	} __attribute__ ((packed)) ;


--yudcn1FV7Hsu/q59
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (FreeBSD)

iD8DBQFC71QqAjLUsitphWkRAvxUAKC+5VqXKWWH1Bzm14V0GFQh1MdRiwCgl3/r
eoxB6nhZqO0G4WHZWkCM4yc=
=hHAJ
-----END PGP SIGNATURE-----

--yudcn1FV7Hsu/q59--
