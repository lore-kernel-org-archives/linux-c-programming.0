From: Adrian Popescu <adixpope@rdsnet.ro>
Subject: printf format for Float number
Date: Wed, 29 Sep 2004 17:01:16 +0300
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <200409291701.16821.adixpope@rdsnet.ro>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org


Can anyone explain this please ???
(what am I getting wrong and how can I avoid this ?)

I get a roughly output aproximation of a float number
using printf: (f=123.1  to  123.099998)

If I use the format:
%f  i get 123.099998
%g i get 123.1

The printf "FORMAT" says:
%f double-precision floating-point
%g double-precision floating-point, using %f or %e

I read that "float" is promoted to "double" by printf for Format "%f"
If I use "double" instead of "float" it works fine.

gcc version 3.2.2 20030222 (Red Hat Linux 3.2.2-5)

/*----------source---------------*/
#include <stdio.h>

int main() {

float  f=123.1;
double d=123.1;

printf ("%f\n", f);
printf ("%g\n", f);
printf ("%f\n", d);
printf ("%f\n", 123.1);

}
/*--------------------------------*/

<OUTPUT>
123.099998      <---- ?!?!?!
123.1
123.100000
123.100000

Thanx
___
Adrian Popescu



