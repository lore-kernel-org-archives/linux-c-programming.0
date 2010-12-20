From: Michal Nazarewicz <mina86@tlen.pl>
Subject: Re: union to get parts of integer
Date: Mon, 20 Dec 2010 15:44:48 +0100
Message-ID: <87aak0tsf3.fsf@erwin.mina86.com>
References: <AANLkTikAB_-kO_cmD5VQRtztx=4V9NDcmU4uWBDE=ON8@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha1; protocol="application/pgp-signature"
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:sender:from:to:cc:subject
         :in-reply-to:references:user-agent:x-face:face:x-url:x-pgp-fp:x-pgp
         :date:message-id:mime-version:content-type;
        bh=NtOBctq6V+tNYh85JrqV0Lvxy5rcVj8sdNEqF26tVRs=;
        b=Ae2D9n5tZ871VMJ76AdKNlipvCwp/qoBVNOpSu/7/r6xRvpHa14+GyH3anaiQLzcSf
         9Vrj0b2rvjrE6amIFGK2WyKK4UtYntq6mCwDxJRtYsA1Y2TSI/FWaV3serbhfXKaalgC
         gbUn8VGxdzcxbPuuW8oabvCqDWPnGoXjdFD7Y=
In-Reply-To: <AANLkTikAB_-kO_cmD5VQRtztx=4V9NDcmU4uWBDE=ON8@mail.gmail.com>
	(ratheesh k.'s message of "Mon, 20 Dec 2010 16:10:17 +0530")
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
To: ratheesh k <ratheesh.ksz@gmail.com>
Cc: linux-c-programming@vger.kernel.org

--=-=-=
Content-Transfer-Encoding: quoted-printable

ratheesh k <ratheesh.ksz@gmail.com> writes:

> typedef struct {
> char parts[4];
> } node ;
>
> int i=3D0x12345678
>
> ((node *)&i)->parts[0];
> ((node *)&i)->parts[1];
> ((node *)&i)->parts[2];
> ((node *)&i)->parts[3];
>
> Is there any mechanism to split into bytes using the power of union ?

The above should work (assuming of course that sizeof(int) =3D=3D 4).  The
following should work as well:

((char *)&i)[0].

However, are you sure that you need this?  Don't you need "(i & 255)",
"((i >> 8) & 255)", etc. instead?

=2D-=20
Best regards,                                         _     _
 .o. | Liege of Serenly Enlightened Majesty of      o' \,=3D./ `o
 ..o | Computer Science,  Michal "mina86" Nazarewicz   (o o)
 ooo +--<mina86-tlen.pl>--<jid:mina86-jabber.org>--ooO--(_)--Ooo--

--=-=-=
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.14 (GNU/Linux)

iEYEARECAAYFAk0Pa+UACgkQUyzLALfG3x4gSQCgigTfNVLK+BRVoJ7atWT12Q2J
4LwAmwbwmIOOJVqWiTVh2zGpqczjar08
=0kjH
-----END PGP SIGNATURE-----
--=-=-=--
