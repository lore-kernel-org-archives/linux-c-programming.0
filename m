From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: Is there a portable alternative to mount() ?
Date: Thu, 16 Aug 2007 19:19:12 +0100
Message-ID: <18116.38176.604368.535517@cerise.gclements.plus.com>
References: <46C47FB2.3060101@hp.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <46C47FB2.3060101@hp.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Bryan Christ <bryan.christ@hp.com>
Cc: linux-c-programming@vger.kernel.org


Bryan Christ wrote:

> Is there a portable alternative to mount() ?

In general, no.

Running the "mount" program will work for simple cases (e.g.
"mount <dir>" where <dir> is in /etc/fstab) on most Unix systems.

Beyond that, the names of devices, the types of filesystem which are
supported, etc, are all highly platform specific.

-- 
Glynn Clements <glynn@gclements.plus.com>
