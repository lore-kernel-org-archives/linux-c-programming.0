From: "Awasthi, Atul" <atul.awasthi@siemens.com>
Subject: RE: GDB - remote debuging
Date: Wed, 12 Oct 2005 13:26:50 +0200
Message-ID: <9C04C4589B6701468A7F8AFAFA432DC42FAB53@BRU0038A.ww018.siemens.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-class: urn:content-classes:message
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

 You have to start the debugging server on the specific port on the
embedded system first,
And then you can connect to that specific port.
:( I hope this can solve something.


-----Original Message-----
From: linux-c-programming-owner@vger.kernel.org
[mailto:linux-c-programming-owner@vger.kernel.org] On Behalf Of
Ronaldo.Afonso@cyclades.com
Sent: maandag 10 oktober 2005 21:22
To: linux-c-programming@vger.kernel.org
Subject: GDB - remote debuging





Hello all,

I'm trying to debug a embedded system with remote gdb feature and in the
client gdb, when I'm connecting to the gdbserver, I just receive the
following message:

(gdb) target remote /dev/ttyS0

Remote debugging using /dev/ttyS0
Couldn't establish connection to remote target
Remote sent bad register number 40: 30012e68;
Packet: 'T0501:7ffffd40;40:30012e68;'

Does anybody know what it is?
Thanks.

Ronaldo Z. Afonso
Projetista de Software
Cyclades Brasil
ronaldo.afonso@cyclades.com.br

Phone: 55 11 5033-3361
Fax: 55 11 5033-3388
www.cyclades.com.br

-
To unsubscribe from this list: send the line "unsubscribe
linux-c-programming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
