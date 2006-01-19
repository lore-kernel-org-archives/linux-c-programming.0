From: Markus Rechberger <mrechberger@gmail.com>
Subject: Re: wcscat problem
Date: Thu, 19 Jan 2006 18:57:57 +0100
Message-ID: <d9def9db0601190957v78b9ca71yaac25a0c7ef43d09@mail.gmail.com>
References: <20060119163800.1b45d984.leslie.polzer@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20060119163800.1b45d984.leslie.polzer@gmx.net>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Patrick Leslie Polzer <leslie.polzer@gmx.net>
Cc: linux-c-programming@vger.kernel.org

Hi,

some headers are missing within your source too.
Try to compile your version with -Wall

it should look like the code attached then it will work.

Markus

#define _GNU_SOURCE
#include <wchar.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>


int main (int ac, char** av)
{
       wchar_t* ws = malloc(8);
       wcscpy(ws, (wchar_t*)"abc");
       wcscat(ws, (wchar_t*)"def");
       printf("%s/%s\n", ws, ws+4); /* "abc/def" [*] */


       char* s = malloc(8);
       strcpy(s, "abc");
       strcat(s, "def");
       printf("%s/%s\n", s, s+4); /* "abcdef/ef" */

       return 0;
}


On 1/19/06, Patrick Leslie Polzer <leslie.polzer@gmx.net> wrote:
>
> Hello list,
>
> why does wcscat not work like strcat does?
> It seems to be leaving the null byte in (C99 source):
>
>
> #define _GNU_SOURCE
> #include <wchar.h>
>
>
> int main (int ac, char** av)
> {
>         wchar_t* ws = malloc(8);
>         wcscpy(ws, (wchar_t*)"abc");
>         wcscat(ws, (wchar_t*)"def");
>         printf("%s/%s\n", ws, (void*)ws+4); /* "abc/def" [*] */
>
>
>         char* s = malloc(8);
>         strcpy(s, "abc");
>         strcat(s, "def");
>         printf("%s/%s\n", s, s+4); /* "abcdef/ef" */
>
>         return 0;
> }
>
> Why is this?  I also noticed the compiler (gcc4) takes "string steps"
> when performing pointer arithmetics with wchar_t pointers, that's why
> I needed to cast to void* in line [*].
>
> Leslie
>
>
> --
> gpg --keyserver pgp.mit.edu --recv-keys 0x52D70289
>
>
>


--
Markus Rechberger
