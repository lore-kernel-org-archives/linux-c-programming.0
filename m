From: Michal Nazarewicz <mina86@tlen.pl>
Subject: Re: Error in compiling a module
Date: Wed, 28 Jul 2010 00:30:25 +0200
Message-ID: <87bp9slfr2.fsf@erwin.mina86.com>
References: <AANLkTikcGVVaofeUZtvPs+jpA11uXs-baTZ8O8NvH94i@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:sender:from:to:cc:subject
         :references:x-face:face:x-url:x-pgp-fp:x-pgp:date:in-reply-to
         :message-id:user-agent:mime-version:content-type;
        bh=dl8L153XZ1CPfwI0W0t62EntyMKtLZ1oKp7dBgymTCU=;
        b=K5lcbnQZFdmnr8Re7RGGUTx6sqd1MvYdHAPgHnta3/ciqwJDLEWWDbswkHIAt+bnXh
         cgqKVctNK0fB6b7bJw0jv6HirdSPkF7s9xxec9SGgrJufKVXE4LPx7VYlu9gO0TlmtsW
         YOqhtMAdqZtauNxCwNfPAGeuelUuLF1ysOYLo=
In-Reply-To: <AANLkTikcGVVaofeUZtvPs+jpA11uXs-baTZ8O8NvH94i@mail.gmail.com>
	(Balachandar's message of "Tue, 27 Jul 2010 17:17:48 -0400")
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Balachandar <bala1486@gmail.com>
Cc: kernelnewbies@nl.linux.org, linux-c-programming@vger.kernel.org

Balachandar <bala1486@gmail.com> writes:
>  I am trying add a new network protocol family to the kernel. But i
> get the following error for .h file  '11: two or more data types in
> declaration specifiers

You've probably forgotten about semicolon when declaring a structure
before the function.

> In .h file
>
> 11: int sock_ucnet_create(struct net *net, struct socket *sock, int
> protocol, int KERN);

-- 
Best regards,                                         _     _
 .o. | Liege of Serenly Enlightened Majesty of      o' \,=./ `o
 ..o | Computer Science,  Michal "mina86" Nazarewicz   (o o)
 ooo +--<mina86-tlen.pl>--<jid:mina86-jabber.org>--ooO--(_)--Ooo--
