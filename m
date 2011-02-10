From: Chris Donovan <alienresidents@gmail.com>
Subject: Re: UDP data
Date: Thu, 10 Feb 2011 15:14:26 +1100
Message-ID: <AANLkTik991ekzViW3e_amoNiO=4LB30snwbvDrwu61Nz@mail.gmail.com>
References: <AANLkTimck7ar6JPzSnNZo_baTz1usHLeUFxkL8GaqriV@mail.gmail.com>
	<AANLkTi=VisvB732h_jzXcDj5_t7b96QAvJuXYiuOvEj8@mail.gmail.com>
	<op.vqb09uit3l0zgt@mnazarewicz.zrh.corp.google.com>
	<1297309262.2205.14.camel@godart>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:in-reply-to:references:date
         :message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=gOuU+XA4nXTJUNNVz6bB8/PELD6cblmxy88elKb3Ja0=;
        b=IDM1wwi7wEdljxMxIkLOB851xcGDJIzfVAdMYBcMxVfzM33T1qVr460BBIyBryZ/mq
         eH7a0KGdbHu43mrEQRk3sD/0eSFbt0B34kJXpEOory3PtwzvzJcxSg4rfn159Dr3aRCe
         eUro7MrqWkMxVKS+6T7LQKWv4n249WoQE3ZaI=
In-Reply-To: <1297309262.2205.14.camel@godart>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Randi <nightdecoder@gmail.com>
Cc: linux-c-programming@vger.kernel.org

Yes the checksum is for the header and data.
Keep in mind that the checksum value is optional in ipv4, but required =
in ipv6.

Chris-

On Thu, Feb 10, 2011 at 2:41 PM, Randi <nightdecoder@gmail.com> wrote:
> Hi All,
>
> =A0 =A0 =A0 =A0Since UDP socket is not reliable, what the common way =
in user level to
> check UDP communication's data for error (eg. malformed, corrupted,
> etc.)? is the checksum field in the UDP header (struct udphdr) intend=
ed
> to this problem?
>
> =A0 =A0 =A0 =A0Randi
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-c-pro=
gramming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
