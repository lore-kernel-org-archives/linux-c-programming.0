From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: Building a program "static"
Date: Tue, 29 Oct 2002 10:06:45 +0000
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <15806.23989.856359.135348@cerise.nosuchdomain.co.uk>
References: <200210291000.17896.wrazlov@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <200210291000.17896.wrazlov@gmx.net>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: wrazlov@gmx.net
Cc: linux-c-programming@vger.kernel.org


Wrazlov wrote:

> I tried to build a program to be static, but it always says that some library 
> was not found, altough it works very well if it's built normal (shared):
> gcc -L/usr/qt-3.0.4/lib -lqt-mt -static program.static program.o
> ld says: "-lqt-mt not found"
> What's wrong with the linker-options?

If you use "-static", you must have static (".a") versions of every
library which the program uses. In the above case, it's complaining
that it couldn't find "libqt-mt.a".

Binary packages often don't include static libraries; in which case,
you will have to build a static version of the library from source.

-- 
Glynn Clements <glynn.clements@virgin.net>
