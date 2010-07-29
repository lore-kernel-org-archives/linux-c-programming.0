From: Victor Rodriguez <vm.rod25@gmail.com>
Subject: Re: Error in compiling a module
Date: Thu, 29 Jul 2010 08:56:31 -0500
Message-ID: <AANLkTimJ+FCxy9-zRme57R_f3E2aq+395xt3eybnb46G@mail.gmail.com>
References: <AANLkTikcGVVaofeUZtvPs+jpA11uXs-baTZ8O8NvH94i@mail.gmail.com>
	<AANLkTikqZ5YWqgnHbB3Y03kZfC0OpJ7POYKSeU6JESVt@mail.gmail.com>
	<AANLkTimkzbse8B0_kUMbaP-DT8Zm1CnZxOnCA+S5CHnE@mail.gmail.com>
	<AANLkTimeJrRs4Bd1aw--FKPYyqcuu8_O-Xi5G0FOh0yd@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:cc:content-type;
        bh=mAtSvq2M9R7FVlhV5Cjg5vcpptQ1xJHKfQ5G3N2uQSg=;
        b=WbOdZUPZ28S/NuVCruZEchqAXfgdywyFt68AWkBacL4yHpz9Gqs8Qg8C1y7Itm2bWt
         5nFHJCa6tpZxjedSWPSLThwvfI/XG9NSM7Yh0YUbrUwFxrlzebElBmDk9E1ezpbbGLCc
         6IDLp+3g8SffzvM118ZpQZSFtu/PYMm38UEhU=
In-Reply-To: <AANLkTimeJrRs4Bd1aw--FKPYyqcuu8_O-Xi5G0FOh0yd@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mulyadi Santosa <mulyadi.santosa@gmail.com>
Cc: Balachandar <bala1486@gmail.com>, kernelnewbies@nl.linux.org, linux-c-programming@vger.kernel.org

On Wed, Jul 28, 2010 at 11:51 PM, Mulyadi Santosa
<mulyadi.santosa@gmail.com> wrote:
>
> Hi...
>
> On Thu, Jul 29, 2010 at 00:28, Balachandar <bala1486@gmail.com> wrote:
> > Thank you for your help. I figured out the mistake. I missed a
> > semicolon in one of the header file that was included in the file that
> > showed the error.
>
> I think it would be great if you and some guys here write about
> "mistakes I ever did when I write kernel codes" in kernelnewbies
> wiki....so that others might learn about it.
>
> Just 2 cents suggestion...
>
> --
> regards,
>
> Mulyadi Santosa
> Freelance Linux trainer and consultant
>
> blog: the-hydra.blogspot.com
> training: mulyaditraining.blogspot.com
> --
> To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html


Hey think it is a really god idea to write about common mistakes in
kernel codes.  I have one , I realize  that when you just copy and
paste the code for the makefiles from the Internet or PDF's it doesn't
compile the first time, you have to eliminate some tabs spaces  first;
for example in the The Linux Kernel Module Programming Guide there is
a simple hello-1.c and its makefile is .

obj-m += hello-1.o
all:
        make -C /lib/modules/$(shell uname -r)/build M=$(PWD) modules
clean:
        make -C /lib/modules/$(shell uname -r)/build M=$(PWD) clean

when you run make in the terminal

make[1]: *** No rule to make target `-C'.  Stop.

Could appear

you have to copy in plain text or type yourself. well it is not a real
kenrel problem but mya help to others i realize it happens the first
time I compiled my "simplest module"

Thanks

Victor
