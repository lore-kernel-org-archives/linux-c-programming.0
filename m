From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: X Windows debugging
Date: Sat, 30 Jul 2005 13:58:22 +0100
Message-ID: <17131.31086.386697.708975@cerise.gclements.plus.com>
References: <CA0BCF3BED56294AB91E3AD74B849FD51F192E@us-arlington-0668.mail.saic.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <CA0BCF3BED56294AB91E3AD74B849FD51F192E@us-arlington-0668.mail.saic.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Kirkwood, David A" <DAVID.A.KIRKWOOD@saic.com>
Cc: "'linux-c-programming@vger.kernel.org'" <linux-c-programming@vger.kernel.org>


Kirkwood, David A wrote:

> Thanks for the response. Now I have an additional complication. The separate
> windows communicate accross IPC structures, therefore asynchonously. Any
> ideas on how to set up debugging for this mechanism? At present the best I
> can do is attach to the window of interest, but messages appear and
> disappear into the netherworld of IPC.

If the "windows" are distinct processes, you'll need to debug each one
individually.

-- 
Glynn Clements <glynn@gclements.plus.com>
