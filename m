From: Andreas Dilger <adilger@clusterfs.com>
Subject: Re: Adding a field to ext2_dir_entry_2
Date: Mon, 4 Apr 2005 17:17:59 -0600
Message-ID: <20050404231759.GN1753@schnapps.adilger.int>
References: <20050404225442.52A7AB730@xprdmailfe18.nwk.excite.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="MzdA25v054BPvyZa"
Return-path: <linux-kernel-owner+glk-linux-kernel=40m.gmane.org-S261491AbVDDXUC@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20050404225442.52A7AB730@xprdmailfe18.nwk.excite.com>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
To: Vineet Joglekar <vintya@excite.com>
Cc: linux-kernel@vger.kernel.org, linux-c-programming@vger.kernel.org


--MzdA25v054BPvyZa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Apr 04, 2005  18:54 -0400, Vineet Joglekar wrote:
> I working with linux kernel 2.4.28. I want to add 1 more field to
> ext2_dir_entry_2 - the new version of directory entry for ext2fs.
>=20
> I did add the __u32 field to the struct ext2_dir_entry_2 defined in
> ext2_fs.h I also modified the EXT2_DIR_REC_LEN macro to:
>=20
> (((name_len) + 12 + EXT2_DIR_ROUND) & ~EXT2_DIR_ROUND)
>=20
> (+12 instead of +8) to incorporate newly added 4 bytes field.
>=20
> I made the similar changes to the mke2fs utility also.

This means your filesystem will not be mountable by any other version of
Linux.  What is more important is why you want to do this - there are
other mechanisms that may be more appropriate depending on what you are
doing.

Cheers, Andreas
--
Andreas Dilger
Principal Software Engineer
Cluster File Systems, Inc.


--MzdA25v054BPvyZa
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iD8DBQFCUcsmpIg59Q01vtYRAio5AKDGTLyNL3tPbEesv2DyLvX+m2DMvwCfYFc7
Lyj0280/hvTSgOPYMYtRhzA=
=7emj
-----END PGP SIGNATURE-----

--MzdA25v054BPvyZa--
