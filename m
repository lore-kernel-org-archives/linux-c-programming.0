From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: dynamic loading of objects/modules in C/C++
Date: Tue, 17 Jun 2003 03:58:46 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <16110.33766.806799.581717@cerise.nosuchdomain.co.uk>
References: <3EEE6518.3030004@hq.ntsp.nec.co.jp>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <3EEE6518.3030004@hq.ntsp.nec.co.jp>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ronkhu@ntsp.nec.co.jp
Cc: linux-c-programming <linux-c-programming@vger.kernel.org>


ronkhu wrote:

> Is there a "java-like-reflection API" for C++ and C that would enable a 
> program( already in execution) to dynamically load a particular 
> module(files with .o extension)  or class? (how about dynamic loading of 
> functions?)

Is dlopen()/dlsym() sufficient? Or did you want something else?

-- 
Glynn Clements <glynn.clements@virgin.net>
