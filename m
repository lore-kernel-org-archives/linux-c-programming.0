From: Paul Jackson <pj@sgi.com>
Subject: Re: sprintf with mips
Date: Wed, 6 Feb 2008 18:10:31 -0600
Message-ID: <20080206181031.e16fc5d0.pj@sgi.com>
References: <20080206224822.178960@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20080206224822.178960@gmx.net>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Christian Stalp <christian.stalp@gmx.de>
Cc: linux-c-programming@vger.kernel.org, aluink@gmail.com

> are there any known problems with sprintf under mips?

Is there any chance that some other line of code, perhaps
writing an adjacent variable, is overflowing onto the
front of this insertvalues[] array, between the sprintf
and the printf?

In other words, I'll wager that whatever bug you're seeing
is neither in the code fragements quoted here, nor in the
sprintf libc code, but in some other nearby code.

-- 
                  I won't rest till it's the best ...
                  Programmer, Linux Scalability
                  Paul Jackson <pj@sgi.com> 1.940.382.4214
