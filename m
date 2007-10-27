From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: kernel provided system call is an API?
Date: Sat, 27 Oct 2007 02:33:40 +0100
Message-ID: <18210.38260.62084.809463@cerise.gclements.plus.com>
References: <472214F1.6030907@gmail.com>
	<18210.22198.824183.983353@cerise.gclements.plus.com>
	<47228990.7060007@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <47228990.7060007@gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Shriramana Sharma <samjnaa@gmail.com>
Cc: Linux C Programming List <linux-c-programming@vger.kernel.org>


Shriramana Sharma wrote:

> >> 1. Can the system calls provided by the kernel be considered an API?
> > 
> > System calls aren't strictly an *application* programming interface.
> > Applications are supposed to use the libc functions.
> 
> OK so is it at least a "programming interface"?

Yes, although it's intended to be used solely by libc.

-- 
Glynn Clements <glynn@gclements.plus.com>
