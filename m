From: "Anshuman S. Rawat" <asr@cs.columbia.edu>
Subject: Re: dereferencing pointer to incomplete type
Date: Wed, 16 Jun 2004 16:13:57 -0400
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <01b501c453de$74bb17c0$d3113b80@yoursgz3xpngo4>
References: <016001c453dc$08d6ec70$d3113b80@yoursgz3xpngo4> <20040616201413.GG6157@opaque>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Christoph Bussenius <busseniu@cip.physik.uni-muenchen.de>, linux-c-programming@vger.kernel.org

> On Wed, Jun 16, 2004 at 03:56:37PM -0400, Anshuman S. Rawat wrote:
> > Arping.xs:153: dereferencing pointer to incomplete type
> >  make: *** [Arping.o] Error 1
> >  
> >  memcpy(enet_src, src_mac->ether_addr_octet,6);
> ...
> >  struct ether_addr
> >  {
> >      u_char  ether_addr_octet[6];
> >  };
> 
> Hi, I think you should define that struct _before_ you use it. This
> error is exactly what you get when you define it later.

The struct is defined before it is used through a header file.
I just wrote it afterwards here to show what it was.

Thanks.
-Anshuman


> 
> HTH,
> Christoph
> 

