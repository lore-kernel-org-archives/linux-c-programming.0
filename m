From: Eljay Love-Jensen <eljay@adobe.com>
Subject: Re: Memory Allocation Problem
Date: Wed, 15 Sep 2004 07:01:29 -0500
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <6.1.2.0.2.20040915065922.03539130@iplan-mn.corp.adobe.com>
References: <20040915060237.55405.qmail@web52910.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-reply-to: <20040915060237.55405.qmail@web52910.mail.yahoo.com>
References: <20040915060237.55405.qmail@web52910.mail.yahoo.com>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ankit Jain <ankitjain1580@yahoo.com>, gcc <gcc-help@gcc.gnu.org>, linux prg <linux-c-programming@vger.kernel.org>

Hi Ankit,

Your OS probably does not provide that many megabytes of STACK space.

Allocate your enormous 2-dimensional array on the HEAP or in the BSS or in 
the DATA areas instead.

Or check out if your can adjust the size of your STACK to around 32 
MB.  That might be a linker option.  Depends on your OS.

HTH,
--Eljay

