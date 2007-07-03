From: <cyon.john@wipro.com>
Subject: RE: Using both wchar_t and GCC __attribute__((format(...)))
Date: Tue, 3 Jul 2007 09:33:54 +0530
Message-ID: <8068EA5DFF3D964CB9B957236985862B02B82F0E@BLR-EC-MBX06.wipro.com>
References: <38511efb0707021252r2b995821x9880f11165500184@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-class: urn:content-classes:message
In-Reply-To: <38511efb0707021252r2b995821x9880f11165500184@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: pedrovmm+lists@gmail.com, linux-c-programming@vger.kernel.org

Hi, 

I haven't used this attribute before, but the following is what I feel
after giving it a try now...

> void trace(conn_t *, wchar_t *, ...)
>         __attribute__ ((format(printf, 2, 3)));
> 
> And GCC aborts with:
> 
> "error: format string argument not a string type"

Here, the error is due to the fact that gcc expects the 'string-index'
parameter of format attribute to point to 'const char *' type.

> void trace(conn_t *, wchar_t *, ...)
>         __attribute__ ((format(wprintf, 2, 3)));
> 
> But GCC tells me that:
> 
> "warning: 'wprintf' is an unrecognized format function type"

This error is because, according to gcc-4.2.0 manual it only supports
the following - printf, scanf, strftime or strfmon - for the 'archetype'
parameter offormat attribute.

So I feel we are out of luck unless gcc adds support for 'wprintf' as
archetype for format attribute.

I found a mail loop at gcc-patches mailing list where a patch is
submitted to add this support and its discussion. I am not sure if has
got approved, but you may take a look at it.

Here is the link -
http://gcc.gnu.org/ml/gcc-patches/2001-12/msg01579.html

Hope that will help you.

Regards,
Cyon

