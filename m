From: ninjaboy <n0b0dyn1nj4@gmail.com>
Subject: Re: offsets of fields in a structure
Date: Fri, 19 Oct 2007 16:30:14 +0000
Message-ID: <a3399010710190930q1a4f7873v3ea8841679b3fb43@mail.gmail.com>
References: <4718CCE2.9060202@infocamere.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        bh=SM910K51pJtD3lgebd4vpayLzGnzGWhLRVOflto4a/A=;
        b=JQUVUvTqkveP5Xa8C0tkoBYNIADsff5ExbJevrgRs2BLRDfhRd2/2+Xut+FhoBDpAkpxb6WcRH0+F6LCIH97mUkzT+/b91dkenNVd8JWcAX7IokNsFpPRg+FHw2s8lXBQLQ2HuRPv6kBem1Zl3CPaAkL1kYqBZ+Bouh8dANT3rQ=
In-Reply-To: <4718CCE2.9060202@infocamere.it>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Giulio Rossato <giulio.rossato@infocamere.it>
Cc: linux-c-programming@vger.kernel.org

2007/10/19, Giulio Rossato <giulio.rossato@infocamere.it>:
> Suppose that I define the following structure
> struct astruct {
>     int field1;
>     float field2;
>     char field3[10];
> };
>
> and declare the variable
> struct astruct r;
>
> The amount of memory specified by the structure is not the sum of the
> storage specified by each of its member types. This vary from one
> machine and C compiler to another. On most compuers, objects of certain
> types may not begin anywhere in memory but are constrained to start at
> certain boundaries. For example, an integer of length 4 bytes may have
> to start at an address divisible by 4, and a real number of length 8 may
> have to start at an address divisible by 8. Thus, in my example, if the
> starting address of r is 200, the integer occupies bytes 200 through
> 203, but the real number cannot start at byte 204, since that location
> is not divisible by 8. Thus the real number must start at byte 208.
> The C compiler associates to each member identifier of a structure an
> offset that specifies how far beyond the start of the structure the
> location of that field is. To calculate the location of a member in a
> structure, the offset of the member identifier is added to the base
> address of the structure variable.
> Now the question.
> I want write a function that receives as parameters a start address and
> a "description of a structure" and returns the offsets of the fields.
> The structure is not known at compile time. The offsets should be
> calculated at runtime and the code should be independent of the machine.
> How should be written this function?


maybe typeof() can help you, and use __attribute__((packed)) if you
want the real size of structure, this is an alignament thingie.

-- 
noone is alone.
