From: "Charlie Gordon" <gmane@chqrlie.org>
Subject: Re: complex variable
Date: Tue, 14 Sep 2004 10:16:33 +0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <ci69bp$frk$1@sea.gmane.org>
References: <E3E30069B061524E90BCEE4417E30661138525@monm207.monmouth.army.mil> <chml6d$kri$1@sea.gmane.org> <20040908120658.GZ6985@lug-owl.de> <chnv2v$j6n$1@sea.gmane.org> <20040910200519.GJ19967@lug-owl.de> <ci4sid$kgu$1@sea.gmane.org> <20040913215742.GZ19967@lug-owl.de>
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

"Jan-Benedict Glaw" <jbglaw@lug-owl.de> wrote in message
news:20040913215742.GZ19967@lug-owl.de...
>> - The creal and cimag macros apply to all 3 complex types.

> Well, there has been some type-conversion in between :-)
-----------
7.3.9.2 The cimag functions
Sysnopsis
 #include <complex.h>
 double cimag(double complex z);
 float cimagf(float complex z);
 long double cimagl(long double complex z);
-----------

Well the truth is elsewhere ;-)
I have seen this paragraph, but it is a smoke screen, as there are also
creal and cimag *macros* mentioned in C99 that are described as applicable
to all three complex types and extract the corresponding part without
intermediary or final conversion (!)

C99 has created such a mine field around complex numbers and floating point
in general...

Chqrlie.



