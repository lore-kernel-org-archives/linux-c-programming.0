From: Zhenwen Xu <helight.xu@gmail.com>
Subject: Re: Changing syscall table
Date: Fri, 4 Sep 2009 08:31:03 +0800
Message-ID: <20090904003103.GB4465@helight>
Reply-To: Zhenwen Xu <helight.xu@gmail.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:date:from:to:subject
         :message-id:reply-to:mime-version:content-type:content-disposition
         :user-agent;
        bh=E2BRv3U45Dv70YseVyZ4Gdc55AOqbnUfGsZoYJC6yjY=;
        b=XgCWr+U+BdLCgxx2TeHEKfuMxeT4AIzmNDHptlZa1jQCn/BbxldmA9apGCH4j+lojg
         ApnNmMKcY+076wwfWI9Hjebe0F2VmbhSgBVt9Ai34100nIWCKF+AVisVCGUXKDLEBEuu
         Htv4JjLoRata8Zdy/OYpxX4Ws9tNL+a83rKvs=
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org


On Thu, Sep 03, 2009 at 08:27:42AM +0300, Jonathan Nell wrote:
> 2009/9/3 Zhenwen Xu <helight.xu@gmail.com>:
> > On Tue, Sep 01, 2009 at 08:57:58PM +0300, Jonathan Nell wrote:
> >> I'm trying to wrap the
> >> SG_IO ioctl call (i.e. trap it in the kernel) and have that dump the
> >> data from (struct sg_io_hdr).dxferp.
> >> Having issues with doing the kernel trap in the newer kernel versions
> >> though (trying on 2.6.30). The syscall table is now read-only but for
> >> some reason my set_memory_rw() call is failing... Any ideas how to do
> >> this properly?
> >>
> >> Here are the relevant bits of code:
> >
> > try read this:
> > http://zhwen.org/xlog/2009/03/%e6%88%aa%e8%8e%b7linux%e7%b3%bb%e7%bb%9f%e8%b0%83%e7%94%a8.htm
> >
> > here is the demo.
> > http://zhwen.org/coding/cat_syscall.c
> 
> Thanks for this. WIll try it today. How come you don't get a kernel
> paging error? Where are you making the syscall read/write?
I have tested this demo successfully for all syscall except fork.

this program is fail in fork! I haven't find the reason!

PS: forget to linux-c-programming@vger.kernel.org
-- 
--------------------------------
http://zhwen.org - Open and Free

-- 
--------------------------------
http://zhwen.org - Open and Free
