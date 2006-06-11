From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: Undefined reference to 'fmod'
Date: Sun, 11 Jun 2006 08:18:30 +0100
Message-ID: <200606110718.k5B7IUVg022519@cerise.gclements.plus.com>
References: <448B9DA5.7050708@colannino.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <448B9DA5.7050708@colannino.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: James Colannino <james@colannino.org>


James Colannino wrote:

> Hey everyone.  I included the math.h header, proceeded to use fmod(),
> then got the following error:
> 
> /tmp/ccKQxpJi.o: In function `main':
> 04-03-calc.c:(.text+0x144): undefined reference to `fmod'
> collect2: ld returned 1 exit status
> 
> Does anybody know why it won't link?  fmod() is a part of the standard
> library.

No, fmod() is in libm, so you have to add -lm to the link command.

As a general rule, anything which uses <math.h> has to link against
libm.

-- 
Glynn Clements <glynn@gclements.plus.com>
