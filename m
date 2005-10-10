From: Ronaldo.Afonso@cyclades.com
Subject: GDB - remote debuging
Date: Mon, 10 Oct 2005 17:21:53 -0200
Message-ID: <OF19D28C0B.1DDD8999-ON83257096.0069E195-83257096.006A5FFA@Cyclades.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org





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

