From: "Luiz Fernando N. Capitulino" <lcapitulino@terra.com.br>
Subject: Re: various doubts ......
Date: Mon, 9 Aug 2004 20:50:56 -0300
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20040809205056.0ac6d2cb.lcapitulino@terra.com.br>
References: <4117B259.1090500@sancharnet.in>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <4117B259.1090500@sancharnet.in>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: gracecott@sancharnet.in
Cc: linux-c-programming@vger.kernel.org


 Hi Joy,

Em Mon, 09 Aug 2004 22:50:25 +0530
joy <gracecott@sancharnet.in> screveu:

| Hello,
| I  have a few , though unconnected doubts.
| 
| 1) can a named pipe be locked using normal lockf()  or do I have to 
| perform some voodoo?

 I think is possible, but take a look at fcntl(2).

| 2) I need to transfer data (protocol not an issue, just raw data) from a 
| usb peripheral(not HDD)
|     to the host comp. can I do this without writing a usb driver myself, 
| i.e , using some generic or user-space driver (like ppdev)
|     the peripheral is a texas instruments tusb246b hub.

 If I've understand what you mean: maybe. The question is: there is any driver
for that hub in the kernel ?

 As far as I read, in ppdev you do have two things. First, there is the
/dev/lp0, which is the _printer_ driver; second, there is the /dev/parport0,
the _parallel port_ driver.

 You can write a user-space driver for you printer, because the kernel
already give you a way (driver) to acesses the parallel port, through
/dev/parport0.

 There is this kind of thing for your USB device ?

 hope this helps,

PS: Don't know nothing about printers, so I may be wrong.

-- 
Luiz Fernando
