From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: faults in dynamic libraries
Date: Thu, 13 Jun 2002 12:52:50 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <15624.34706.474424.844715@cerise.nosuchdomain.co.uk>
References: <1746252115.20020613134524@mail.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <1746252115.20020613134524@mail.ru>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Tver Mit <Vukdev@mail.ru>
Cc: linux-c-programming@vger.kernel.org


Tver Mit wrote:

> I write a programm that uses plugins (on dl* functions base). When plugin code is free of
> bugs all is ok, but when plugin faults by any reason, my programm do so. I want my programm
> to work even if plugin dies. I see two ways: 
> 1. handling signals 
> 2. run plugin in different thread or process
> but then: 
> in 1. what will be with resources, that plugin use ? 
> in 2. it'll be about 15-20 plugins running - so there will be 15-20 processes. And how to synchronise them all?
> 
> Got any ideas, opinions?

If a plugin shares its address space with the main program, a bug can
corrupt that address space, killing the main program.

Running plugins in a separate process is the only reliable mechanism,
but it probably isn't practical. Even then, a plugin may still be able
to interfere with the main process if they share system resources such
as file descriptors.

-- 
Glynn Clements <glynn.clements@virgin.net>
