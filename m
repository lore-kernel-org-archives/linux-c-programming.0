From: "Huber, George K RDECOM CERDEC STCD SRI" <George.K.Huber@us.army.mil>
Subject: RE: tcp reset
Date: Thu, 17 Mar 2005 17:05:33 -0500
Message-ID: <D2AA47A6FB2C1A48AF0526440C0F245CAA366D@monm207.nae.ds.army.mil>
Mime-Version: 1.0
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: 'r_zaca ' <r_zaca@ig.com.br>, "'linux-c-programming@vger.kernel.org '" <linux-c-programming@vger.kernel.org>


r_zaca worte:

>  I need to send a TCP segment with the bit RST set. 
>  So is it possible thought the setsockopt? if not how can I do that? 

I beleive that you need to do this through raw sockets.  At least, that 
is how I have always do this.

George
