From: ratheesh kannoth <ratheesh.ksz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: virtual -->physical --> virtual address
Date: Sat, 15 Oct 2011 12:31:08 +0530
Message-ID: <CAGZFCEHW9Rpk8ZaFbaQPMeA_jOGFnFsnyqXg8QYJs+T+WpxpKw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-modules-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=5HC1b+kZsPIM2SWiNETbT9JuK8luR+ejURr1uGSch9U=;
        b=BgRbYvPbrLrzi6E6jfnH/uxBshEGZZCS3MMdu0mn+wal69JY2lJjzCncDWDrglLjqH
         xXGLIHhes9h42gA4/Ipv60wWvO/bN5KVV1723SAhyio0JWUeCvpQpXZQcMGLmkGFJqo+
         +zTua67vISa31dckOpVq3Lq9L6a3cPS8/O2R0=
Sender: linux-modules-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-newbie <linux-newbie-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-c-programming-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-modules-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

{
virtual_addr1 =  kmalloc(0x20, GFP_USER);
phy_addr1 = __pa(virtual_addr1 );
virtual_addr2 =  ioremap(phy_addr1, 0x20 );

}


I noticed that virtual_addr1  is not equal to virtual_addr2.  And if i
dereference virtual_addr2 ( *virtual_addr2 ),
kernel crash. What is wrong here ?

-Ratheesh
