From: "Mehran Rezaei" <mehran@cs.unt.edu>
Subject: Re: malloc
Date: Mon, 17 Jun 2002 11:47:03 -0500
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <001601c2161e$9b937f40$da247881@ali>
References: <LFEIJFMKHCJIHBFOGINPCEPJCBAA.elapus@ntsp.nec.co.jp>
Reply-To: "Mehran Rezaei" <mehran@cs.unt.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Earl R. Lapus" <elapus@ntsp.nec.co.jp>, linux-c-prog <linux-c-programming@vger.kernel.org>


> hi,
>    I tried doing this:
>        ucp = (unsigned char *) malloc(0);
>    it was successful and returned a valid address. I was kinda hoping
>    it would do something weird...When I looked at the man page It said
>    something like.. "If your application needs to generate empty objects,
>    you may use malloc(0) for this purpose..."
>
>    So my questions are:
>        What do you mean when you say EMPTY OBJECT?
>        Does it ocuppy any memory storage?
Hi there,
Of course it depends on the implementation. However, since Doug Lea'
allocator is the base and everybody else follows his setup here I am writing
about his allocator:
malloc(size_t n)
if "n" is zero, malloc returns a minimum-sized chunk (the minimum size is 16
bytes on most 32 bit machines, and 24 or 32 bytes on 64 bit machines).
From 16 bytes or 32 bytes returned, you do not see the header (2*address
size of machine - 64 bits in case of 32 bit machine). It leaves you 8 bytes
to use.
I believe gnu uses Doug Lea' allocator.
So long,

Mehran

