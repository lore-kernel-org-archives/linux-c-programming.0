From: Bill Davidsen <davidsen@tmr.com>
Subject: Re: Random number generator in Linux kernel
Date: Wed, 09 Mar 2005 15:39:39 -0500
Message-ID: <422F5F0B.3080407@tmr.com>
References: <20050307231853.9F661B6E7@xprdmailfe20.nwk.excite.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <20050307231853.9F661B6E7@xprdmailfe20.nwk.excite.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: vintya@excite.com
Cc: linux-kernel@vger.kernel.org, linux-c-programming@vger.kernel.org

Vineet Joglekar wrote:
> Hi all,
> 
> Can someone please tell me where can I find and which
> random/pseudo-random number generator can I use inside the linux
> kernel? (2.4.28)
> 
> I found out 1 function get_random_bytes() in
> linux/drivers/char/random.c but thats not what I want.
> 
> I want a function where I will be supplying a seed to that function
> as an input, and will get a random number back. If same seed is used,
> same number should be generated again.

Without knowing what you're doing I can't say if it justifies having all 
that extra code around, but the stuff from the library, like srand48, 
will do this. You can add the code to your module.

-- 
    -bill davidsen (davidsen@tmr.com)
"The secret to procrastination is to put things off until the
  last possible moment - but no longer"  -me
