From: Steve Graegert <graegerts@gmail.com>
Subject: Re: wcscat problem
Date: Thu, 19 Jan 2006 21:52:01 +0100
Message-ID: <6a00c8d50601191252j326bdef1s9520ede0bfd27f70@mail.gmail.com>
References: <20060119163800.1b45d984.leslie.polzer@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20060119163800.1b45d984.leslie.polzer@gmx.net>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

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

Patrick,

as I've mailed you privately, I was not able to reproduce the results.
 Running your code causes weird output due to (a) wrong qualifiers in
printf (use %S or %ls instead of %s) and (b) wrong initialization of
wide-character strings.  Do not simply cast to wchar_t *, use mbstowcs
instead, which converts a character string to its wide-character
equivalent.  The following code shows, that wcscat works perfectly
well.

BTW: compiling with -Wall, as suggested by Markus, shows, that wcscat
does not like the semantic given in line [+].

--- START OF CODE ---

#define _GNU_SOURCE
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <wchar.h>

int main (int argc, char **argv) {
  wchar_t* ws = malloc(8);
  wchar_t* ws2 = malloc(4);

  /* works */
  mbstowcs(ws, "abc", 4);
  mbstowcs(ws2, "def", 4);
  wcscat(ws, ws2);
  printf("1: %S/%S\n", ws, ws + 4);
  printf("1: %ls/%ls\n", ws, ws + 4);

  /* does not work */
  wcscpy(ws, (wchar_t *)"abc");
  wcscat(ws, (wchar_t *)"def");
  printf("2: %S/%S\n", ws, (void *)ws + 4); /* [+] */

  /* works, of course */
  char* s = malloc(8);
  strcpy(s, "abc");
  strcat(s, "def");
  printf("3: %s/%s\n", s, s + 4);

  return 0;
}

--- END OF CODE ---

	\Steve

--

Steve Graegert <graegerts@gmail.com>
Software Consultant {C/C++ && Java && .NET}
Office: +49 9131 7123988
Mobile: +49 1520 9289212
