From: John Richard Moser <nigelenki@comcast.net>
Subject: Re: SIOCGMIIPHY and SIOCGIFCONF
Date: Wed, 07 Jul 2004 17:34:52 -0400
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <40EC6C7C.5060601@comcast.net>
References: <40EBA6C7.902@hq.ntsp.nec.co.jp> <16619.46077.597047.403056@cerise.nosuchdomain.co.uk> <40EBB81E.2000409@hq.ntsp.nec.co.jp>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <40EBB81E.2000409@hq.ntsp.nec.co.jp>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Lejanson C. Go" <lejanson@ntsp.nec.co.jp>
Cc: Glynn Clements <glynn.clements@virgin.net>, linux-c-programming@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

SIOCGIFCONF tells you if the interface is administratively down.
SIOMIIPHY tells you if the link is active.

Thus, you have three interesting states, similar to those on a CISCO router:

"Interface is administratively down."
The interface is disabled, i.e. via ifconfig.

"Interface is up, link is down."
The interface is enabled, i.e. via ifconfig; the link is physically
down, i.e. no cable.

"Interface is up, link is up."
The interface is enabled, and the link is physically up and usable.
Pinging accross this to another up/up interface attached to the opposite
end of the cable should be possible.

For cards without an MII controller, the best you can get is:
"Interface is up, link state unknown."

Lejanson C. Go wrote:
|
| Does most ethernet interface support MII interface? I also
| tried SIOCGIFCONF but even if the cable is unplugged it will
| still report LINK UP while SIOCGMIIPHY returns LINK DOWN when
| the cable is unplugged.
|
| How will I be able to override the SIOCGIFCONF so I can support
| all network interfaces? I already tried using SIOCGMIIPHY and its
| okay. But I am looking for ways to override the SIOCGIFCONF
| behavior.
|
| Thanks alot.
|
|
| Glynn Clements wrote:
|
|> Lejanson C. Go wrote:
|>
|>
|>> I am a newbie in this list. I am bit confused in this 2 flags.
|>> I am planning to make a network program which determines if the
|>> interface is still up, down or unknown in real time.
|>> Which of the 2 should I used? Which is more advisable?
|>
|>
|>
|> SIOCGIFCONF returns the "logical" status of the interface. SIOCGMIIPHY
|> returns the contents of MII registers directly from the hardware.
|>
|> SIOCGIFCONF will tell you if the interface is enabled, but it won't
|> tell you e.g. whether the ethernet cable is plugged in. OTOH,
|> SIOCGIFCONF works on all network interfaces, while SIOCGMIIPHY only
|> works on ethernet interfaces, and only on those which support the MII
|> interface.
|>
|
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iD8DBQFA7Gx7hDd4aOud5P8RApGmAJ92J239z12Dk6e0O7M8DEDFibvU6ACfWaSJ
IQZlcPmpHIT6axYEoWR9znU=
=1kBS
-----END PGP SIGNATURE-----
