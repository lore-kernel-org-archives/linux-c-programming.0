From: "Steve Graegert" <graegerts@gmail.com>
Subject: Re: Undefined reference to 'fmod'
Date: Sun, 11 Jun 2006 09:17:46 +0200
Message-ID: <6a00c8d50606110017nc1d3aedk4e6616d64b0b1f35@mail.gmail.com>
References: <448B9DA5.7050708@colannino.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <448B9DA5.7050708@colannino.org>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: James Colannino <james@colannino.org>
Cc: linux-c-programming <linux-c-programming@vger.kernel.org>

On 6/11/06, James Colannino <james@colannino.org> wrote:
> Hey everyone.  I included the math.h header, proceeded to use fmod(),
> then got the following error:
>
> /tmp/ccKQxpJi.o: In function `main':
> 04-03-calc.c:(.text+0x144): undefined reference to `fmod'
> collect2: ld returned 1 exit status
>
> Does anybody know why it won't link?  fmod() is a part of the standard
> library.

Use the -lm switch to link against libm.a (the math library).

	\Steve
