From: "Mehran Rezaei" <mehran@cs.unt.edu>
Subject: Re: mmap() to a specific address
Date: Mon, 1 Jul 2002 14:36:40 -0500
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <000a01c22136$9f59d390$da247881@ali>
References: <20020701220351.A2129@neutrino.particles.org>
Reply-To: "Mehran Rezaei" <mehran@cs.unt.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Elias Athanasopoulos <eathan@otenet.gr>, linux-c-programming@vger.kernel.org

Hello Elias,
You can use MAP_FIXED, and indicate an address. Then the object is mapped in
the address that you wanted.
Following is taken from mmap man page. The first paragraph addresses your
question.

////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////
If MAP_FIXED is set in the flags parameter:

    +  If the requested address is not null, the mmap() function succeeds
       even if the requested address is already part of another region.  (If
       the address is within an existing region, the effect on the pages
       within that region and within the area of the overlap produced by the
       two regions is the same as if they were unmapped.  In other words,
       whatever is mapped between addr and addr + len will be unmapped.)

    +  If the requested address is null and MAP_FIXED is specified, the
       region is placed at the default exact mapping address for the region.
       It places the region at this value exactly, replacing previous map-
       pings if necessary.  The exact mapping address is determined from a
       combination of the flag and protection parameters passed to the
mmap()
       function.
////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////
And here is an example:

void *address=0x4000;
void *test;
test=mmap(address,500,PROT_READ|PROT_WRITE,MAP_FIXED|MAP_PRIVATE,fd,0);

fd should be either a filedes (of existing file) or if you have
MAP_ANONYMOUS coud be "-1". If in your system MAP_ANONYMOUS is not defined
and you want to have unnamed memory region, you can specify it as:
int df = open("/dev/zero",O_RDWR);
Good luck,

Mehran


> Hi all,
>
> Can I force a mmap() to a specific address? As I read in the man page the
> address which is passed in mmap() is only a hint; the kernel will
eventual-
> ly decide in which page the object will be mapped. But, is there any ugly
> hack to accomplish a very specific mmap()?
>
> Elias
>


