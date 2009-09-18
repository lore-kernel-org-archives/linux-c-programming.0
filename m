From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: ioctl() to get information of wlan mode (a/b/g/n) ?
Date: Fri, 18 Sep 2009 16:18:04 +0100
Message-ID: <19123.42156.354954.300504@cerise.gclements.plus.com>
References: <c93f91ee0909180511k5bb4f2dcu4f3509dcd3281a66@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <c93f91ee0909180511k5bb4f2dcu4f3509dcd3281a66@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: leo mueller <llug.dan@googlemail.com>
Cc: linux-c-programming@vger.kernel.org


leo mueller wrote:

> is there a possibility to determine in which wlan mode my card/driver
> currently works?
> like an ioctl()-call or sth... ?

You might be able to get it using ioctl(SIOCGIWNAME); this returns a
string describing the interface, but some drivers just return the
driver name. The parameter is a pointer to a "union iwreq_data"
(defined in linux/wireless.h); the name field will be filled by the
ioctl.

> is it also possible to fetch wlan
> statistics (rx/tx) via ioctl()?
> if yes, which params are neccessary?

You can get packet/byte counts for any interface from /proc/net/dev.

-- 
Glynn Clements <glynn@gclements.plus.com>
