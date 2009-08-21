From: Nicholas Mc Guire <mcguire@lzu.edu.cn>
Subject: Re: strange stack limit behavior when allocating more than 2GB mem
	on 32bit machine
Date: Fri, 21 Aug 2009 11:37:50 +0200
Message-ID: <20090821093750.GA16299@opentech.at>
References: <56b13acf0908202047k2bf536f9vf993394d42059b8e@mail.gmail.com> <19086.17786.445616.394966@cerise.gclements.plus.com> <56b13acf0908210212t5b6921f5h4c224efa21d2f067@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <56b13acf0908210212t5b6921f5h4c224efa21d2f067@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joe <longapple@gmail.com>
Cc: Glynn Clements <glynn@gclements.plus.com>, linux-c-programming@vger.kernel.org

On Fri, 21 Aug 2009, Joe wrote:

> Hi Glynn,
> 
> Thanks for your explanation. However as you can see, I got 2GB mem and
> ~10GB swap, totally 12GB.
> 
> With ulimit -s 10240(KB), I can allocate 2.5GB, I guess these are in
> swap, right?
> With ulimit -s unlimited, as you said, kernel reserved 1GB, stack
> reserved 2GB, there are still 12-3=9GB left??
> 
> Why did malloc failed, instead of allocating this abundant swap space?
>
initializing 12GB swap will not change the address space limit unless you
enabled high-memory support in the kernel (CONFIG_HIGHMEM64G=y in your .config)
the limit is not the physical memory (RAM+swap) but the 32bit address space.

hofrat
