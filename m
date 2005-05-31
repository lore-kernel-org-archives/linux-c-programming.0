From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: decimal constant so large?
Date: Tue, 31 May 2005 14:15:33 +0100
Message-ID: <17052.25461.832292.512017@gargle.gargle.HOWL>
References: <200505281850.57908.a.biardi@tiscali.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <200505281850.57908.a.biardi@tiscali.it>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: a.biardi@tiscali.it
Cc: linux-c-programming@vger.kernel.org


a.biardi@tiscali.it wrote:

> Can anyone tell me why the constant -2147483648,

-2147483648 isn't a constant, it's an expression consisting of the
negation operator "-" applied to the decimal constant "2147483648".

The decimal constant 2147483648 is too large to fit into a signed
32-bit integer, so it is treated as unsigned.

If you want the most negative signed 32-bit integer, you have to write
it as (-2147483647 - 1).

-- 
Glynn Clements <glynn@gclements.plus.com>
