From: "Anshuman S. Rawat" <asr@cs.columbia.edu>
Subject: dereferencing pointer to incomplete type
Date: Wed, 16 Jun 2004 15:56:37 -0400
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <016001c453dc$08d6ec70$d3113b80@yoursgz3xpngo4>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

Hi,
I got the following error while compiling some module -
 
Arping.xs:153: dereferencing pointer to incomplete type
 make: *** [Arping.o] Error 1
 
 
 Now line 153 in the source is - 
 
 memcpy(enet_src, src_mac->ether_addr_octet,6);
 
 where
 
 u_char enet_src[6] = {0x00, 0x00, 0x00, 0x00, 0x00,0x00};
 
 struct ether_addr *src_mac;
 
 
 struct ether_addr
 {
     u_char  ether_addr_octet[6];
 };
 
 are the definitions.
 
 I haven't been able to figure out what the problem is.
Any help will be appreciated.
 
 Thanks.
Anshuman
 

