From: openbsd shen <openbsd.shen@gmail.com>
Subject: Question about the syncookie_secret[] in syncookies.c
Date: Tue, 17 Jan 2006 22:10:48 +0800
Message-ID: <6ff3e7140601170610m1452cb49v@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming <linux-c-programming@vger.kernel.org>

In /usr/src/linux/net/ipv4/syncookies.c, there are 2 lines:

static __u32 syncookie_secret[2][16-3+SHA_DIGEST_WORDS];
#define SHA_DIGEST_WORDS 5

As we know 16-3+5 = 18, why not use syncookie_secret[2][18] directly ?

Thanks
