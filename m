From: Eric Bambach <eric@cisu.net>
Subject: Re: Assignment  make pointers
Date: Mon, 13 Dec 2004 08:58:22 -0600
Message-ID: <200412130858.22661.eric@cisu.net>
References: <20041213_100432_025782.r_zaca@ig.com.br> <20041213101011.GO16958@lug-owl.de> <200412130851.44586.eric@cisu.net>
Reply-To: eric@cisu.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <200412130851.44586.eric@cisu.net>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

On Monday 13 December 2004 08:51 am, Eric Bambach wrote:
> What escapes me though is how the compiler could compile without knowing
> the definition. Isnt it REALLY presumptuous and dangerous for the compiler
> to assume function definitions? I assume basename is in the standard c
> library though or it certainly wouldnt link. Can anyone with more
> experience elaborate?

Sorry to reply to my own post, but nevermind. Its too early (someone called 
and woke me up :) and I've been programming in C++ too long where prototypes 
are required. gcc will compile happily without libgen.h while g++ won't. That 
answers my own question. 

Sorry for the noise.

-- 

-EB
