From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: sockets -> MTU (Maximum Transfer Unit)
Date: Fri, 25 Jul 2003 04:06:38 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <16160.40638.795275.541340@cerise.nosuchdomain.co.uk>
References: <1059094069.974.4.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <1059094069.974.4.camel@localhost.localdomain>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ramzez <r4mz3z@yahoo.es>
Cc: linux-newbie <linux-newbie@vger.kernel.org>, linux-c-programming@vger.kernel.org


ramzez wrote:

>   In my C app, How do I can know the MTU (Maximum Transfer Unit) of my
> net?

You can obtain the MTU of an interface with ioctl(SIOCGIFMTU), e.g.

	const char if_name[] = "eth0";
	struct ifreq ifr;
	int fd;

	fd = socket(PF_INET, SOCK_DGRAM, IPPROTO_IP);

	strcpy(ifr.ifr_name, if_name);
	ioctl(fd, SIOCGIFMTU, &ifr);

	printf("MTU of %s is %d\n", if_name, ifr.ifr_mtu);

Assuming that path MTU discovery is enabled, you can obtain the path
MTU of an individual connection using getsockopt(SOL_IP, IP_MTU), e.g.

	int mtu;
	int mtulen = sizeof(mtu);

	getsockopt(skt, SOL_IP, IP_MTU, &mtu, &mtulen);

-- 
Glynn Clements <glynn.clements@virgin.net>
