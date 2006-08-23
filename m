From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: Where to find definition for __FUNCTION__ macro
Date: Wed, 23 Aug 2006 12:11:38 +0100
Message-ID: <17644.14314.29203.840094@cerise.gclements.plus.com>
References: <3ce33f6c0608230302n6b779dd1w1543f437a955c5a0@mail.gmail.com>
	<6eee1c40608230324t63154c45xa4b54c6d6cc9850d@mail.gmail.com>
	<3ce33f6c0608230348s1cd6d5a1yf8b54d1eb830fffa@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <3ce33f6c0608230348s1cd6d5a1yf8b54d1eb830fffa@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Shriek <shriek.007@gmail.com>
Cc: Vadiraj <vadiraj.cs@gmail.com>, Mihai Dontu <mdontu@bitdefender.com>, linux-c-programming@vger.kernel.org


Shriek wrote:

> Alright, I might just as well present my problem here... I am trying
> to debug some call back handlers which are actualy registered as
> function pointers at boot time for a router, now lets say there is  a
> central notification framework and looking at the msg-type it calls a
> specific handler, so there is some statement like
> 
>                ev_msg_handlers[msg->rtsm_type].
> So I was thinking if I could get the internals of the __FUNCTION__
> macro and if my assumption that it looks it up in system map then I
> could possibly attempt to modify it so as to accept the handler
> address and return the function name it is entering ... what say ???

__FUNCTION__ won't help you here.

You need to be able to read either the executable's symbol table (for
a dynamically-linked executable) or its debug information (for an
executable with debug info). For a statically-linked executable with
no debug info, it's impossible; the function's names simply don't
exist anywhere at run-time.

I'd suggest looking at the source code for "nm" for details on reading
symbol information.

-- 
Glynn Clements <glynn@gclements.plus.com>
