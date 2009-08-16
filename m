From: LDB <thesource@ldb-jab.org>
Subject: Re: mmap() returns with -EINVAL
Date: Sun, 16 Aug 2009 10:47:56 -0400
Message-ID: <4A881C1C.9010301@master.ldb-jab.org>
References: <c93f91ee0907300619q2dc38f49q1092b363ed28687@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ldb-jab.org; h=
	content-transfer-encoding:content-type:in-reply-to:references
	:subject:mime-version:user-agent:from:date:message-id:received
	:received:x-virus-scanned; s=200904; t=1250434077; x=1252248477;
	 bh=7z2rWIuiB9szSTYrAkxeNGd26cyTgP9tuaTx9aQBzVs=; b=sd5iyS5dfxNb
	laFoncr5AN5QtAQSUM6CVUKvq5tCoSbDx/Zo+YoNc1/ynfFHyYZSNThoZpwdm5b0
	iYhjT9XjvSBh7l74cS4AzjLItV8RiqGeFILbDfXN8nduWB8dnS7T7WA7LzloNIUf
	Z9rS1xcpRN6Rp8Zc4mnZBuuJnSiErCk=
In-Reply-To: <c93f91ee0907300619q2dc38f49q1092b363ed28687@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: leo mueller <llug.dan@googlemail.com>
Cc: linux-c-programming@vger.kernel.org

leo mueller wrote:
> hi all,
> 
> in my attached code snippet i try to mmap the incoming socket data
> accoring to the kernel documentation
> which can also be found online:
> http://lxr.linux.no/linux+v2.6.30/Documentation/networking/packet_mmap.txt
> 
> by doing a mmap() my program exits with -EINVAL and up to now i have
> no clue why... parametes should be right.
> 
> do you have any idea?
> 
> big thanks,
> daniel
> 

It has to be one of the reason below:


   EINVAL We don't like addr, length, or offset (e.g., they are too large, or
not aligned on a page boundary).

   EINVAL (since Linux 2.6.12) length was 0.

   EINVAL flags contained neither MAP_PRIVATE or MAP_SHARED, or contained both
of these values.



Also, according to the man pages under the BUGS section:


   SUSv3 specifies that mmap() should fail if length is 0.
   However, in kernels  before 2.6.12, mmap() succeeded in this case: no
   mapping was created and the call returned addr.  Since kernel 2.6.12,
   mmap() fails with the error EINVAL for this case.

Lastly, since mmap() has been superseded by mmap2(), you might want to
try the latter.



