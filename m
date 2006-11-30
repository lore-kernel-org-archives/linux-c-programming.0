From: linux err <linux_err@yahoo.com>
Subject: Re: Core file size?
Date: Thu, 30 Nov 2006 07:29:25 -0800 (PST)
Message-ID: <20061130152925.62097.qmail@web56515.mail.re3.yahoo.com>
References: <456EF0C0.6030706@ladadee.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <456EF0C0.6030706@ladadee.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: fifty.63@ladadee.com
Cc: linux-c-programming@vger.kernel.org

ulimit -c is set to unlimited. (like i said core size
varies depending on how much you wrote on the memory
you allocated)



--- David Vernon <fifty.63@ladadee.com> wrote:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> linux err wrote:
> 
> > Does anyone know what determines the size of a
> core
> > dump? 
> 
> ulimit -c to set the size and ulimit -a to see the
> size.
> 
> 
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (GNU/Linux)
> 
>
iD8DBQFFbvDAxkzzjLpmvCwRAr95AJ9uztMsfMBuy9yPbcGZqXOYFrk62ACgycsY
> 4hWUQKuZBsthw4cFdYNSqMg=
> =LXka
> -----END PGP SIGNATURE-----
> 



 
____________________________________________________________________________________
Do you Yahoo!?
Everyone is raving about the all-new Yahoo! Mail beta.
http://new.mail.yahoo.com
