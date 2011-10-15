From: Mirko Banchi <mk.banchi-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: virtual -->physical --> virtual address
Date: Sat, 15 Oct 2011 19:57:35 +0200
Message-ID: <891A5DF8-FC7F-4B14-9439-7123352847FB@gmail.com>
References: <CAGZFCEHW9Rpk8ZaFbaQPMeA_jOGFnFsnyqXg8QYJs+T+WpxpKw@mail.gmail.com>
Mime-Version: 1.0 (Apple Message framework v1084)
Content-Transfer-Encoding: 8BIT
Return-path: <linux-modules-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=subject:mime-version:content-type:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to:x-pgp-agent
         :x-mailer;
        bh=AhiXAeDJsvgnUKeefToDBz7e4gj1VqrBiteRLo2lGc8=;
        b=vKzY616+01ME5yIRsiztyk1tpgFrNC5z99qHgcB+AnuutUq8u8G1dqQtZikust+yf6
         Bx6xqVvUxNemCMu53IQXs1QY5P/rbCyRwtk9LUn+mfJORKoNm7KOKhH5UCkHna+9kjty
         gbIZSMefzdooMKwQ7q9mXvMa416Uyej0RgkT0=
In-Reply-To: <CAGZFCEHW9Rpk8ZaFbaQPMeA_jOGFnFsnyqXg8QYJs+T+WpxpKw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-modules-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ratheesh kannoth <ratheesh.ksz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-newbie <linux-newbie-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-c-programming-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-modules-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1


Il giorno 15/ott/2011, alle ore 09.01, ratheesh kannoth ha scritto:

> {
> virtual_addr1 =  kmalloc(0x20, GFP_USER);
> phy_addr1 = __pa(virtual_addr1 );
> virtual_addr2 =  ioremap(phy_addr1, 0x20 );
> 
> }
> 
> 
> I noticed that virtual_addr1  is not equal to virtual_addr2.  And if i
> dereference virtual_addr2 ( *virtual_addr2 ),
> kernel crash. What is wrong here ?
> 

Obviously virtual_addr1 and virtual_addr2 are not equals! kmalloc returns a logical address (in fact you can simply calc the relative physical address with macro __pa) and ioremap returns a virtual address in the range [VMALLOC_START - VMALLOC_END]. However usually ioremap is used to deal with iomem and you shouldn't dereference the returned pointer directly: you should use instead ioread{8,16,32} or iowrite{8,16,32} family functions in order to make code portable. However i try to write a simple LKM with your code and i can dereference the pointer returned by ioremap correctly. Can you post some detailed code?

Mirko

- --
Mirko Banchi

e-mail:    mk.banchi-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
id-jabber: mk.banchi-/eSpBmjxGS4dnm+yROfE0A@public.gmane.org

PGP key fingerprint:

308F BFB1 4E67 2522 C88E 
DC69 7631 52ED 32A5 6456



-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (Darwin)

iEYEARECAAYFAk6ZyZAACgkQdjFS7TKlZFaeIACfY5w9Z12jBkIUFvdreBPIQBcC
CasAn1cAjnoWc/743741GREIDOa6zj9I
=nkdk
-----END PGP SIGNATURE-----
