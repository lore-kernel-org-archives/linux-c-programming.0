From: Andre Haupt <andre@bitwigglers.org>
Subject: Re: Git tags
Date: Thu, 3 Apr 2008 16:47:36 +0200
Message-ID: <20080403144736.GA16376@ahaupt-debian-vm.localdomain>
References: <47F4E1AF.5060509@visionsystems.de> <20080403143250.GA16034@ahaupt-debian-vm.localdomain> <47F4EC46.5030307@visionsystems.de>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <47F4EC46.5030307@visionsystems.de>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Yegor Yefremov <yegor_sub1@visionsystems.de>
Cc: Andre Haupt <andre@bitwigglers.org>, linux-c-programming@vger.kernel.org

On Thu, Apr 03, 2008 at 04:40:06PM +0200, Yegor Yefremov wrote:
> Dear Andre,
> 
> thank you for your answer. Yes. I have made some changes to the kernel 
> sources. Is it really so, that if I make some changes Makefile or some 
> other script notices this fact and adds "dirty" to the kernel version 
> string?
If you do not commit your changes (i.e. git status shows modified files)
than yes.

Best regards,

Andre
