From: Elias Athanasopoulos <eathan@otenet.gr>
Subject: Re: sock-ops->connect()
Date: Sun, 6 Oct 2002 17:36:36 +0300
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20021006173636.C3197@neutrino.particles.org>
References: <20021006101521.B253E11E0B@sitemail.everyone.net>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20021006101521.B253E11E0B@sitemail.everyone.net>; from xjnfx@doityourself.com on Sun, Oct 06, 2002 at 03:15:21AM -0700
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jnf <xjnfx@doityourself.com>
Cc: linux-c-programming@vger.kernel.org

On Sun, Oct 06, 2002 at 03:15:21AM -0700, jnf wrote:
> struct socket *sock;
> struct sockaddr_in adr;
> int err,port;
> 
> // ...
> 
> port = 5260;
> 
> err = sock_create(AF_INET,SOCK_STREAM,IPPROTO_TCP,&sock);

I'm not very familiar with kernel internals, but I think you don't
seem to allocate space for the sock structure.

Elias

-- 
http://gnewtellium.sourceforge.net			MP3 is not a crime.	
