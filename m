From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: Problem with pointer to external function
Date: Fri, 1 Jul 2005 17:41:01 +0100
Message-ID: <17093.29213.526059.430091@gargle.gargle.HOWL>
References: <20050701103026.GA2965@paktahn.black.cat>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20050701103026.GA2965@paktahn.black.cat>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: leslie.polzer@gmx.net
Cc: linux-c-programming@vger.kernel.org


leslie.polzer@gmx.net wrote:

> why do it get the segfault below? What's wrong?
> 
> 
> [sky@paktahn ~/code/cbtest]% cat main.c      
> #include <stdio.h>
> 
> typedef void (*callback)();
> 
> extern callback cb;

Is "cd" really a pointer to a function? Or is it a function? If it's
the latter, you need to create a variable of type "callback" and then
make it point to the function, e.g.:

	typedef void (*callback)();
	extern void cb();

	static callback cbp = &cb;

More generally, you have to ensure that the types of "extern"
declarations are correct. The compiler can't check it for you.

-- 
Glynn Clements <glynn@gclements.plus.com>
