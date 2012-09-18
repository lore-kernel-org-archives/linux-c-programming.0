From: Duan Fugang-B38611 <B38611@freescale.com>
Subject: RE: Pointer to a char
Date: Tue, 18 Sep 2012 10:33:01 +0000
Message-ID: <9848F2DB572E5649BA045B288BE08FBEF5BD81@039-SN2MPN1-021.039d.mgd.msft.net>
References: <CAA6iF_7=j6J+wOyYcQgwvSO1dG92kVNcJcYXFY7BiiRZ4d0UKQ@mail.gmail.com>
 <20120918102956.GA14000@orbit.nwl.cc>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20120918102956.GA14000@orbit.nwl.cc>
Content-Language: en-US
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
To: Phil Sutter <phil@nwl.cc>, Randi Botse <nightdecoder@gmail.com>
Cc: linux-c-programming <linux-c-programming@vger.kernel.org>

Thanks, Phil,

It is great for the detail explain.


Best Regards,
Andy

-----Original Message-----
From: linux-c-programming-owner@vger.kernel.org [mailto:linux-c-programming-owner@vger.kernel.org] On Behalf Of Phil Sutter
Sent: Tuesday, September 18, 2012 6:30 PM
To: Randi Botse
Cc: linux-c-programming
Subject: Re: Pointer to a char

Hi,

On Tue, Sep 18, 2012 at 04:29:32PM +0700, Randi Botse wrote:
> ...
> char *p;
> unsigned int i = 0xcccccccc;
> unsigned int j;
> 
> p = (char *)  &i;
> printf("%.2x %.2x %.2x %.2x\n", *p, p[1], p[2], p[3]);
> 
> memcpy(&j, p, sizeof(unsigned int));
> printf("%x\n", j);
> ...
> 
> Output:
> 
> ffffffcc ffffffcc ffffffcc ffffffcc
> 0xcccccccc
> 
> 
> My questions are:
> 
> 1. Why it prints "ffffffcc ffffffcc ffffffcc ffffffcc"? (if p is 
> unsigned char* then it will print correctly "cc cc cc cc")

This is because of the two's complement in which singed absolute values are stored internally. Since %x is a conversion of an integer, signed extension of the passed char happens, which in two's complement means that the leading bit is replicated to fill the upper bits. (0xC is 1100 in binary).

> 2. Why pointer to char p copied to j correctly, why not every member 
> in p overflow? since it is a signed char.

I am not quite sure about what the question is here (maybe caused by the lack of verbs in your sentence). Keep in mind that memcpy() only copies the memory, irrespective of the pointer type passed. Also, sizeof(unsigned int) == sizeof(int).

HTH, Phil
--
To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in the body of a message to majordomo@vger.kernel.org More majordomo info at  http://vger.kernel.org/majordomo-info.html


