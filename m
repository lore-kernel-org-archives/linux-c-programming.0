From: "J." <mailing-lists@xs4all.nl>
Subject: printf format type, precision...
Date: Sat, 3 Jul 2004 00:32:27 +0200 (CEST)
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.21.0407030018090.1619-100000@hestia>
Reply-To: linux-c-programming@vger.kernel.org
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

Saturday, July 03 00:18:09

Hello,

I am trying to convert an IP address to it's eq. in base10
[homework]. However the outcome from the formula listed below isn't giving
me the right results.  Is this because I'm using the wrong precision type
for the `result' variable ? If that's the case what other precision type
should I use instead ? Right now I can't see the format tree's trhu the
precision forrest anmore .. ehum.

#include <stdio.h>

int main(void) {
 int var1 = 192; 
 int var2 = 168;
 int var3 = 1;
 int var4 = 10;
 long int result = 0;

 result = var1 * (256 ^ 3) + var2 * (256 ^ 2) * var3 * 256 + var4; 
 printf("%ld\n", value);

 return 0;
}

Your comments and suggestions will be greatly appreciated..

Thnks..!

J.

