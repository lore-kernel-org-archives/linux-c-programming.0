From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re:
Date: Fri, 29 Jul 2005 18:25:32 +0100
Message-ID: <17130.26252.680294.36281@cerise.gclements.plus.com>
References: <CA0BCF3BED56294AB91E3AD74B849FD51F192C@us-arlington-0668.mail.saic.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <CA0BCF3BED56294AB91E3AD74B849FD51F192C@us-arlington-0668.mail.saic.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Kirkwood, David A" <DAVID.A.KIRKWOOD@saic.com>
Cc: linux-c-programming@vger.kernel.org


Kirkwood, David A wrote:

> I need to debug an X windows program which goes through many levels of
> windos on the screen. I tried using ddd but the ddd display captures all of
> the window events instead of the application I'm trying to debug capturing
> them. Is there some standard way to debug X apps or, is there some
> particular debugger better suited to this requirement?  I'm using ddd. 

It may help to run the program being debugged on a separate X display
to the debugging tools, so that you can more reliably control what
events it receives. If you debug it on the same display, its hard to
avoid the program receiving expose, enter/leave, focus etc events as
you use the debugging tools.

You don't need a second machine; an Xvnc session will do.

-- 
Glynn Clements <glynn@gclements.plus.com>
