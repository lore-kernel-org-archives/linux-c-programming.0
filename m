From: Fabio Miranda Hamburger <fabmirha@ns.isi.ulatina.ac.cr>
Subject: Re: strace write/read output
Date: Tue, 22 Mar 2005 12:16:55 -0600 (CST)
Message-ID: <Pine.LNX.4.58.0503221215250.31636@ns.isi.ulatina.ac.cr>
References: <Pine.LNX.4.58.0503221104060.30671@ns.isi.ulatina.ac.cr>
 <200503221305.32606.eric@cisu.net>
Mime-Version: 1.0
In-Reply-To: <200503221305.32606.eric@cisu.net>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Eric Bambach <eric@cisu.net>
Cc: linux-c-programming@vger.kernel.org

> On Tuesday 22 March 2005 11:05 am, Fabio Miranda Hamburger wrote:
> > hello,
> >
> > I am debugging a tcpip app on linux, I would like to use strace to show me
> > *all* the data passed to read() and write() function to the sockets
> > stream.
> >
> > thanks,
> >
>       Does strace with the -e option do what you want? man strace. It seems to
> do read and write. Prepare for big logfiles ;)

I was trying to figure out how to do it. Can you provide an example?
Usually strace shows few characters and at the end, the total length of
what was received. Well, I need the entire string of characters.

Thanks.
