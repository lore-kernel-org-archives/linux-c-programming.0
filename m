From: Massimiliano Cialdi <cialdi@firenze.net>
Subject: bitfield array
Date: Mon, 12 Jan 2004 11:10:16 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20040112111016.000072cf.cialdi@firenze.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming <linux-c-programming@vger.kernel.org>

Is it possible to declare a bitfield array?
I tried with

typedef struct
{
  u8_t busy[10]:1;
}dummy;

but I obtain an error:
error: bit-field `busy' has invalid type

I also tried with

typedef struct
{
  u8_t busy:1;
}dummy;
dummy a[10];

but then a is as large as 10 bytes.

thanks

-- 
Massimiliano Cialdi
cialdi@firenze.net
m.cialdi@oksys.it
