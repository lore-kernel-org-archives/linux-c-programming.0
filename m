From: "Kirkwood, David A" <DAVID.A.KIRKWOOD@saic.com>
Subject: X Windows debugging
Date: Fri, 29 Jul 2005 13:15:31 -0400
Message-ID: <CA0BCF3BED56294AB91E3AD74B849FD51F192E@us-arlington-0668.mail.saic.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "'linux-c-programming@vger.kernel.org'" <linux-c-programming@vger.kernel.org>

Thanks for the response. Now I have an additional complication. The separate
windows communicate accross IPC structures, therefore asynchonously. Any
ideas on how to set up debugging for this mechanism? At present the best I
can do is attach to the window of interest, but messages appear and
disappear into the netherworld of IPC.

Thanks,

Dave
> I need to debug an X windows program which goes through many levels of
> windos on the screen. I tried using ddd but the ddd display captures all
of
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
-
To unsubscribe from this list: send the line "unsubscribe
linux-c-programming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
