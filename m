From: Jeff Woods <kazrak+kernel@cesmail.net>
Subject: Re: Question about checksums
Date: Thu, 21 Aug 2003 10:28:46 -0700
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <5.2.1.1.0.20030821100717.032dfb30@no.incoming.mail>
References: <20030821132005.GA8614@lsd.di.uminho.pt>
 <Pine.LNX.4.44.0308211617560.6771-100000@praktifix.dwd.de>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.44.0308211617560.6771-100000@praktifix.dwd.de>
References: <20030821132005.GA8614@lsd.di.uminho.pt>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Holger Kiehl <Holger.Kiehl@dwd.de>
Cc: Luciano Miguel Ferreira Rocha <luciano@lsd.di.uminho.pt>, linux-c-programming@vger.kernel.org

At +0000 04:36 PM 8/21/2003, Holger Kiehl wrote:
>On Thu, 21 Aug 2003, Luciano Miguel Ferreira Rocha wrote:
>>On Thu, Aug 21, 2003 at 12:48:05PM +0000, Holger Kiehl wrote:
[snip]
>>>I think md5sum could do the job but, think it is a bit of an overkill to 
>>>generate a 128 Bit checksum for such small input data. Also storing such 
>>>huge numbers is a bit of a pain. Would a 32 or 64 Bit checksum 
>>>sufficient, or would I be running into problems when these are to short?
>>
>>CRC-32 is normally sufficient. It's designed for data corruption on 
>>transmission, though, but it should be OK as long as you don't expect 
>>people to try and break your code with equal checksums.
>
>I am not trying to make anything more secure. Will a CRC-32 be sufficient 
>to always generate a different sum if a single bit changes within the 
>maximum 5120 Bytes?

In general, X bits of storage can take on 2^X distinct values.  So CRC-32 
can take a maximum of  approximately four billion possible values.  That's 
a number with three commas in US notation; I suppose that's twelve periods 
or spaces on your side of the pond.  A 128 bit value can store 
approximately 64 trillion trillion trillion distinct values. That's a 
number with *twelve* commas.  And a 5120 byte file has 40960 bits so it can 
have roughly 1*10^4096 distinct values.  There will always be the 
possibility for duplicate values when you take a checksum on arbitrary data 
longer then the checksum length.

You have to make a tradeoff of how much risk you're willing to accept for a 
duplicate based on how that would affect you.  A 32 bit checksum has a 
*minimum* of one in 4 billion chance of two files sharing the same 
checksum.  For most non-security applications, that's ample.  The same 
possibility exists with 128 bit md5 checksums (or any other hash) but the 
larger the checksum the less often you'll get duplicate checksums for 
different data (assuming comparable quality hash algorithms).

One way to make such use of checksums fail-safe is to use the checksum as 
proof that files are different but not as proof they are the same.  When 
the checksum matches you don't really know the files are the same unless 
their contents are actually the same and once every four billion times you 
probably can afford to go check if it's really critical to know for certain.

--
Jeff Woods <kazrak+kernel@cesmail.net> 


