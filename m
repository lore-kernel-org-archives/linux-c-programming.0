From: Christoph Bussenius <busseniu@cip.physik.uni-muenchen.de>
Subject: Re: dereferencing pointer to incomplete type
Date: Wed, 16 Jun 2004 22:14:13 +0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20040616201413.GG6157@opaque>
References: <016001c453dc$08d6ec70$d3113b80@yoursgz3xpngo4>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <016001c453dc$08d6ec70$d3113b80@yoursgz3xpngo4>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

On Wed, Jun 16, 2004 at 03:56:37PM -0400, Anshuman S. Rawat wrote:
> Arping.xs:153: dereferencing pointer to incomplete type
>  make: *** [Arping.o] Error 1
>  
>  memcpy(enet_src, src_mac->ether_addr_octet,6);

...

>  struct ether_addr
>  {
>      u_char  ether_addr_octet[6];
>  };

Hi, I think you should define that struct _before_ you use it. This
error is exactly what you get when you define it later.

HTH,
Christoph

-- 
``There's no dark side of the moon, really
Matter of fact, it's all dark''

--Pink Floyd
