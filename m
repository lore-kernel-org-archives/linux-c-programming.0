From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: Handling ioctl() argp memory
Date: Mon, 5 Mar 2007 01:54:37 +0000
Message-ID: <17899.30813.80673.270405@cerise.gclements.plus.com>
References: <20070304164844.GA7231@wintermute.farpoint>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20070304164844.GA7231@wintermute.farpoint>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: leslie.polzer@gmx.net
Cc: linux-c-programming@vger.kernel.org


leslie.polzer@gmx.net wrote:

>   I'm passing an array to a ioctl.
>   ioctl(2) says it needs to point at memory, so I'm allocating it.
>   Do I need to, or rather, am I allowed to free the memory afterwards?

Yes. The kernel never retains pointers to user-space memory; it either
copies the data, or finishes using it before the system call returns.

>   It seems I'm getting segfaults when I free the memory...

You're probably overwriting the beginning of the allocated block.

-- 
Glynn Clements <glynn@gclements.plus.com>
