From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: dlopen(3) many threads global variable
Date: Sat, 3 Jul 2010 09:06:55 +0100
Message-ID: <19502.61343.821398.46931@cerise.gclements.plus.com>
References: <i0l6p0$2g2$1@dough.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <i0l6p0$2g2$1@dough.gmane.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hicham Mouline <hicham@mouline.org>
Cc: linux-c-programming@vger.kernel.org


Hicham Mouline wrote:

> There is a .so shared dynamic library the main source file of which contains 
> a global variable.
> 
> In my main funtion, I call dlopen() on the same .so file from 16 different 
> threads. I do nothing to ensure the call is not done at the same time.
> 
> Very roughly speaking (and please can you provide precision if possible), 
> the executable code of the .so file is loaded into the main process virtual 
> memory after the dlopen has succeeded. (Note the main binary is not linked 
> against the .so file)
> 
> Will there be 16 copies of the executable code from the .so file in the 
> process?

No.

> IN particular, will there be 16 copies of the global variable?

No.

-- 
Glynn Clements <glynn@gclements.plus.com>
