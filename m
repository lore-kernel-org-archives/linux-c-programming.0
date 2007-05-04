From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: How did KDbg find out the source corresponding to my executable?
Date: Fri, 4 May 2007 14:34:22 +0100
Message-ID: <17979.13918.156651.96290@cerise.gclements.plus.com>
References: <4632116C.70109@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <4632116C.70109@gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Shriramana Sharma <samjnaa@gmail.com>
Cc: linux-c-programming@vger.kernel.org


Shriramana Sharma wrote:

> Just a few minutes ago, I tried KDbg, the KDE front-end to gdb. (The 
> change in position of g between the two names amuses me for some reason.)
> 
> When I selected an executable which was located at a location different 
> from its source, KDbg automatically found out the location of the 
> source-file and opened it for setting breakpoints etc.
> 
> Is the path to the source embedded in every executable?

It's part of the debug info, so it will be present in an executable
which was built with debug info and hasn't subsequently been stripped.

> Upon examining 
> the executable by nm for symbols I did not find the source path, but 
> maybe that is not a symbol.

It's not a symbol.

Run "strings -a ..." on the file.

-- 
Glynn Clements <glynn@gclements.plus.com>
