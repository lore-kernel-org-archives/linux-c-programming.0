From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: question on socket connection
Date: Mon, 26 May 2003 06:57:42 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <16081.44246.444956.250052@cerise.nosuchdomain.co.uk>
References: <3ED175DF.6050503@hq.ntsp.nec.co.jp>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <3ED175DF.6050503@hq.ntsp.nec.co.jp>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Lejanson C. Go" <lejanson@ntsp.nec.co.jp>
Cc: linux-c-programming <linux-c-programming@vger.kernel.org>


Lejanson C. Go wrote:

> how do you check if the socket has been disconnected?

Try reading from it; if read/recv return zero bytes, it's closed.

-- 
Glynn Clements <glynn.clements@virgin.net>
