From: "Jason P. Winters" <jason@txt.com>
Subject: Re: malloc
Date: Mon, 17 Jun 2002 07:32:06 -0700 (PDT)
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <200206171432.g5HEW7I6028525@grinch.txt.com>
References: <LFEIJFMKHCJIHBFOGINPCEPJCBAA.elapus@ntsp.nec.co.jp>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <LFEIJFMKHCJIHBFOGINPCEPJCBAA.elapus@ntsp.nec.co.jp> from "Earl R. Lapus" at Jun 17, 2002 02:26:27 PM
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Earl R. Lapus" <elapus@ntsp.nec.co.jp>
Cc: linux-c-prog <linux-c-programming@vger.kernel.org>

 
> hi,
>    I tried doing this:
>        ucp = (unsigned char *) malloc(0);

Most malloc() calls have been "fixed" to return at least one byte of
useable memory when passed a 0, as too many people were doing that by
accident and crashing.  (It might be more, like sizeof(int), but I'm
not sure).

   After all, why would you call malloc to get nothing? So it assumes
you want *something* and returns it.

Ciao!

Jason
-- 
|UUCP  jason@txt.com                        Who wills, Can.
|VOICE (408) 243-3425                         Who tries, Does.
|LOCAL Hey, Jason!                              Who loves, Lives.          o_.
|Disclaimer:  Not me! I didn't do *THAT!*                                 <|
|Local Disclaimer:  I'm not here!                   A. McCaffrey           4
