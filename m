From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: SIOCGMIIPHY and SIOCGIFCONF
Date: Wed, 7 Jul 2004 09:27:41 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <16619.46077.597047.403056@cerise.nosuchdomain.co.uk>
References: <40EBA6C7.902@hq.ntsp.nec.co.jp>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <40EBA6C7.902@hq.ntsp.nec.co.jp>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Lejanson C. Go" <lejanson@ntsp.nec.co.jp>
Cc: linux-c-programming@vger.kernel.org


Lejanson C. Go wrote:

> I am a newbie in this list. I am bit confused in this 2 flags.
> I am planning to make a network program which determines if the
> interface is still up, down or unknown in real time.
> Which of the 2 should I used? Which is more advisable?

SIOCGIFCONF returns the "logical" status of the interface. SIOCGMIIPHY
returns the contents of MII registers directly from the hardware.

SIOCGIFCONF will tell you if the interface is enabled, but it won't
tell you e.g. whether the ethernet cable is plugged in. OTOH,
SIOCGIFCONF works on all network interfaces, while SIOCGMIIPHY only
works on ethernet interfaces, and only on those which support the MII
interface.

-- 
Glynn Clements <glynn.clements@virgin.net>
