From: "QingHua Wang" <qhwang@ieeta.pt>
Subject: Re: strange segmentation fault in malloc()
Date: Wed, 8 Jan 2003 13:40:31 -0000
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <006101c2b71b$83869330$d0ab88c1@NOTEBOOK>
References: <Pine.LNX.4.33.0301071646230.5493-100000@soochak.ncst.ernet.in><15899.2594.867274.281756@cerise.nosuchdomain.co.uk><012c01c2b6a6$9778d4e0$70ab88c1@ieeta.pt> <15899.29426.273829.766576@cerise.nosuchdomain.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Glynn Clements <glynn.clements@virgin.net>
Cc: linux-c-programming@vger.kernel.org


Thanks. I found the problem by set MALLOC_CHECK_. It's a kind of pointer
corruption in the couple of malloc/free. Thanks again.

qhwang

