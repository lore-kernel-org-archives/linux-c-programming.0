From: jnf <xjnfx@doityourself.com>
Subject: Re: sock-ops->connect()
Date: Mon, 7 Oct 2002 03:51:45 -0700 (PDT)
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20021007105145.4061E3C3C@sitemail.everyone.net>
Reply-To: xjnfx@doityourself.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Elias Athanasopoulos <eathan@otenet.gr>, jnf <xjnfx@doityourself.com>
Cc: linux-c-programming@vger.kernel.org


>I'm not very familiar with kernel internals, but I think you don't
>seem to allocate space for the sock structure.
>
 
its still failing even if i allocated space via (sock_alloc())
when i look through the source for sys_socket (/usr/src/linux/net/socket.c)
i see 

...
// sock_create ...
retval = sock_map_fd(sock);

when i look through the source for sock_map_fd, it basically 'creates the file structure and maps it to fd space of the current process.'

which considering in the connect call i see sock->file->f_flags, which seems to make sense that i would want to use this i suppose, but  i also got the impression that this was something done in a translation of sorts from user space to kernel land, but im already in kernel land, so im not really sure, and then not being able to find instances of it anywhere in my header files tells me maybe i dont? 

But I am a tee bit confused and any help would be appreciated 

again thanks
jnf

_____________________________________________________________
Sign up for FREE email from DoItYourself.com at http://doityourself.com

_____________________________________________________________
Select your own custom email address for FREE! Get you@yourchoice.com w/No Ads, 6MB, POP & more! http://www.everyone.net/selectmail?campaign=tag
