From: Adam Dyga <adeon@tlen.pl>
Subject: AC_PROG_LIBTOOL
Date: Thu, 14 Oct 2004 21:42:14 +0000
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <200410142142.14206.adeon@tlen.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org


Hi again,

Here my another question about automake:
I create shared library, so I had to put AC_PROG_LIBTOOL macro call in 
configure.in.
The result is that configure script makes me some strange and unnecessary (at 
least for me ;) ) checks then, e.g:

checking for g77... no
checking for f77... no
checking for xlf... no
checking for frt... no
checking for pgf77... no
[...]
checking whether we are using the GNU Fortran 77 compiler... no

Why does it check for fortran compiler if I'm using C++ only?
Can those checks be turned off ?

Greets
Adam

