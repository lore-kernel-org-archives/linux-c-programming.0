From: Steve Graegert <graegerts@gmail.com>
Subject: Re: Any pointer to Byte Alignment & Structure Padding?
Date: Fri, 5 Aug 2005 09:09:13 +0200
Message-ID: <6a00c8d505080500092364df97@mail.gmail.com>
References: <014001c5968e$4e30ca70$9900a8c0@ispl091>
	 <6eee1c40508010514517b5b90@mail.gmail.com>
	 <6eee1c405080105164cfbbaaa@mail.gmail.com>
	 <673ac06405080402432d0feda3@mail.gmail.com>
	 <6eee1c40508040823165f1df7@mail.gmail.com>
	 <00c001c59974$32b0c9b0$9900a8c0@ispl091>
	 <6a00c8d50508042332245283db@mail.gmail.com>
	 <013901c59989$ed3d6440$9900a8c0@ispl091>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <013901c59989$ed3d6440$9900a8c0@ispl091>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Amit Dang <amit_dang@intersolutions.stpn.soft.net>
Cc: linux-c-programming <linux-c-programming@vger.kernel.org>

On 8/5/05, Amit Dang <amit_dang@intersolutions.stpn.soft.net> wrote:
> Hi Steve,
>    Thanks for your prompt response and the valuable information. But I
> tried following on Linux 32-bit gcc 2.96
> struct temp {
>    long long i;
>    char c;
> } and sizeof(struct temp) gave 12 not 16.

Hmm, I have no access to a 32-bit machine right now, but I am running
GCC 3.4.2 on SPARC and sizeof(temp) gives 16 as expected.

One thing a could think of is that on 32-bit machines it makes no
sense to pad to 16 bytes since the natural word size (size of internal
registers) is 4 bytes resulting in an unnecessary read operation to
fetch the rest of the structure that is useless anyway.

Regards

	\Steve

PS: I am going to investigate this issue when I return to my lab and
will mail you the results privately if you don't mind.

--

Steve Graegert <graegerts@gmail.com>
Software Consultancy {C/C++ && Java && .NET}
Mobile: +49 (176)  21248869
Office: +49 (9131) 7126409
