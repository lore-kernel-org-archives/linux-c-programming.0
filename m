From: "Charlie Gordon" <gmane@chqrlie.org>
Subject: Re: value computed is not used ??
Date: Tue, 1 Jun 2004 09:30:57 +0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <c9hb7s$3o1$1@sea.gmane.org>
References: <20040531193810.GE31833@opaque> <Pine.LNX.4.21.0406010333220.1813-100000@hestia>
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

Let's do code review :

> #include <stdio.h>
>
> int main(void) {
this is not a the correct propotype for main.

>  char *ptr = NULL;
this initialization is useless.

>  char str[] = "whats up";
what a horrible thing to write : this effectively defines an automatic
char array that gets initialized by copying the string "what's up".
while this is fine for global data, it is very inefficient for automatic
variables.
a better way would be:
const char *str = "whats up";
const char *ptr;

>
>  for(ptr = str; *ptr; *ptr++) {
*ptr++ is causing the warning "value computed not used"
ptr++ suffices.

>   printf("%c", *ptr);
for completeness, let it be known that some snoddy compilers will complain
that the result of printf is not used.
why not write:
putchar(*ptr);

>  }
>
>  printf("\n");
same as above:
putchar('\n');

>  return 0;
> }

rework needed on 7 out of 8 non empty lines.
amazingly, there doesn't seem to be any algorithmic flaw in this simplistic
program.

Hope is helps.

Chqrlie.




