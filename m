From: Rechberger Markus <mrechberger@gmail.com>
Subject: Re: strace write/read output
Date: Wed, 23 Mar 2005 18:34:57 +0100
Message-ID: <d9def9db0503230934238c870@mail.gmail.com>
References: <Pine.LNX.4.58.0503221104060.30671@ns.isi.ulatina.ac.cr>
	 <200503221305.32606.eric@cisu.net>
	 <Pine.LNX.4.58.0503221215250.31636@ns.isi.ulatina.ac.cr>
Reply-To: Rechberger Markus <mrechberger@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <Pine.LNX.4.58.0503221215250.31636@ns.isi.ulatina.ac.cr>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Fabio Miranda Hamburger <fabmirha@ns.isi.ulatina.ac.cr>
Cc: linux-c-programming@vger.kernel.org

hey,

here two small examples the first one will attach strace to a running
process, the second one will fire up your application attached to
strace.

strace -e 'read,write' -p <processid> or
strace -e 'read,write' <yourapplication>

Markus


On Tue, 22 Mar 2005 12:16:55 -0600 (CST), Fabio Miranda Hamburger
<fabmirha@ns.isi.ulatina.ac.cr> wrote:
> > On Tuesday 22 March 2005 11:05 am, Fabio Miranda Hamburger wrote:
> > > hello,
> > >
> > > I am debugging a tcpip app on linux, I would like to use strace to show me
> > > *all* the data passed to read() and write() function to the sockets
> > > stream.
> > >
> > > thanks,
> > >
> >       Does strace with the -e option do what you want? man strace. It seems to
> > do read and write. Prepare for big logfiles ;)
> 
> I was trying to figure out how to do it. Can you provide an example?
> Usually strace shows few characters and at the end, the total length of
> what was received. Well, I need the entire string of characters.
> 
> Thanks.
> -
> To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
