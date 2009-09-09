From: Randi Botse <nightdecoder@gmail.com>
Subject: Re: Division in loop
Date: Wed, 9 Sep 2009 17:12:56 +0700
Message-ID: <34e1241d0909090312w22fa9d17r18305afa480f8eab@mail.gmail.com>
References: <34e1241d0909080740m5a3c3098xa48f275f2cf2fd3b@mail.gmail.com>
	 <34e1241d0909081937y5ecbd0davf7edbba9d9b201a0@mail.gmail.com>
	 <34e1241d0909081939x2d20ab45t57fe3f760ae447d0@mail.gmail.com>
	 <200909082157.38271.eric@cisu.net>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type;
        bh=2rBK1l+A/j6+oSFujf+TUXbm51Jlgx/l1SempnZpHTg=;
        b=wAEmB849Z/DemDeKP4+Zp9ZJpGHYz3RIKojf/BOGUrR3WVfdapOhVu7id/Hz2Rwm0S
         /N2Ov7dl+FgwXp/uoRE/+zXiRdLsWd6HUNgps+wOkzG+GrO3Yasl3DkeCuV/SObogMs8
         nTdddwgdegBcI0C2cn8n7bkgiEBEVwEbroKIo=
In-Reply-To: <200909082157.38271.eric@cisu.net>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: eric@cisu.net
Cc: linux-c-programming@vger.kernel.org

No matter i print to unbuffered stderr or stdin, the message will not printed...
whether the loop is quite fast? so there are no chance to printf()
output the message?


On Wed, Sep 9, 2009 at 9:57 AM, Eric Bambach<bot403@cisu.net> wrote:
>
> Wow. I feel silly. Ignore my previous message. It's late here and I missed the
> fflush().
>
