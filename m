From: Micha Feigin <michf@post.tau.ac.il>
Subject: Re: dereferencing pointer to incomplete type
Date: Thu, 17 Jun 2004 01:01:59 +0300
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20040616220159.GB16146@luna.mooo.com>
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
> Hi,
> I got the following error while compiling some module -
>  
> Arping.xs:153: dereferencing pointer to incomplete type
>  make: *** [Arping.o] Error 1
>  
>  
>  Now line 153 in the source is - 
>  
>  memcpy(enet_src, src_mac->ether_addr_octet,6);
>  
>  where
>  
>  u_char enet_src[6] = {0x00, 0x00, 0x00, 0x00, 0x00,0x00};
>  
>  struct ether_addr *src_mac;
>  
>  
>  struct ether_addr
>  {
>      u_char  ether_addr_octet[6];
>  };
>  
>  are the definitions.
>  
>  I haven't been able to figure out what the problem is.
> Any help will be appreciated.
>  

Try as a test to add the struct definition just before the call to
memcpy and see if that resolves the error. Could be that for some
reason things aren't included properly.

>  Thanks.
> Anshuman
>  
> 
> -
> To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>  
>  +++++++++++++++++++++++++++++++++++++++++++
>  This Mail Was Scanned By Mail-seCure System
>  at the Tel-Aviv University CC.
> 
