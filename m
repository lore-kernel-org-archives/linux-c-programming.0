From: Uma Shankar Kayarohanam <umas@aztec.soft.net>
Subject: Unicode and cygwin
Date: Tue, 27 Aug 2002 16:25:32 +0530 (India Standard Time)
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <Pine.WNT.4.44.0208271619340.104-100000@uma.aztec.soft>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org


I'm writing a portable application that has support for Unicode.
For this I'm using Cygwin on Windows.
Can anybody give me pointers on how to go about it?

This code snipet doesn't seem to work on Cygwin/Windows NT but works fine on
Linux. On Windows only the first character gets printed. Also the size of
wchar_t on Windows is reported as 2 bytes whereas on Linux its reported to be
4 bytes.

#include <stdlib.h>
#include <stdio.h>

int main()
{
    cont wchar_t* str = L"Hello World";
    wprintf(L"String - %s\n", str);
    return 0;
}

Any suggestions are welcom.

tia

--
A mistake is just another way of doing things.
