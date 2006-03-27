From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: Startup function before main.
Date: Mon, 27 Mar 2006 18:48:12 +0100
Message-ID: <17448.9564.516559.483360@cerise.gclements.plus.com>
References: <DC91351678E31E4FB24B551221F507EC028D5063@blr-itp-msg.wipro.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <DC91351678E31E4FB24B551221F507EC028D5063@blr-itp-msg.wipro.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: krishna.vamsi@wipro.com
Cc: linux-c-programming@vger.kernel.org


krishna.vamsi@wipro.com wrote:

> Before Executing the main function, a startup routine will be executed
> which will set up the initial environment for the process.
>  
> This Startup routine will be supplied by the kernel

That's incorrect. The kernel's job ends at the point that it inkokes
the loader.

> and linked by the
> Linker. My question is : Can we add one more startup routine before
> executing the main program, if yes how??

Apart from the approach suggested by Steve, you can replace the
run-time startup file (crtbegin.o etc) with your own file (use gcc's
-nostartfiles option), or use your own loader in place of
ld-linux.so.2 (store the name of the loader in the .interp section of
the executable).

-- 
Glynn Clements <glynn@gclements.plus.com>
