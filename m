From: "Anshuman S. Rawat" <asr@cs.columbia.edu>
Subject: Re: dereferencing pointer to incomplete type
Date: Wed, 16 Jun 2004 19:02:04 -0400
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <00d301c453f5$f15ec7b0$d3113b80@yoursgz3xpngo4>
References: <016001c453dc$08d6ec70$d3113b80@yoursgz3xpngo4> <20040616220159.GB16146@luna.mooo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Micha Feigin <michf@post.tau.ac.il>, linux-c-programming@vger.kernel.org

> > Arping.xs:153: dereferencing pointer to incomplete type
> >  make: *** [Arping.o] Error 1
> >
> >  Now line 153 in the source is - 
> >  
> >  memcpy(enet_src, src_mac->ether_addr_octet,6);
> >  where
> >  u_char enet_src[6] = {0x00, 0x00, 0x00, 0x00, 0x00,0x00};
> >  struct ether_addr *src_mac;
> >  struct ether_addr
> >  {
> >      u_char  ether_addr_octet[6];
> >  };
> 
> Try as a test to add the struct definition just before the call to
> memcpy and see if that resolves the error. Could be that for some
> reason things aren't included properly.

I already tried this. It didn't help.

-Anshuman 


