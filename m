From: Nicolae Mihalache <mache@abcpages.com>
Subject: Re: tcpdump equivalent for the serial port
Date: Fri, 12 Sep 2003 16:01:50 +0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <3F61D1CE.7080404@abcpages.com>
References: <000101c37934$dcd34740$0b04a8c0@aca.org.ar>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <000101c37934$dcd34740$0b04a8c0@aca.org.ar>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: mariano_moreyra@aca.org.ar, linux-c-programming@vger.kernel.org

Mariano Moreyra wrote:

>Hi Nicolae,
>
Hi Mariano!

>I think that what you want to do is not posible just with a software.
>You have to build a special cable to do that (somebody tell me if I'm wrong,
>or if knows another option)
>In my job we have one of those cables because we needed to see what was
>going on between two applications that talk to each other via serial port.
>The bad thing is that you need a third computer that would be the sniffer.
>
The problem is that opening the cable and connecting it to a third port 
may introduce some variations in the signals going over the serial 
cable. This is something that I want to avoid as much as possible. The 
other end of the serial cable is not another computer but a device that 
is itself the subject of development and test so it can not be assumed 
as working nor it can be developed with a non-nominal serial cable 
connected to it. Even worse, my serial link is not RS232 but RS422 which 
has a higher speed and it's more difficult to have break-out capability 
without interferences.
This is why I'm looking for a software solution, i.e. something that 
communicates with the serial driver and gets all the messages that pass 
through it.

Nicolae

