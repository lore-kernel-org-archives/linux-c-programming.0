From: Alina Valea <avalea@home.ro>
Subject: extern storage class & multiple declaration
Date: 22 Aug 2002 07:52:34 -0000
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20020822075234.20104.qmail@relay1.home.ro>
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org



Hello everybody,

Suppose we have:

---------------------------------------- file.h

extern int i; ----------------------------------------

and ---------------------------------------- file.c

#include "file.h"

int i; ...

/* No actual use of i here */
------------------------------------------

----------------------------------------- another_file.c

#include "file.h"

void func() {

i=3; }

-----------------------------------------

I know this is entirely correct, but is it an acceptable
programming habit?

Thank you, Alina


----

Home, no matter how far...
http://www.home.ro
