From: "Mariano Moreyra" <moremari@aca.org.ar>
Subject: RE: tcpdump equivalent for the serial port
Date: Fri, 12 Sep 2003 10:50:43 -0300
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <000101c37934$dcd34740$0b04a8c0@aca.org.ar>
References: <3F61CC14.20607@abcpages.com>
Reply-To: <mariano_moreyra@aca.org.ar>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <3F61CC14.20607@abcpages.com>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 'Nicolae Mihalache' <mache@abcpages.com>, linux-c-programming@vger.kernel.org

Hi Nicolae,
I think that what you want to do is not posible just with a software.
You have to build a special cable to do that (somebody tell me if I'm wrong,
or if knows another option)
In my job we have one of those cables because we needed to see what was
going on between two applications that talk to each other via serial port.
The bad thing is that you need a third computer that would be the sniffer.


-----Mensaje original-----
De: linux-c-programming-owner@vger.kernel.org
[mailto:linux-c-programming-owner@vger.kernel.org]En nombre de Nicolae
Mihalache
Enviado el: Viernes, 12 de Septiembre de 2003 10:37
Para: linux-c-programming@vger.kernel.org
Asunto: tcpdump equivalent for the serial port


Hello!

I'm interested if somebody has any ideea how to write a program that is
able to sniff the data passing through a serial port the same way
tcpdump is able to show the data passing through the ethernet cable,
i.e. without disturbing the application that sends/receives the data.
I've seen few programs that basically work as tunnels opening a
pseudo-console where the application connects and writing on the other
side to the serial device. This approach is not very useful because I
want to be able to start/stop my sniffer without interupting the
communication and also the application can control different settings of
the serial port which probably will not be forwarded by the tunnel.

Thanks,
mache

-
To unsubscribe from this list: send the line "unsubscribe
linux-c-programming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

