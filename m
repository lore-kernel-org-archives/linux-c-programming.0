From: David Astua <dastuam@gmail.com>
Subject: Re: UDP data
Date: Thu, 10 Feb 2011 12:43:38 -0600
Message-ID: <AANLkTik7CDfK1XbNccb9=Gb_18d1bLP+ZaZiPNLWP6hN@mail.gmail.com>
References: <AANLkTimck7ar6JPzSnNZo_baTz1usHLeUFxkL8GaqriV@mail.gmail.com>
	<AANLkTi=VisvB732h_jzXcDj5_t7b96QAvJuXYiuOvEj8@mail.gmail.com>
	<op.vqb09uit3l0zgt@mnazarewicz.zrh.corp.google.com>
	<1297309262.2205.14.camel@godart>
	<AANLkTik991ekzViW3e_amoNiO=4LB30snwbvDrwu61Nz@mail.gmail.com>
	<1297314869.2205.48.camel@godart>
	<19796.1824.862218.276072@cerise.gclements.plus.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:in-reply-to:references:date
         :message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=n6uUxglUMTRmjOpww3dZDxAwZg0pIrpzdJzT6h4P1zs=;
        b=pcYCgiF2hxh609ZIn56+NHCYdstqpJaBTkEFyAXgBq8n7r1qSHCqDuPWcP/JjB55K/
         OFFQKh+O0hGD2lS14YRvaRJPjNNTBfj/f4kVbHThd9HWxkp9b6Pv/7d93HINSXnIN6Ke
         mEJQ7MFukAwG30nvMI0pgLZ5tcxY8xzyACTE4=
In-Reply-To: <19796.1824.862218.276072@cerise.gclements.plus.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Randi <nightdecoder@gmail.com>
Cc: linux-c-programming@vger.kernel.org

On Thu, Feb 10, 2011 at 9:41 AM, Glynn Clements
<glynn@gclements.plus.com> wrote:
>
> Randi wrote:
>
>> > Yes the checksum is for the header and data.
>> > Keep in mind that the checksum value is optional in ipv4, but requ=
ired in ipv6.
>>
>> Chris, optional means it can be enable or not, how to enable it and =
get
>> the headehttps://mail.google.com/mail/?shva=3D1#inbox/12e0da8d716c91=
4er to verify the checksum.
>
> Checksums are enabled by default. You can disable checksums when
> sending using the SO_NO_CHECK option. On receipt, the kernel will
> verify the checksum if it's present, and discard the packet if there
> is an error.
>
> --
> Glynn Clements <glynn@gclements.plus.com>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-c-pro=
gramming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>

Also keep in mind that the check is for individual frames, even
checking that there's no certainty that all frames will arrive.

  -- David A.
--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
