From: Steve Graegert <graegerts@gmail.com>
Subject: Re: Question about the syncookie_secret[] in syncookies.c
Date: Tue, 17 Jan 2006 15:24:34 +0100
Message-ID: <6a00c8d50601170624j1861e66esb7617559fd52a356@mail.gmail.com>
References: <6ff3e7140601170610m1452cb49v@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <6ff3e7140601170610m1452cb49v@mail.gmail.com>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming <linux-c-programming@vger.kernel.org>

On 1/17/06, openbsd shen <openbsd.shen@gmail.com> wrote:
> In /usr/src/linux/net/ipv4/syncookies.c, there are 2 lines:
>
> static __u32 syncookie_secret[2][16-3+SHA_DIGEST_WORDS];
> #define SHA_DIGEST_WORDS 5
>
> As we know 16-3+5 = 18, why not use syncookie_secret[2][18] directly ?

Because it is good practice to define constants, which are used in
multiple places, only once (here: SHA_DIGEST_WORDS is defined in
<linux/cryptohash.h>) .  It eases maintenance of code significantly.

	\Steve

--

Steve Graegert <graegerts@gmail.com>
Software Consultant {C/C++ && Java && .NET}
Office: +49 9131 7123988
Mobile: +49 1520 9289212
