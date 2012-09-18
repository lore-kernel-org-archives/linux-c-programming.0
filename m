From: Phil Sutter <phil@nwl.cc>
Subject: Re: Pointer to a char
Date: Tue, 18 Sep 2012 12:29:56 +0200
Message-ID: <20120918102956.GA14000@orbit.nwl.cc>
References: <CAA6iF_7=j6J+wOyYcQgwvSO1dG92kVNcJcYXFY7BiiRZ4d0UKQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAA6iF_7=j6J+wOyYcQgwvSO1dG92kVNcJcYXFY7BiiRZ4d0UKQ@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Randi Botse <nightdecoder@gmail.com>
Cc: linux-c-programming <linux-c-programming@vger.kernel.org>

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

This is because of the two's complement in which singed absolute values
are stored internally. Since %x is a conversion of an integer, signed
extension of the passed char happens, which in two's complement means
that the leading bit is replicated to fill the upper bits. (0xC is 1100
in binary).

> 2. Why pointer to char p copied to j correctly, why not every member
> in p overflow? since it is a signed char.

I am not quite sure about what the question is here (maybe caused by the
lack of verbs in your sentence). Keep in mind that memcpy() only copies
the memory, irrespective of the pointer type passed. Also,
sizeof(unsigned int) == sizeof(int).

HTH, Phil
