From: "Lejanson C. Go" <lejanson@ntsp.nec.co.jp>
Subject: Re: SIOCGMIIPHY and SIOCGIFCONF
Date: Wed, 07 Jul 2004 16:45:18 +0800
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <40EBB81E.2000409@hq.ntsp.nec.co.jp>
References: <40EBA6C7.902@hq.ntsp.nec.co.jp> <16619.46077.597047.403056@cerise.nosuchdomain.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <16619.46077.597047.403056@cerise.nosuchdomain.co.uk>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Glynn Clements <glynn.clements@virgin.net>
Cc: linux-c-programming@vger.kernel.org


Does most ethernet interface support MII interface? I also
tried SIOCGIFCONF but even if the cable is unplugged it will
still report LINK UP while SIOCGMIIPHY returns LINK DOWN when
the cable is unplugged.

How will I be able to override the SIOCGIFCONF so I can support
all network interfaces? I already tried using SIOCGMIIPHY and its
okay. But I am looking for ways to override the SIOCGIFCONF
behavior.

Thanks alot.


Glynn Clements wrote:
> Lejanson C. Go wrote:
> 
> 
>>I am a newbie in this list. I am bit confused in this 2 flags.
>>I am planning to make a network program which determines if the
>>interface is still up, down or unknown in real time.
>>Which of the 2 should I used? Which is more advisable?
> 
> 
> SIOCGIFCONF returns the "logical" status of the interface. SIOCGMIIPHY
> returns the contents of MII registers directly from the hardware.
> 
> SIOCGIFCONF will tell you if the interface is enabled, but it won't
> tell you e.g. whether the ethernet cable is plugged in. OTOH,
> SIOCGIFCONF works on all network interfaces, while SIOCGMIIPHY only
> works on ethernet interfaces, and only on those which support the MII
> interface.
> 

-- 
Revenge is best served when cold.

