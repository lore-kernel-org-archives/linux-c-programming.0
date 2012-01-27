From: "Allan, Bruce W" <bruce.w.allan@intel.com>
Subject: boolean result from a test for a bit
Date: Fri, 27 Jan 2012 20:29:13 +0000
Message-ID: <804857E1F29AAC47BF68C404FC60A1842485E4@ORSMSX102.amr.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
To: "linux-c-programming@vger.kernel.org" <linux-c-programming@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

For a simple boolean test of whether, for example, bit 5 is set in the variable 'flags', which of the following methods is preferred over the other?

bool result = (flags & (1 << 5)) ? true : false;

or

bool result = !!(flags & (1 << 5));

I've seen examples of both in the Linux kernel.

Thanks,
Bruce.
