From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: array size 1 ? 	All headers
Date: Wed, 21 Jul 2004 04:38:36 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <16637.58684.304898.540687@cerise.nosuchdomain.co.uk>
References: <20040721015338.M80608@sni.ph>
	<20040720235713.4cb83b20.lcapitulino@terra.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20040720235713.4cb83b20.lcapitulino@terra.com.br>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Luiz Fernando N. Capitulino" <lcapitulino@terra.com.br>
Cc: Gre Taguran <gtaguran@sni.ph>, linux-c-programming@vger.kernel.org


Luiz Fernando N. Capitulino wrote:

>  The program:
> 
>  char tst[1];
>  tst[0]='g';
>  tst[1]='r';
> 
>  printf("%c %c\n", tst[0], tst[1]);
> 
>  compiles and works here! but to be honest, I don't why.

The above code writes beyond the bounds of the array. It works because
the space which you are overwriting doesn't happen to be used for
anything. C doesn't perform bounds checking on array accesses.

In all probability, the compiler aligns the array to a 32-bit (4-byte)
boundary, so there are three unused bytes after the array. If you
wrote to tst[4], you would typically overwrite the saved frame pointer
(you would get away with this in a trivial test program, but not in a
real program). If you wrote to tst[8], you would typically overwrite
the return address, which would result in an exception.

If you write outside of an array's bounds, the result is "undefined". 
It might work, it might crash, it might do just about anything.

-- 
Glynn Clements <glynn.clements@virgin.net>
