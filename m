From: Mehran Rezaei <mehran@cs.unt.edu>
Subject: Re: value assignment
Date: Tue, 10 Sep 2002 08:29:19 +0000
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <3D7DAD5F.1E822F2C@cs.unt.edu>
References: <20020910235856.25bd3fd3.codex@telkom.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Codex <codex@telkom.net>
Cc: Linux-C-Programming <linux-c-programming@vger.kernel.org>

Codex wrote:

> pterm.iflag &= ~(IGNBRK | INLCR)
>
> what the hell is '&=' and '~(...)', what does '(...)' does anyway..?,
> wasn't '|' means OR..?

>

Good morning,

So, they are all bitwise operations. & is bitwise AND, | is OR, ~ one's complement.
Do you know what happens when you say i*=5 (i=i*5), the same thing when you say i&=5
(i=i&5).
Say i is 15 then i&=5  is 001111 & 000101 = 000101. ~ is a little bit more
complecated, that is when the size of your variable is important. If i is an integer
(of course the size of i depends on your system, but generally say 32 bits) then ~i
(when i is 15) will be
~0000000000001111=1111111111110000=fff0 Hex.
So long,

Mehran

