From: Nicholas Mc Guire <der.herr@hofr.at>
Subject: Re: Sending and receiving packets from multiple lines
Date: Sun, 24 Mar 2013 11:58:10 +0100
Message-ID: <20130324105810.GA19857@opentech.at>
References: <CAA6iF_6gtyZb12X7rfm2ckZ08Ff=oRT4_=s86ZFTT-1mzNp3AA@mail.gmail.com> <CAJR2zJ9JTLp3w3amqhRpC7dVZDDszWF7pVTmu1AWaK4TmqzwxQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAJR2zJ9JTLp3w3amqhRpC7dVZDDszWF7pVTmu1AWaK4TmqzwxQ@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Celelibi <celelibi@gmail.com>
Cc: Randi Botse <nightdecoder@gmail.com>, linux-c-programming@vger.kernel.org

On Sat, 23 Mar 2013, Celelibi wrote:

> Hello,
> 
> TCP should reorder packet fragments.
> If you're using UDP or a custom protocol over IP, you have absolutemy
> no guarantee about the delivery of packets.
> 
> 2013/3/23, Randi Botse <nightdecoder@gmail.com>:
> > Hi All,
> >
> > My network implements interface bonding, aggregate several lines into
> > one logical line to achieve higher connection throughput and
> > redundancy.
> > I'm writing a network application in Linux that basically send packets
> > to another host outside. I got problem with packet ordering on
> > destination host, for example. packet1 from line1 should arrived
> > earlier than packet3 from line3, etc. I want them to be delivered in
> > correct order. Is this possible? if yes, what is the better way for
> > doing this?.
> >
you can implement that your self of course but it probably would be better
to use channel bonding to do that and then send all the data over the bond
device and let the kernel take care of ordering issues - handling all the
corener cases of losing single lines, notably temporarily is a pain in the but.

Also with the use of bondign devices you get all the benifits of clean 
firewall and traffic control handling at kernel level - I doubt it is resonable
to handle this over multiple distinct lines in a meaningful way (with finite
effort that is...)

thx
hofrat
