From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: Host IP address
Date: Wed, 23 Feb 2005 00:26:08 +0000
Message-ID: <16923.52640.306669.975526@gargle.gargle.HOWL>
References: <200502221751.44585.hitoc_mail@yahoo.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <200502221751.44585.hitoc_mail@yahoo.it>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: HIToC <hitoc_mail@yahoo.it>
Cc: linux-c-programming@vger.kernel.org


HIToC wrote:

> Sometimes is useful to know the IP address of the machine we are working on,
> for example when we connect a SMTP server and do the EHLO <domain> command.
> I have written a short C++ program that first prints the host name and the
> host IP address, then if arguments from command line are passed prints
> the IP address of each domain name.

> My intent is to know my real IP address!

A system may have any number of IP addresses, including zero. You
can't assume that there is exactly one IP address.

Also, the results obtained from gethostname() and gethostbyname()
aren't necessarily correct. That just tells you what your hostname
resolves to using whatever name resolution method(s) your system is
configured to use (e.g. /etc/hosts, DNS, NIS etc).

If you want to determine the IP addresses of any local interfaces,
first obtain a list of interfaces by either calling ioctl(SIOCGIFCONF)
or parsing /proc/net/dev. Then call ioctl(SIOCGIFADDR) for each
interface to obtain its address. See the source code for "ifconfig"
(from the net-tools package) for more details.

-- 
Glynn Clements <glynn@gclements.plus.com>
