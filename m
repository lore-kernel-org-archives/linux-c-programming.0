From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: SIGSEGV
Date: Fri, 4 Mar 2005 00:33:22 +0000
Message-ID: <16935.44242.116101.200958@gargle.gargle.HOWL>
References: <1109766028.5107.5.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <1109766028.5107.5.camel@localhost.localdomain>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: kaushal@rocsys.com
Cc: linux-c <linux-c-programming@vger.kernel.org>


kaushal wrote:

> 	I have big package which "must" run all the time irrespective of any
> errors.As a part of that Iam even handling the SIGSEGV.The problem is
> even if I handle the sigsegv,the handler gets called continuously in an
> infinite loop as if the signal is being recvd. continuously.How can I
> solve this issue and make my handle run only once?

Install the handler using sigaction() with the SA_RESETHAND flag. When
the signal is received, the handler will be de-installed; if SIGSEGV
is received again, the program will be terminated.

The fact that your program received SIGSEGV suggests that one or more
variables contain an invalid value. If you attempt to resume execution
without fixing the error, you will just get further SIGSEGVs.

More generally, if you detect that your program has got into an
invalid state, you have two reasonable choices: either give up (i.e.
terminate) or correct the problem.

Ignoring the problem and hoping that that the program will magically
recover isn't going to work.

A more realistic approach for programs which need to run continuously
would be to run the program from init with the "respawn" option; if
the program terminates, init will restart it.

-- 
Glynn Clements <glynn@gclements.plus.com>
