From: Eljay Love-Jensen <eljay@adobe.com>
Subject: Re: soft real-time scheduling
Date: Sun, 26 Sep 2004 10:13:14 -0500
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <6.1.2.0.2.20040926101237.01efb738@iplan-mn.corp.adobe.com>
References: <20040926140831.62007.qmail@web52901.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-reply-to: <20040926140831.62007.qmail@web52901.mail.yahoo.com>
References: <20040926140831.62007.qmail@web52901.mail.yahoo.com>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ankit Jain <ankitjain1580@yahoo.com>, linux prg <linux-c-programming@vger.kernel.org>
Cc: gcc <gcc-help@gcc.gnu.org>

Hi Ankit,

You forgot to do...

p = malloc(sizeof(struct sched_param));

--Eljay

