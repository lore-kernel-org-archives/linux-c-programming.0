From: "Shorty Porty" <getshorty_@hotmail.com>
Subject: RE: Where to find definition for __FUNCTION__ macro
Date: Wed, 23 Aug 2006 22:49:28 +1000
Message-ID: <BAY104-DAV70758AAD5F35546BA30EEED470@phx.gbl>
References: <17644.14314.29203.840094@cerise.gclements.plus.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <17644.14314.29203.840094@cerise.gclements.plus.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 'Glynn Clements' <glynn@gclements.plus.com>, 'Shriek' <shriek.007@gmail.com>
Cc: 'Vadiraj' <vadiraj.cs@gmail.com>, 'Mihai Dontu' <mdontu@bitdefender.com>, linux-c-programming@vger.kernel.org

My understanding is that __FUNCTION__ is substituted at compile time. So
__FUNCTION__ doesn't run anything, it's just a string, like __FILE__ or
__LINE__.

shorty

-----Original Message-----
From: linux-c-programming-owner@vger.kernel.org
[mailto:linux-c-programming-owner@vger.kernel.org] On Behalf Of Glynn
Clements
Sent: Wednesday, 23 August 2006 9:12 PM


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

