From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: kmalloc
Date: Wed, 2 Jun 2004 09:50:02 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <16573.38074.885287.388409@cerise.nosuchdomain.co.uk>
References: <8158840804060115534de05277@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <8158840804060115534de05277@mail.gmail.com>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: venkata ramana <uvramana@gmail.com>
Cc: linux-c-programming@vger.kernel.org


venkata ramana wrote:

> Will the kmalloc system call fail to allocate more than 131072 bytes
> of memory? If so, Is there anyway to change this limit?

kmalloc isn't a system call, it's a kernel function.

Questions about kernel internals should be addressed to the
linux-kernel list.

-- 
Glynn Clements <glynn.clements@virgin.net>
