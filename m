From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: What means "\xc7\x44\x24\x18\xda\xff\xff\xff\xe8" ?
Date: Wed, 5 Apr 2006 05:03:51 +0100
Message-ID: <17459.16807.734975.510348@cerise.gclements.plus.com>
References: <6ff3e7140604042030v7c3aee9epec79c398c3d256d0@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <6ff3e7140604042030v7c3aee9epec79c398c3d256d0@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: openbsd shen <openbsd.shen@gmail.com>
Cc: linux-c-programming <linux-c-programming@vger.kernel.org>


openbsd shen wrote:

> In a get_sct() function, it have some lines:
> 
> pt = (char *) memmem(p+7, SCLEN-(p-code)-7,
> "\xc7\x44\x24\x18\xda\xff\xff\xff\xe8", 9);
> if (!pt)
>      return 0;
> 
> 
> when run here, it always return 0, so I want to know what means the
> "\xc7\x44\x24\x18\xda\xff\xff\xff\xe8" ?

It's just the string of bytes being searched for, specified as a C
string literal using hexadecimal codes.

-- 
Glynn Clements <glynn@gclements.plus.com>
