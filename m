From: Christoph Bussenius <busseniu@cip.physik.uni-muenchen.de>
Subject: Re: time_t ???
Date: Fri, 14 May 2004 11:29:06 +0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20040514092905.GA2384@opaque>
References: <20040514094051.77625.qmail@web61104.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20040514094051.77625.qmail@web61104.mail.yahoo.com>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

On Fri, May 14, 2004 at 07:40:51PM +1000, behzad chenaghlou wrote:
> What is exactly the "time_t" struct?

time_t isn't a struct, it is merely a bare int, as far as I know.
However, there is a struct timeval:
struct timeval {
  long tv_sec;
  long tv_usec;
};

Regards,
Christoph

-- 
``There's no dark side of the moon, really
Matter of fact, it's all dark''

--Pink Floyd
