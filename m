From: Chris Donovan <alienresidents@gmail.com>
Subject: Re: UDP data
Date: Fri, 11 Feb 2011 07:49:15 +1100
Message-ID: <AANLkTim1gLHdVNWVADCi=TEFtyTfPKiwV0AyP8F_JeVK@mail.gmail.com>
References: <AANLkTimck7ar6JPzSnNZo_baTz1usHLeUFxkL8GaqriV@mail.gmail.com>
	<AANLkTi=VisvB732h_jzXcDj5_t7b96QAvJuXYiuOvEj8@mail.gmail.com>
	<op.vqb09uit3l0zgt@mnazarewicz.zrh.corp.google.com>
	<1297309262.2205.14.camel@godart>
	<AANLkTik991ekzViW3e_amoNiO=4LB30snwbvDrwu61Nz@mail.gmail.com>
	<1297314869.2205.48.camel@godart>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:in-reply-to:references:date
         :message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=BqQ5gFz8r0C88ER34rRqVgVJrqd9ahd75EAMkY5+DG4=;
        b=LMym8y+4tyhjK7193gLknfoB6OkLtGhk9mR+lUezV00GKTbz0ZEItK9InHKG509ph3
         E5vf2dElUBFXcQMEgtpy8wpHQA2DzxRE5IVEr2QY51x5oV+skKdV7Uch7TLPzpHCcQZL
         rjr+3aGTJW/z7UvN5PCboM3Gg1blw+h3I9ZE4=
In-Reply-To: <1297314869.2205.48.camel@godart>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Randi <nightdecoder@gmail.com>
Cc: linux-c-programming@vger.kernel.org

I don't know libc, so I don't know what functions libc has to compute
(if any) the checksum.

I did find this page, that has some sample code though...
http://stackoverflow.com/questions/3737612/raw-socket-sendto-failed-usi=
ng-c-on-linux

Chris-

On Thu, Feb 10, 2011 at 4:14 PM, Randi <nightdecoder@gmail.com> wrote:
> Chris, optional means it can be enable or not, how to enable it and g=
et
> the header to verify the checksum.
>
>
> On Thu, 2011-02-10 at 15:14 +1100, Chris Donovan wrote:
>> Yes the checksum is for the header and data.
>> Keep in mind that the checksum value is optional in ipv4, but requir=
ed in ipv6.
>>
>> Chris-
>>
>> On Thu, Feb 10, 2011 at 2:41 PM, Randi <nightdecoder@gmail.com> wrot=
e:
>> > Hi All,
>> >
>> > =A0 =A0 =A0 =A0Since UDP socket is not reliable, what the common w=
ay in user level to
>> > check UDP communication's data for error (eg. malformed, corrupted=
,
>> > etc.)? is the checksum field in the UDP header (struct udphdr) int=
ended
>> > to this problem?
>> >
>> > =A0 =A0 =A0 =A0Randi
>
>
--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
