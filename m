From: Patrick Leslie Polzer <leslie.polzer@gmx.net>
Subject: Re: Resend: Netlink socket problem
Date: Sun, 8 Jan 2006 13:05:33 +0100
Message-ID: <20060108130533.4cf244af.leslie.polzer@gmx.net>
References: <20060108092505.62484.qmail@web53702.mail.yahoo.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Sun__8_Jan_2006_13_05_33_+0100_tiMiR_NrPL2qCZp."
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20060108092505.62484.qmail@web53702.mail.yahoo.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
To: Mikado <mikado4vn@yahoo.com>
Cc: linux-kernel@vger.kernel.org, linux-c-programming@vger.kernel.org

--Signature=_Sun__8_Jan_2006_13_05_33_+0100_tiMiR_NrPL2qCZp.
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


Hi Mikado,

On Sun, 8 Jan 2006 01:25:05 -0800 (PST)
Mikado <Mikado <mikado4vn@yahoo.com>> wrote:

 | Is there anything wrong in my codes? I think the problem is the
 | netlink_unicast(), because when I didn't call it, everything work well.
Check whether nl_sk equals NULL.
I don't know whether there's an assert() macro available for you, so try th=
is:

/* [...] */
    if (nl_sk =3D=3D NULL)
    {
        printk(KERN_ALERT "nltest: nl_sk is NULL!");
        goto return_free;
    }

    netlink_unicast(nl_sk, nl_skb, pid, 0);
return_free:
    kfree_skb(nl_skb);
}

A gdb backtrace of the user space part won't give you much, since you
found out the problem lies in kernel space.

What does netlink_unicast() do?

Leslie

--=20
gpg --keyserver pgp.mit.edu --recv-keys 0x52D70289

--Signature=_Sun__8_Jan_2006_13_05_33_+0100_tiMiR_NrPL2qCZp.
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2 (GNU/Linux)

iD8DBQFDwQAQn/ep3VLXAokRAlaFAKDAkvHMtO3BeJG///dsMYWq5AzcGACgq5Xz
6f8LevCfKagdybzIaaWfkj8=
=M3ZU
-----END PGP SIGNATURE-----

--Signature=_Sun__8_Jan_2006_13_05_33_+0100_tiMiR_NrPL2qCZp.--
