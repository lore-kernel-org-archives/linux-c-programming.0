From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: newby.-interpreting C
Date: Thu, 30 Dec 2004 11:26:08 +0000
Message-ID: <16851.58832.659413.893211@gargle.gargle.HOWL>
References: <cq77vi$1ej$1@sea.gmane.org>
	<20041220211709.GD2460@lug-owl.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20041220211709.GD2460@lug-owl.de>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org


Jan-Benedict Glaw wrote:

> General rule: if you don't *need* this for a good reason, or if you even
> don't know what it does, you don't need it, since it also introduces a
> performance penalty: CPUs tend to be fast at naturally aligned memory
> accesses, but quite slow on non-aligned accesses.

On most processor types, unaligned accesses will fail (either generate
an exception or return bogus data). The x86 family is the exception,
in that unaligned access merely reduces performance.

-- 
Glynn Clements <glynn@gclements.plus.com>
