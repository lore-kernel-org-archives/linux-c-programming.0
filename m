From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: canonical byte swap macros?
Date: Mon, 11 Jul 2005 20:23:39 +0100
Message-ID: <17106.51003.40109.464025@gargle.gargle.HOWL>
References: <Pine.LNX.4.63.0507102100500.9524@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.63.0507102100500.9524@localhost.localdomain>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Robert P. J. Day" <rpjday@mindspring.com>
Cc: C programming list <linux-c-programming@vger.kernel.org>


Robert P. J. Day wrote:

>   is there a standard set of byte swap macros/functions for doing
> big/little endian conversion?  i have no interest in re-inventing the
> wheel and i'm sure there's a universally-recognized set of macros for
> this, no?

glibc has bswap_{16,32,64} in byteswap.h, but I don't think that they
are specified by any standard.

-- 
Glynn Clements <glynn@gclements.plus.com>
