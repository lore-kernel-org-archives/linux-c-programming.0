From: syedk <syedk@intotoinc.com>
Subject: Socket listening listening on both interfaces
Date: 11 Feb 2004 17:55:30 +0530
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <1076502331.4523.38.camel@qa.intotoind.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

Hi,
   i wrote a utility to capture packets on an interface using PF_PACKET
socket(on 2.4 kernel)

  int sock=socket(PF_PACKET,SOCK_RAW,htons(ETH_P_IP);

then i used ioctl to set the interface name for the socket:

   struct ifreq ifinfo;
   dev_name="eth1";
   strncpy(ifinfo.ifr_name,dev_name,strlen(dev_name));

  ioctl(sock,SIOCGIFFLAGS,&ifinfo);

But strangely i am able see packets from both eth0 and eth1 interfaces
present on my machine.Initially when i used eth0 it was ok.later when i
switched to eth1 then the socket is sniffing packets from both
interfaces.
How can the raw socket sniff packets from both eth1 and eth0 at the same
time even after i set interface name as either eth0 or eth1.
do i need to set somethings back to their original state before the
program terminates?

thanx in advance and regards
Syed SK


