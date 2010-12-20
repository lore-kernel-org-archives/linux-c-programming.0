From: Tim Walberg <twalberg@comcast.net>
Subject: Re: union to get parts of integer
Date: Mon, 20 Dec 2010 09:30:08 -0600
Message-ID: <20101220153008.GH16355@comcast.net>
References: <AANLkTikAB_-kO_cmD5VQRtztx=4V9NDcmU4uWBDE=ON8@mail.gmail.com> <87aak0tsf3.fsf@erwin.mina86.com>
Reply-To: Tim Walberg <twalberg@comcast.net>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <87aak0tsf3.fsf@erwin.mina86.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michal Nazarewicz <mina86@tlen.pl>
Cc: ratheesh k <ratheesh.ksz@gmail.com>, linux-c-programming@vger.kernel.org

It's likely that either the union or direct pointer expressions yield
more efficient code, as they can probably be compiled to direct byte-width
load/store instructions, rather than shifts and logical ands... However,
if the code's not in a critical path for performance, it probably won't
matter. And on some architectures, there may not be byte-width operations,
I guess...



On 12/20/2010 15:44 +0100, Michal Nazarewicz wrote:
>>	
>>	((char *)&i)[0].
>>	
>>	However, are you sure that you need this?  Don't you need "(i & 255)",
>>	"((i >> 8) & 255)", etc. instead?
>>	
>>	-- 
>>	Best regards,                                         _     _
>>	 .o. | Liege of Serenly Enlightened Majesty of      o' \,=./ `o
>>	 ..o | Computer Science,  Michal "mina86" Nazarewicz   (o o)
>>	 ooo +--<mina86-tlen.pl>--<jid:mina86-jabber.org>--ooO--(_)--Ooo--


End of included message



-- 
+----------------------+
| Tim Walberg          |
| 830 Carriage Dr.     |
| Algonquin, IL 60102  |
| twalberg@comcast.net |
+----------------------+
