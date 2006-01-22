From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: wcscat problem
Date: Sun, 22 Jan 2006 10:30:22 +0000
Message-ID: <17363.24254.327246.930171@cerise.gclements.plus.com>
References: <20060119163800.1b45d984.leslie.polzer@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20060119163800.1b45d984.leslie.polzer@gmx.net>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Patrick Leslie Polzer <leslie.polzer@gmx.net>
Cc: linux-c-programming@vger.kernel.org


Patrick Leslie Polzer wrote:

> why does wcscat not work like strcat does?

Because it works on wide characters, not bytes.

> It seems to be leaving the null byte in (C99 source):

Wide character strings don't have a "null byte" they have a null wide
character.

> #define _GNU_SOURCE
> #include <wchar.h>
> 
> 
> int main (int ac, char** av)
> {
>         wchar_t* ws = malloc(8);

If you want a wide string with space for 8 wide characters, you need
8*sizeof(wchar_t), or 32 bytes:

	wchar_t* ws = malloc(8*sizeof(wchar_t));

>         wcscpy(ws, (wchar_t*)"abc");
>         wcscat(ws, (wchar_t*)"def");

This is completely bogus. The expression (wchar_t*)"abc" evaluates to
a pointer to a wide string whose first wide character is either
0x00636261 or 0x61626300 (depending upon endianness), and whose
following wide characters are whatever was in memory after that point. 
The wide string will terminate at the first completely null word,
wherever that occurs.

What you should probably be doing is:

        wcscpy(ws, L"abc");
        wcscat(ws, L"def");

>         printf("%s/%s\n", ws, (void*)ws+4); /* "abc/def" [*] */

Huh? "%s" is for a byte string, not a wide string. You need:

	printf("%ls\n", ws);

> Why is this?  I also noticed the compiler (gcc4) takes "string steps"
> when performing pointer arithmetics with wchar_t pointers, that's why
> I needed to cast to void* in line [*].

I totally don't understand what you are saying here.

-- 
Glynn Clements <glynn@gclements.plus.com>
