From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: recv()
Date: Tue, 27 Aug 2002 05:23:56 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <15722.65244.976088.803677@cerise.nosuchdomain.co.uk>
References: <LFEIJFMKHCJIHBFOGINPCEIGCHAA.elapus@ntsp.nec.co.jp>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <LFEIJFMKHCJIHBFOGINPCEIGCHAA.elapus@ntsp.nec.co.jp>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Earl R. Lapus" <elapus@ntsp.nec.co.jp>
Cc: linux-c-prog <linux-c-programming@vger.kernel.org>


Earl R. Lapus wrote:

>      I have a question about recv()...
>      When calling recv() you specify the maximum data
>      size you want to receive, right? So if the actual data
>      sent at the other end is larger... what happens to the
>      rest of the data? Who manages the data? 

It depends upon the protocol. For TCP, subsequent data will be
returned by the next call to recv(); packet boundaries are irrelevant. 
For UDP, the rest of the packet will be discarded, so you need to
ensure that the buffer is large enough to hold an entire packet.

-- 
Glynn Clements <glynn.clements@virgin.net>
