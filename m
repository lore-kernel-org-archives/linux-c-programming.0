From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: ioctl command FIONREAD
Date: Mon, 20 May 2002 13:59:10 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <15592.62238.390702.8081@cerise.nosuchdomain.co.uk>
References: <3CE8B6A8.92F8E7E@unidec.ro>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <3CE8B6A8.92F8E7E@unidec.ro>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Bubulac Tatiana <bubulac@unidec.ro>
Cc: linux-c-programming@vger.kernel.org


Bubulac Tatiana wrote:

> Does anyone know what FIONREAD ioctl command does means? I use SCO Open
> Server 5.05.

As Harvinder says, it reports the number of bytes available for
reading from a descriptor.

> In Linux this command does not exist.

Yes it does.

-- 
Glynn Clements <glynn.clements@virgin.net>
