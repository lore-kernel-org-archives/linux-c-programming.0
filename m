From: Massimiliano Cialdi <cialdi@firenze.net>
Subject: string initialization
Date: Wed, 24 Mar 2004 12:25:09 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20040324122509.00007458.cialdi@firenze.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming <linux-c-programming@vger.kernel.org>

I want to initialize staticly a string like this:
"abc\0defg\0hi\0"

if I define:
char *str[] = {
"abc",
"defg",
"hi" };

can I be sure that the 3 strings are placed consecutively? 
In this way I declase an array of strings. There is another way to avoid
this?

thanks

-- 
Massimiliano Cialdi
cialdi@firenze.net
m.cialdi@oksys.it
