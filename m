From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: uint8_t  mean8[8] __attribute__ ((aligned (32))), *mp;
Date: Sat, 27 Nov 2004 03:01:36 +0000
Message-ID: <16807.60944.365508.436275@cerise.gclements.plus.com>
References: <20041126061831.5905.qmail@web52903.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20041126061831.5905.qmail@web52903.mail.yahoo.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ankit Jain <ankitjain1580@yahoo.com>
Cc: linux prg <linux-c-programming@vger.kernel.org>


Ankit Jain wrote:

> if somebody can tell me what attribute is aligned here
> 
>  uint8_t  mean8[8] __attribute__ ((aligned (32))),
> *mp;

The start of the array mean8 will be aligned to a 32-byte boundary.

-- 
Glynn Clements <glynn@gclements.plus.com>
