From: Shriek <shriek.007@gmail.com>
Subject: Re: Where to find definition for __FUNCTION__ macro
Date: Wed, 23 Aug 2006 16:18:49 +0530
Message-ID: <3ce33f6c0608230348s1cd6d5a1yf8b54d1eb830fffa@mail.gmail.com>
References: <3ce33f6c0608230302n6b779dd1w1543f437a955c5a0@mail.gmail.com>
	 <6eee1c40608230324t63154c45xa4b54c6d6cc9850d@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <6eee1c40608230324t63154c45xa4b54c6d6cc9850d@mail.gmail.com>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Vadiraj <vadiraj.cs@gmail.com>, Mihai Dontu <mdontu@bitdefender.com>
Cc: linux-c-programming@vger.kernel.org

Alright, I might just as well present my problem here... I am trying
to debug some call back handlers which are actualy registered as
function pointers at boot time for a router, now lets say there is  a
central notification framework and looking at the msg-type it calls a
specific handler, so there is some statement like

               ev_msg_handlers[msg->rtsm_type].
So I was thinking if I could get the internals of the __FUNCTION__
macro and if my assumption that it looks it up in system map then I
could possibly attempt to modify it so as to accept the handler
address and return the function name it is entering ... what say ???

On 8/23/06, Vadiraj <vadiraj.cs@gmail.com> wrote:
> __FUNCTION__ is not defined macro part of compiler(GCC).
>
>
> On 8/23/06, Shriek <shriek.007@gmail.com> wrote:
> >
> Hi
>   Where can I find the implementation of the __FUNCTION__ macro, does
> it use symbol table look up  or something ... thanks and regards ...
>
> Shrikanth R K
> -
> To unsubscribe from this list: send the line "unsubscribe
> linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at
> http://vger.kernel.org/majordomo-info.html
>
>
>
>
> --
> cheers,
> Vadi
