From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: Unicode and cygwin
Date: Tue, 27 Aug 2002 15:27:55 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <15723.35947.400788.286143@cerise.nosuchdomain.co.uk>
References: <Pine.WNT.4.44.0208271619340.104-100000@uma.aztec.soft>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <Pine.WNT.4.44.0208271619340.104-100000@uma.aztec.soft>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Uma Shankar Kayarohanam <umas@aztec.soft.net>
Cc: linux-c-programming@vger.kernel.org


Uma Shankar Kayarohanam wrote:

> I'm writing a portable application that has support for Unicode.
> For this I'm using Cygwin on Windows.
> Can anybody give me pointers on how to go about it?
> 
> This code snipet doesn't seem to work on Cygwin/Windows NT but works fine on
> Linux. On Windows only the first character gets printed. Also the size of
> wchar_t on Windows is reported as 2 bytes whereas on Linux its reported to be
> 4 bytes.
> 
> #include <stdlib.h>
> #include <stdio.h>
> 
> int main()
> {
>     cont wchar_t* str = L"Hello World";
>     wprintf(L"String - %s\n", str);
>     return 0;
> }

If "str" is a wide string, you should be using "%ls", not "%s". "%s"
implies a multi-byte encoded string, not a wide string.

Also, stdout must not be byte oriented at the point that wprintf() is
called (i.e. it must be either wide-character oriented or unoriented).

The difference in the size of wchar_t is normal; most Unix systems use
32 bits for wchar_t, Windows uses 16 bits.

-- 
Glynn Clements <glynn.clements@virgin.net>
