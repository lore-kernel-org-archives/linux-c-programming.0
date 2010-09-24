From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: pthread_once
Date: Fri, 24 Sep 2010 18:59:09 +0100
Message-ID: <19612.59117.84253.497561@cerise.gclements.plus.com>
References: <20100924083614.1E6E32C2@resin07.mta.everyone.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20100924083614.1E6E32C2@resin07.mta.everyone.net>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ajhwb@knac.com
Cc: ratheesh.ksz@gmail.com, linux-c-programming@vger.kernel.org


Ardhan Madras wrote:

> > pthread_once is defined in libpthread, which you should be linking
> > against if you're using librt.
> 
> Sory but did you mean we also need linking to libpthread when using librt?

Yes; librt requires libpthread. If you use shared libraries, it should
get linked automatically, but that doesn't work with static libraries.

-- 
Glynn Clements <glynn@gclements.plus.com>
