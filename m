From: syedk <syedk@intotoinc.com>
Subject: Re: Socket listening listening on both interfaces
Date: 12 Feb 2004 12:03:54 +0530
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <1076567648.4523.62.camel@qa.intotoind.com>
References: <1076502331.4523.38.camel@qa.intotoind.com> 
	<16426.28980.499777.670099@cerise.nosuchdomain.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <16426.28980.499777.670099@cerise.nosuchdomain.co.uk>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Glynn Clements <glynn.clements@virgin.net>
Cc: linux-c-programming@vger.kernel.org

my question is does'nt the ioctl call:
ioctl(sock,SIOCGIFFLAGS,&ifinfo);
bind the socket to eth1?
if it does'nt do  i need  to bind it using setsockopt?

thanks
syedk

On Wed, 2004-02-11 at 23:45, Glynn Clements wrote:
> 
> syedk wrote:
> 
> >    i wrote a utility to capture packets on an interface using PF_PACKET
> > socket(on 2.4 kernel)
> > 
> >   int sock=socket(PF_PACKET,SOCK_RAW,htons(ETH_P_IP);
> > 
> > then i used ioctl to set the interface name for the socket:
> > 
> >    struct ifreq ifinfo;
> >    dev_name="eth1";
> >    strncpy(ifinfo.ifr_name,dev_name,strlen(dev_name));
> > 
> >   ioctl(sock,SIOCGIFFLAGS,&ifinfo);
> 
> Huh? SIOCGIFFLAGS retrieves the flags for a specific interface, in
> this case eth1.
> 
> > But strangely i am able see packets from both eth0 and eth1 interfaces
> > present on my machine.Initially when i used eth0 it was ok.later when i
> > switched to eth1 then the socket is sniffing packets from both
> > interfaces.
> > How can the raw socket sniff packets from both eth1 and eth0 at the same
> > time even after i set interface name as either eth0 or eth1.
> > do i need to set somethings back to their original state before the
> > program terminates?
> 
> It sounds as if you want:
> 
> 	char name[] = "eth1";
> 	setsockopt(sock SOL_SOCKET, SO_BINDTODEVICE, name, sizeof(name));
> 
> -- 
> Glynn Clements <glynn.clements@virgin.net>


