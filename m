From: Nicholas Mc Guire <mcguire@lzu.edu.cn>
Subject: Re: Changing syscall table
Date: Thu, 3 Sep 2009 08:40:48 +0200
Message-ID: <20090903064048.GB1508@opentech.at>
References: <48e952f40909011057m70103121vf94978c8a8925734@mail.gmail.com> <20090903002650.GA4512@helight>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20090903002650.GA4512@helight>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Zhenwen Xu <helight.xu@gmail.com>
Cc: Jonathan Nell <crtrn13@gmail.com>, linux-c-programming@vger.kernel.org

On Thu, 03 Sep 2009, Zhenwen Xu wrote:

> On Tue, Sep 01, 2009 at 08:57:58PM +0300, Jonathan Nell wrote:
> > I'm trying to wrap the
> > SG_IO ioctl call (i.e. trap it in the kernel) and have that dump the
> > data from (struct sg_io_hdr).dxferp.
> > Having issues with doing the kernel trap in the newer kernel versions
> > though (trying on 2.6.30). The syscall table is now read-only but for
> > some reason my set_memory_rw() call is failing... Any ideas how to do
> > this properly?
> > 
> > Here are the relevant bits of code:
> 
> try read this:
> http://zhwen.org/xlog/2009/03/%e6%88%aa%e8%8e%b7linux%e7%b3%bb%e7%bb%9f%e8%b0%83%e7%94%a8.htm
> 
> here is the demo.
> http://zhwen.org/coding/cat_syscall.c

while this is quit a nice hack I think that meanwhile standard methods like
kprobes or utrace would do the trick without such intrusive code and allow
very flexible analysis of what is going on.

hofrat
