From: Jason <lcprog@lakedaemon.net>
Subject: [SOT] ATA over Ethernet lost through tap interface
Date: Sat, 22 Dec 2007 15:21:14 -0500
Message-ID: <476D71BA.7060105@lakedaemon.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linux C Programming List <linux-c-programming@vger.kernel.org>

Okay, I'm lost.  :-(  Anyone know the intricacies of how a network
packet traverses the kernel?

I've been using AoE for a month or two now on my home network.  For
about two years I've been using ssh (with tuntap) to remotely access my
home network.  I recently switched over to openvpn for remote network
access.  For both vpn's I use layer 2 tap0 and the server bridges the
tap with the real interface on the home network.  All work fine
separately.  The problem is getting AoE to work with the vpn.

I can use AoE just fine with my laptop when I'm at home (AoE server,
vblade, binds to br0).  When I remotely connect in to the home network
with a layer 2 (tap0) vpn (either ssh or openvpn) I can see the
broadcast AoE packets on both sides of the tunnel.  The client will
respond to a broadcast from the vblade server, but the server won't
reply to anything sent through the vpn.

I see two possible problems.  Either AoE's layer 2 type (ETH_P_AOE,
0x0x88A2) is getting filtered out, or the non-real nature of the tap
interface is causing the problem.  The three areas I've been digging
into are the code for tun (drivers/net/tun.c), bridge (the server
bridges eth0 and tap0, no filtering) (net/bridge/*.c), and the aoe code.
 I've tried both the in-tree kernel version (aoe v32) and the latest
out-of-tree, v56.  No dice.  There's something I'm missing, I'm just not
sure where else to look.

Some details:
	The VPN server and the AoE server are one in the same for now.
	Moving the AoE server didn't help.
	All other connectivity is fine, ping, ssh, etc.
	
This is beyond trying to do anything practical, now.  I just want to
find my gap in knowledge and fill it.  I've tried the aoetools-discuss
mailinglist, with no luck.

If anyone has a suggestion on where else to look in the kernel, I'd
appreciate it.  If it is a bug, I'll fix it and shoot a patch to the
maintainer of the code.  I think I've just gotten myself wrapped around
the axle with this problem... :-)

thx,

Jason.
