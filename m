From: <glynn@gclements.plus.com>
Subject: Re: 64 bits integer - ERRATA
Date: Wed, 10 Nov 2004 13:57:24 +0000
Message-ID: <16786.7748.914761.564224@cerise.gclements.plus.com>
References: <41918B88.3060807@ig.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <41918B88.3060807@ig.com.br>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Luciano Moreira - igLnx <lucianolnx@ig.com.br>
Cc: linux-c-programming <linux-c-programming@vger.kernel.org>


Luciano Moreira - igLnx wrote:

> Excuse me, when I say "64 bits", I m assuming that the OS are running 
> under a processor with 32 bits only,  where "long" type ll have only 32 
> bits and "double" could has 64 bits, but it isn't a integer, in other 
> hands, I couldn't convert a double to a text string assuming that it is 
> integer with a function like printf().

As Mikael said, the "long long" type has 64 bits, even on a 32-bit
architecture such as x86.

> Then, retrying the question:
> Does exist a way or some system call or another thing in Linux that 
> allow us to manipulate integer values larger than a system DWORD (long) ?
> Samples:
> - int64, atoi64(), i64toa(), ...
> - int128, atoi128(), i128toa(), ...

strtoull will parse a 64-bit integer, while printf("%lld", ...) will
convert one to a string.

If you want to use integers larger than 64 bits, look into libmp
and/or libgmp.

-- 
Glynn Clements <glynn@gclements.plus.com>
