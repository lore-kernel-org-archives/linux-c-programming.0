From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: Value to subtract from ESP register?
Date: Wed, 24 Mar 2004 21:37:49 +0000
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <16481.65453.455973.759404@cerise.nosuchdomain.co.uk>
References: <4061B5C4.7040907@easynet.ro>
	<001601c411c4$f6b02e20$8b1705d5@carlos>
	<4061E409.30602@easynet.ro>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <4061E409.30602@easynet.ro>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org


zavandi wrote:

> Anyway, about my specific example, how subtracting 24 instead of 4 is 
> gonna optimize anything?

In most cases, gcc rounds the size up to keep the stack pointer
aligned to a 16-byte boundary. If you were to generate functions for
1-byte, 2-byte, 3-byte etc arrays you would note that for arrays of
1-16 bytes (with certain exceptions; see below), it subtracts 24; for
17-32 bytes, it subtracts 40; for 33-48 bytes, it subtracts 56, etc
(the pushed EIP and EBP account for the other 8 bytes). This is
consistent with the fact that the i386 architecture caches data in
aligned 16-byte blocks (sometimes referred to as "paragraphs").

However, it treats sizes of 1, 2, 4 and 8 bytes as special cases,
allocating 4 bytes for the first three cases and 8 bytes for the last. 
Again, this very much looks like something which would be done for
optimisation reasons.

If you need to know the specific reasons, you would probably have to
ask the people who actually wrote the code. And even they might not
actually know why. Optimisation tends to involve dealing with opposing
pressures. Any particular technique will speed up some programs but
slow down others; the optimal approach can often only be determined by
trial and error. If a certain combination tends to make code run
slightly faster, it may be adopted without anyone actually analysing
it in detail.

-- 
Glynn Clements <glynn.clements@virgin.net>
