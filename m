From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Subject: Re: Filesystem as a module?
Date: Sat, 13 Mar 2004 13:07:26 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20040313120726.GO17857@lug-owl.de>
References: <20040312230257.B06123DE6@xprdmailfe11.nwk.excite.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="U2TwCo+MHNvvM16y"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20040312230257.B06123DE6@xprdmailfe11.nwk.excite.com>
List-Id: <linux-c-programming.vger.kernel.org>
To: linux-c-programming@vger.kernel.org


--U2TwCo+MHNvvM16y
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, 2004-03-12 18:02:57 -0500, Vineet Joglekar <vintya@excite.com>
wrote in message <20040312230257.B06123DE6@xprdmailfe11.nwk.excite.com>:
> Hi all,
>=20
> I am trying to add some functionalities to ext2 filesystem, and use it as=
 a module. Till now what I did is:
> 1: Copied the ext2 files and made the approprate changes
> 2: Copied files from usr/src/linux/fs/ directory
> 3: Copied relevant header files in /include/linux directory

Better create another directory below ./linux/fs/ and place your sources
there.

> The module gets compiled properly, but when I try to insert it using insm=
od, I am getting following errors like:
>=20
> my_extv2.o: unresolved symbol generic_file_read_Rsmp_106b3732
> my_extv2.o: unresolved symbol __get_free_pages_Rsmp_4784e424
> my_extv2.o: unresolved symbol try_inc_mod_count_Rsmp_e6105b23
> my_extv2.o: unresolved symbol blk_size_Rsmp_a2e0a082
> my_extv2.o: unresolved symbol pidhash_Rsmp_4439d880
> my_extv2.o: unresolved symbol floppy_eject
> my_extv2.o: unresolved symbol smp_num_siblings

You've mixed up your symbol versioning settings, most probably because
you're not building within the kernel's sources. That should all go away
automatically if you build within the kernel:)

> Whats wrong with my approach or do I need to add / modify few things?

Just copy all the sources back into the kernel tree and you're most
probably done.

MfG, JBG

--=20
   Jan-Benedict Glaw       jbglaw@lug-owl.de    . +49-172-7608481
   "Eine Freie Meinung in  einem Freien Kopf    | Gegen Zensur | Gegen Krieg
    fuer einen Freien Staat voll Freier B=FCrger" | im Internet! |   im Ira=
k!
   ret =3D do_actions((curr | FREE_SPEECH) & ~(NEW_COPYRIGHT_LAW | DRM | TC=
PA));

--U2TwCo+MHNvvM16y
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAUvl+Hb1edYOZ4bsRAi0gAJ4zhPFudrHgIf24JNUiPMVUN9gVwQCcD3B/
Wde0aIDzqenqegBg4a5hOFg=
=ZPuL
-----END PGP SIGNATURE-----

--U2TwCo+MHNvvM16y--
