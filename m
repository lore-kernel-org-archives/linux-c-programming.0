From: "Ranga Reddy M - CTD ,Chennai." <rangareddym@ctd.hcltech.com>
Subject: RE: question on socket connection
Date: Mon, 26 May 2003 12:26:23 +0530
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <EF836A380096D511AD9000B0D021B527013AD1D4@narmada.techmas.hcltech.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Glynn Clements <glynn.clements@virgin.net>, "Lejanson C. Go" <lejanson@ntsp.nec.co.jp>
Cc: linux-c-programming <linux-c-programming@vger.kernel.org>



If the socket is non-blocking mode, I mean if MSG_DONTWAIT send/recv of
flag is set....
If , the other end is no proper socket closing is done (system crash or
power down).
Then how to find the socket connection....?????


-----Original Message-----
From: Glynn Clements [mailto:glynn.clements@virgin.net]
Sent: Monday, May 26, 2003 11:28 AM
To: Lejanson C. Go
Cc: linux-c-programming
Subject: Re: question on socket connection



Lejanson C. Go wrote:

> how do you check if the socket has been disconnected?

Try reading from it; if read/recv return zero bytes, it's closed.

-- 
Glynn Clements <glynn.clements@virgin.net>
-
To unsubscribe from this list: send the line "unsubscribe
linux-c-programming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
