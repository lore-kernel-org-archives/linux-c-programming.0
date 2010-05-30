From: Michal Nazarewicz <mina86@tlen.pl>
Subject: Re: C Question
Date: Sun, 30 May 2010 14:38:32 +0200
Message-ID: <87r5ktfttj.fsf@erwin.mina86.com>
References: <AANLkTimNataepVFhtn4kSv_kGv1wTBHMAOgeZTK0hgW-@mail.gmail.com>
	<87r5l09pjt.fsf@erwin.mina86.com>
	<AANLkTilJ0HUomkRuJwrywTcmVoeAAmQb2MTZbwoT57fn@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:sender:from:to:cc:subject
         :references:x-face:face:x-url:x-pgp-fp:x-pgp:date:in-reply-to
         :message-id:user-agent:mime-version:content-type;
        bh=JO/a9p9K/iH7nkIZxkc2W86AlXoqtl9DCDIVNlMVmRM=;
        b=cjQSbadhXekufePbtGkjCLLiOxMvi81iYVEtCckTMwKOxYA7QDqfiIRWYP572HIqQL
         +Ni9xO4C6L5cxeJEbdIc530jL/jSmrVrNOFUrqJMEbfifdhdmMTYmEkv4H/5bBJxj3Qa
         PXgeD7ERJ7fjGaFOV3K9MN+0s+AEVtCXrMSWk=
In-Reply-To: <AANLkTilJ0HUomkRuJwrywTcmVoeAAmQb2MTZbwoT57fn@mail.gmail.com>
	(Randi Botse's message of "Sun, 30 May 2010 17:41:18 +0700")
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Randi Botse <nightdecoder@gmail.com>
Cc: linux-c-programming@vger.kernel.org

Randi Botse <nightdecoder@gmail.com> writes:
> Yes, the N_(x) macro used for localization that i discard in my question.
>
> Sorry but, i just having another question, consider this code:
>
> const char *my_strings[] = {
>     [0] = "index0",
>     [4] = "index4",
>     [6] = "index6"
> };

NULLs will be written at indexes 1, 2, 3 and 5.  There will be total of
7 pointers (the last one will point to "index6").

-- 
Best regards,                                         _     _
 .o. | Liege of Serenly Enlightened Majesty of      o' \,=./ `o
 ..o | Computer Science,  Michal "mina86" Nazarewicz   (o o)
 ooo +--<mina86-tlen.pl>--<jid:mina86-jabber.org>--ooO--(_)--Ooo--
