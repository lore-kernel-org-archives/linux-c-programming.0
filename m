From: Andreas Dilger <adilger@clusterfs.com>
Subject: Re: Adding a field to ext2_dir_entry_2
Date: Mon, 4 Apr 2005 19:12:51 -0600
Message-ID: <20050405011251.GP1753@schnapps.adilger.int>
References: <20050405000857.0C26B8AEAC@xprdmailfe2.nwk.excite.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="8tUgZ4IE8L4vmMyh"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20050405000857.0C26B8AEAC@xprdmailfe2.nwk.excite.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
To: Vineet Joglekar <vintya@excite.com>
Cc: linux-kernel@vger.kernel.org, linux-c-programming@vger.kernel.org


--8tUgZ4IE8L4vmMyh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Apr 04, 2005  20:08 -0400, Vineet Joglekar wrote:
> I have created another file system - copied everything from ext2,
> renaming it as some different file system and doing some experiments on t=
hat.
>=20
> Let me be more clear about what I am trying to do. In my masters
> project, I am encrypting inodes along with the data part of the file. Keys
> of different users are different. In the same directory, if there are
> 2 files stored by different users, their inodes will be encrypted with
> different keys. If user1 is doing "ls" on that directory, the inode
> of the other file - which is encrypted by user2, will be decrypted by
> using user1's key, resulting into garbage. To avoid this, I am trying
> to store the uid in the directry entry, so that  I can match it with
> current->fsuid and skip decrypting the inode if the file doesn't belong
> to the current user. (assuming user1 doesnt want to share that file and
> different users can store different files under same directory.)

This is broken by design.  What happens if you chown a file?  The UID will
change in the inode, but nothing will be updated in the directory.  This
key must be stored in the inode along with the ownership info (it can be
an EA, and possibly a fast EA or fixed inode field in a large inode).

Cheers, Andreas
--
Andreas Dilger
Principal Software Engineer
Cluster File Systems, Inc.


--8tUgZ4IE8L4vmMyh
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iD8DBQFCUeYTpIg59Q01vtYRAufDAJoDA4DDYZh98nqOK11zwPYOlrQ78ACgtRNP
lBSAEMsQnhCIRVnh0VzIh/U=
=yMaO
-----END PGP SIGNATURE-----

--8tUgZ4IE8L4vmMyh--
