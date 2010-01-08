From: Michal Nazarewicz <mina86@tlen.pl>
Subject: Re: float
Date: Fri, 08 Jan 2010 18:43:27 +0100
Message-ID: <87d41kwkzk.fsf@erwin.mina86.com>
References: <a24b3c171001080830l4bb72defr32b60386e4e45ae9@mail.gmail.com>
	<4B476184.9070407@wired-net.gr> <87hbqwwmgb.fsf@erwin.mina86.com>
	<4B47699B.7000906@wired-net.gr>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:sender:from:to:cc:subject
         :references:x-url:x-pgp-fp:x-pgp:date:in-reply-to:message-id
         :user-agent:mime-version:content-type;
        bh=c5HWx19PXPj2Myt4H/IwXX8qfbrNlxjnxTWEVmJKASc=;
        b=MY6rHgRZJFWwOjSd2iT9s0lulTHDTI9oXTh1TVBxF5ONF09kBYeSu5PNgOhNSzeLAE
         i+vuSFnBmmCpISoehS4Fh26FvDB0iKr/TP1VvLcy98jjYhmGW9GKAawYBRz6wiNHTDSK
         9rHoC3mWqNgXhmByQdP+rKA/Yy8wkInS4Ii3A=
In-Reply-To: <4B47699B.7000906@wired-net.gr> (Nanakos Chrysostomos's message
	of "Fri, 08 Jan 2010 19:21:31 +0200")
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nanakos Chrysostomos <linuxcprog@wired-net.gr>
Cc: phoenixxz <vim.xxz@gmail.com>, linux-c-programming@vger.kernel.org

> On 8/1/2010 19:11, Michal Nazarewicz wrote:
>> %lf is actually invalid format (though glibc will gladly treat it the
>>  same way it treats %f).  When passing a float value to a function with
>>  variable number of arguments it is promoted to double.

Nanakos Chrysostomos <linuxcprog@wired-net.gr> writes:
> it could be then.
>
> printf("%f",(double)i);

Expect explicit cast is not required here as (in case of "..."
arguments) it is done implicitly as I described.

-- 
Best regards,                                         _     _
 .o. | Liege of Serenly Enlightened Majesty of      o' \,=./ `o
 ..o | Computer Science,  Michal "mina86" Nazarewicz   (o o)
 ooo +--<mina86*tlen.pl>--<jid:mina86*jabber.org>--ooO--(_)--Ooo--
