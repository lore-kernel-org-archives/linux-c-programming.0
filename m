From: "Charlie Gordon" <gmane@chqrlie.org>
Subject: Re: complex variable
Date: Mon, 13 Sep 2004 21:32:06 +0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <ci4sid$kgu$1@sea.gmane.org>
References: <E3E30069B061524E90BCEE4417E30661138525@monm207.monmouth.army.mil> <chml6d$kri$1@sea.gmane.org> <20040908120658.GZ6985@lug-owl.de> <chnv2v$j6n$1@sea.gmane.org> <20040910200519.GJ19967@lug-owl.de>
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

"Jan-Benedict Glaw" <jbglaw@lug-owl.de> wrote in message
news:20040910200519.GJ19967@lug-owl.de...

> Right, too. Here's how it ought to work:

-----------------------------------------------------------
#include <complex.h>
#include <stdio.h>
#include <stdlib.h>

int
main (int argc, char *argv[])
{
 complex co;

 co = 1.3 + I * 2.9;
 printf ("%lf %lf\n", creal (co), cimag (co));

 return EXIT_SUCCESS;
}
-----------------------------------------------------------

> So you basically use creal() and cimag() to access the two numbers.

Well it is still too vague :
- what is the floating type of complex variable co ?
- You did not specify float, double or long double, so what is the default ?
- Reading tens of pages from C99 leaves that question open (!)
- The creal and cimag macros apply to all 3 complex types.
- if it is float, then real and imaginary parts will be converted to double
when passed to printf.
- If it is long double, they will be passed as such, but the format
specifier will be incorrect.
- Why do you use %lf ? %lf means double in fscanf, it is meaningless in
printf.
- If you meant long double, you should specify %Lf.

Consequently, I think it should read:

double complex co; ...
printf ("%f %f\n", creal(co), cimag(co));

or

complex co;
printf ("%f %f\n", (double)creal(co), (double)cimag(co));

just to be safe.

C is not very user friendly for floating point stuff.  A lot of confusion
arises from historical lack of consistency in the libraries.  A lot of
newbie C programmers will naturally use the float type instead of double.
Yet it is both less precise than even 32 bit ints, less efficient because of
the extra conversions, and slower on today's processors...  Aside from hard
core SIMD and 3D afficionados, that will hand code their stuff in assembly,
'float' is pretty much obsolete.

Chqrlie.

PS: I have always hated floating point stuff ;-)



