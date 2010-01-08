From: Michal Nazarewicz <mina86@tlen.pl>
Subject: Re: float
Date: Fri, 08 Jan 2010 18:11:48 +0100
Message-ID: <87hbqwwmgb.fsf@erwin.mina86.com>
References: <a24b3c171001080830l4bb72defr32b60386e4e45ae9@mail.gmail.com>
	<4B476184.9070407@wired-net.gr>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:sender:from:to:cc:subject
         :references:x-url:x-pgp-fp:x-pgp:date:in-reply-to:message-id
         :user-agent:mime-version:content-type;
        bh=bcmNtaDMc5rRLufJF6P3WPuCt8OTGslrumRidwD7QB8=;
        b=D/XVZ5axNXBZpjPP+P79e39NAOtpQr+VbPfZvYYCrxfjJLAcUrlYYHO1J3qSDZTUr8
         VrukGdkzdMKXZNyXtCl14X1v2/5aqyKVapa8wh5SAGtcnbHt5wlCQqKPLq5oT2zn/HpY
         uwCQLVoWuMFQbRwpSmU/6Ef0REp0BWaCvgiJ0=
In-Reply-To: <4B476184.9070407@wired-net.gr> (Nanakos Chrysostomos's message
	of "Fri, 08 Jan 2010 18:47:00 +0200")
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nanakos Chrysostomos <linuxcprog@wired-net.gr>
Cc: phoenixxz <vim.xxz@gmail.com>, linux-c-programming@vger.kernel.org

> On 8/1/2010 18:30, phoenixxz wrote:
>> float i=1.34;
>> printf("%f",i);
>>
>> ->> 0
>> why?

Nanakos Chrysostomos <linuxcprog@wired-net.gr> writes:
> printf("%lf",i);

%lf is actually invalid format (though glibc will gladly treat it the
 same way it treats %f).  When passing a float value to a function with
 variable number of arguments it is promoted to double.

-- 
Best regards,                                         _     _
 .o. | Liege of Serenly Enlightened Majesty of      o' \,=./ `o
 ..o | Computer Science,  Michal "mina86" Nazarewicz   (o o)
 ooo +--<mina86*tlen.pl>--<jid:mina86*jabber.org>--ooO--(_)--Ooo--
