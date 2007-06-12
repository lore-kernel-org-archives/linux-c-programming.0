From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: getutline (3) fails on a daemon process
Date: Tue, 12 Jun 2007 16:19:55 +0100
Message-ID: <18030.47515.764472.244603@cerise.gclements.plus.com>
References: <1181660517.5483.8.camel@blr-img.blr.novell.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <1181660517.5483.8.camel@blr-img.blr.novell.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: vadis.list@gmail.com
Cc: linux-c-programming@vger.kernel.org


vadiraj wrote:

> I'm trying to fetch userid using utmp.h API's. I'm able to get the
> userid from the funciton getutline(3) on normal process. But the
> same function while called by a daemon process it fails with perror
> "no such process".
> 
> Any Idea why this is failing on a daemon process? 

Because the daemon hasn't logged itself to the utmp file.

The utmp file is intended for recording "logged-in users". daemon
processes don't normally register themselves.

-- 
Glynn Clements <glynn@gclements.plus.com>
