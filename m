From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: variable length function
Date: Wed, 15 Jun 2005 12:33:24 +0100
Message-ID: <17072.4612.493709.339833@gargle.gargle.HOWL>
References: <6a00c8d50506142333197a5b0@mail.gmail.com>
	<20050615083610.15622.qmail@web52909.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20050615083610.15622.qmail@web52909.mail.yahoo.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ankit Jain <ankitjain1580@yahoo.com>
Cc: linux-c-programming@vger.kernel.org


Ankit Jain wrote:

> Well then i am just trying to clear my concept again.
> 
> main()
> {
> 
>          printf("This is main");
> 
> }
> 
> now this simple function main according to this
> discussion will return a int value.......Am i
> right....

Correct.

> but is it true with any compiler?

It's true for any compiler which supports pre-ANSI C (aka "K&R C"). 
ANSI C requires the return type to be specified.

> another thing........... if it returns a int value and
> we have not returned any value explicitly.........then
> what is the value returned ....as far as i know its a
> non-zero value. but then what will that mean.....?

It's an unspecified value. It could be any "int" value, including
zero. As there is only one zero but many more non-zero values, it
probably won't be zero, but it isn't guaranteed.

Hopefully the compiler will issue a warning in this situation.

-- 
Glynn Clements <glynn@gclements.plus.com>
