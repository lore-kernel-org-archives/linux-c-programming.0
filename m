From: Michal Nazarewicz <mina86@tlen.pl>
Subject: Re: C Question
Date: Tue, 25 May 2010 13:41:26 +0200
Message-ID: <87r5l09pjt.fsf@erwin.mina86.com>
References: <AANLkTimNataepVFhtn4kSv_kGv1wTBHMAOgeZTK0hgW-@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:sender:from:to:cc:subject
         :in-reply-to:references:user-agent:x-face:face:x-url:x-pgp-fp:x-pgp
         :date:message-id:mime-version:content-type;
        bh=4G3yGD+CjoHFBJc3tihAL12RTS4h/2Tpglpu8K/FUB0=;
        b=k0h04VQGTX933ut1sd9UhmSRBihnTC9NjNOVHz47d1VQGgjf7fWiXkNoW8kW3XjRhF
         CSoCeDJfVtJ8kD4Cj5TsmAsyzKRNRY76oByslKvOR/bzQqsvKSiDwGNhBfCXRhLzanRO
         E8yuRxIYsrBoumXRodlSMuX0DsJwID9DAL9XA=
In-Reply-To: <AANLkTimNataepVFhtn4kSv_kGv1wTBHMAOgeZTK0hgW-@mail.gmail.com>
	(Randi Botse's message of "Tue, 25 May 2010 17:08:52 +0700")
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Randi Botse <nightdecoder@gmail.com>
Cc: linux-c-programming@vger.kernel.org

Randi Botse <nightdecoder@gmail.com> writes:

> Hi All,
>
> Im looking at lscpu.c shipped by util-linux-ng-2.17, can you explain
> me how the *vir_types[] declared, is this valid C declaration?
>
> /* virtualization types */
> enum {
> 	VIRT_NONE	= 0,
> 	VIRT_PARA,
> 	VIRT_FULL
> };
> const char *virt_types[] = {
> 	[VIRT_NONE]	= N_("none"),
> 	[VIRT_PARA]	= N_("para"),
> 	[VIRT_FULL]	= N_("full")
> };

As Xiaotian Feng said, N_(x) must be defined somewhere and additionally
to this this definition uses a new syntax where you can specify indexes
of elements you want to set value to, ie. the above is the same as:

const char *virt_types[] = {
	[0]	= N_("none"),
	[1]	= N_("para"),
	[2]	= N_("full")
};

which in turn is the same as:

const char *virt_types[] = {
	N_("none"),
	N_("para"),
	N_("full")
};

The advantage of the new syntax is that you can specify values in any
order and omit some.

-- 
Best regards,                                         _     _
 .o. | Liege of Serenly Enlightened Majesty of      o' \,=./ `o
 ..o | Computer Science,  Michal "mina86" Nazarewicz   (o o)
 ooo +--<mina86-tlen.pl>--<jid:mina86-jabber.org>--ooO--(_)--Ooo--
