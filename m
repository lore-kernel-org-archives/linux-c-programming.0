From: "Anatoly Sivov" <mm05@mail.ru>
Subject: Re: warning message on macro.
Date: Fri, 17 Aug 2012 18:24:27 +0400
Message-ID: <op.wi6vm1mxfzo5me@stalin>
References: <CAGZFCEE1bJ8zTDfxjnjhuy75Ly64gh38zhJOX491fUYWZROMcA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru; s=mail;
	h=In-Reply-To:Message-ID:From:Content-Transfer-Encoding:MIME-Version:Date:References:Subject:To:Content-Type; bh=nF9/R4kaCoUpSGQCWFaR4n9/gmiOQub7Pdz9scme6Ec=;
	b=ZP3vjmhD/VSK2zmeE3iRR/UVlnjDlH8mAlYibsxE/WC8qBEtS4ZYfWwlT2keRnpuvYfI4gH5RtDcOTZK3q+bHg2fEcs7RMonerth5IeOUD4pZAMJC+nImDmtwouxoj9u;
In-Reply-To: <CAGZFCEE1bJ8zTDfxjnjhuy75Ly64gh38zhJOX491fUYWZROMcA@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"; delsp="yes"
To: linux-c-programming@vger.kernel.org, linux-newbie <linux-newbie@vger.kernel.org>, ratheesh kannoth <ratheesh.ksz@gmail.com>


>
> 1. How can i suppress only this warning. ? I do need all other warnings .
>

Why do you want to suppress this warning instead of fixing it? Your line  
seem to result in some incorrect preprocessor macro. What file does your  
makefile compile when this warning occurs?

BR, Anatoliy Sivov
