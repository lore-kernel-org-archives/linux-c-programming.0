From: "Hendrik Visage" <hvjunk@gmail.com>
Subject: Re: delayed execution
Date: Thu, 3 Jan 2008 12:47:31 +0200
Message-ID: <d93f04c70801030247y2f2d7dd7r293698f1e8cb0965@mail.gmail.com>
References: <1198217274.2713.2.camel@root>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        bh=iKB+3G7CeR92aOnHm/D6EeXeje0AKkbLAHw74DQAczE=;
        b=SWUUIgYN57vKRfbE8gQCWMWLOq76Op3pQmHj5zRpzTXZrvQmjC93xlKuUDP87LOtWPUdQbWf3bkIic1R2Wh6F+RGz0XsR/NVzRPIdY9117T0hawbFvwykOuXobnXpMolFguQyMkR5oK4hZmOMlsgETWCIM0QM52q/QTKMBUB6Nw=
In-Reply-To: <1198217274.2713.2.camel@root>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: vibi_sreenivasan@cms.com
Cc: Linux C Programming List <linux-c-programming@vger.kernel.org>

On Dec 21, 2007 8:07 AM, vibi <vibi_sreenivasan@cms.com> wrote:
> hello,
>         is there any function to delay the execution of a user defined
> function .

What do you want to achieve?

> i know about sleep . is there any thing other.

Why not sleep or usleep? you might consider sched_yield() or the
alarm()/ualarm() based functions



-- 
Hendrik Visage
