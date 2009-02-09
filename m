From: Gauvain Pocentek <gauvainpocentek@gmail.com>
Subject: Re: wait for childs of a child process
Date: Mon, 09 Feb 2009 16:29:46 +0100
Message-ID: <49904BEA.50204@gmail.com>
References: <49903BBC.4010802@gmail.com> <200902091656.15412.m.iatrou@freemail.gr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <200902091656.15412.m.iatrou@freemail.gr>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Michael Iatrou <m.iatrou@freemail.gr>
Cc: linux-c-programming@vger.kernel.org

Michael Iatrou wrote:
> When the date was Monday 09 February 2009, Gauvain Pocentek wrote:
> 
>> I have to monitor applications on a system (users who run the
>> application, how long, etc.), but I'm having troubles with applications
>> which fork during startup (openoffice for instance).
> 
> Are you sure that the process accounting on Linux doesn't cover your needs 
> and you need a custom solution?

Well I wasn't aware that such tool existed. It will probably help to use this
instead of reinventing the wheel.

Thanks to you and ben (who had the same idea).

Gauvain

NB: sorry for the typo in the subject.
