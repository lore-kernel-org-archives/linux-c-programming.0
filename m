From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: Division in loop
Date: Wed, 9 Sep 2009 01:49:30 +0100
Message-ID: <19110.64410.498993.60369@cerise.gclements.plus.com>
References: <34e1241d0909080740m5a3c3098xa48f275f2cf2fd3b@mail.gmail.com>
	<20090908145838.GF947@comcast.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20090908145838.GF947@comcast.net>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Tim Walberg <twalberg@comcast.net>
Cc: Randi Botse <nightdecoder@gmail.com>, linux-c-programming@vger.kernel.org


Tim Walberg wrote:

> Maybe you want "(bytes * 100) / size"?

However, if int and size_t are 32-bit, that will overflow at around
20 or 40 MB (20 for signed, 40 for unsigned), which isn't really all
that much. Converting to either double or long long might be wise,
i.e.

	percent = (int)(bytes * 100.0) / size;
or:
	percent = (int)(bytes * 100LL) / size;

-- 
Glynn Clements <glynn@gclements.plus.com>
