From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: shared mapping of /dev/zero
Date: Fri, 8 Nov 2002 17:54:41 +0000
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <15819.64097.457887.296919@cerise.nosuchdomain.co.uk>
References: <20021108172415.A22564@natasha.zzz.zzz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20021108172415.A22564@natasha.zzz.zzz>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Denis Zaitsev <zzz@cd-club.ru>
Cc: linux-c-programming@vger.kernel.org


Denis Zaitsev wrote:

> I'm trying to do something like the anonymous mapping of the same
> memory region thru a different virtual addresses.  I.e.:
> 
>     char *a, *b;
>     int z= open("/dev/zero", O_RDWR);
>     a= mmap(NULL, 0x2000, PROT_READ|PROT_WRITE, MAP_SHARED, z,0);
>     b= mmap(a+0x1000, 0x1000, PROT_READ|PROT_WRITE, MAP_SHARED|MAP_FIXED, z,0);
> 
> And what I have as the result, are two mapping as if they was created
> with MAP_ANONYMOUS flag, so they do not share the same space (of file
> desc z, at offset 0), as required.  So, mapping of /dev/zero is just
> the synonum for the anonymous mapping...  Is this the correct
> behaviour, and if so, what is the way to do the trick?

AFAICT, this trick is a BSD-ism; it doesn't work on Linux. If you want
shared memory, you have to use the SysV IPC approach, i.e. shmget(),
shmat() etc.

-- 
Glynn Clements <glynn.clements@virgin.net>
