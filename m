From: ronkhu <ronkhu@ntsp.nec.co.jp>
Subject: Re: question on socket connection
Date: Mon, 26 May 2003 15:33:51 +0800
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <3ED1C35F.2060100@hq.ntsp.nec.co.jp>
References: <EF836A380096D511AD9000B0D021B527013AD1D4@narmada.techmas.hcltech.com>
Reply-To: ronkhu@ntsp.nec.co.jp
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-c-programming <linux-c-programming@vger.kernel.org>

i think
recv() would still return 0 if the remote side of the socket connection 
has disconnected...

if ur using MSG_DONTWAIT... -1 will be returned if there is no data to 
be read...(as well as EGAIN)....
thus, making it possible to differentiate from "no data" from 
"disconnection event"






Ranga Reddy M - CTD ,Chennai. wrote:

>If the socket is non-blocking mode, I mean if MSG_DONTWAIT send/recv of
>flag is set....
>If , the other end is no proper socket closing is done (system crash or
>power down).
>Then how to find the socket connection....?????
>
>
>-----Original Message-----
>From: Glynn Clements [mailto:glynn.clements@virgin.net]
>Sent: Monday, May 26, 2003 11:28 AM
>To: Lejanson C. Go
>Cc: linux-c-programming
>Subject: Re: question on socket connection
>
>
>
>Lejanson C. Go wrote:
>
>  
>
>>how do you check if the socket has been disconnected?
>>    
>>
>
>Try reading from it; if read/recv return zero bytes, it's closed.
>
>  
>



